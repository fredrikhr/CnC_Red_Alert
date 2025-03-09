;
;	Command & Conquer Red Alert(tm)
;	Copyright 2025 Electronic Arts Inc.
;
;	This program is free software: you can redistribute it and/or modify
;	it under the terms of the GNU General Public License as published by
;	the Free Software Foundation, either version 3 of the License, or
;	(at your option) any later version.
;
;	This program is distributed in the hope that it will be useful,
;	but WITHOUT ANY WARRANTY; without even the implied warranty of
;	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;	GNU General Public License for more details.
;
;	You should have received a copy of the GNU General Public License
;	along with this program.  If not, see <http://www.gnu.org/licenses/>.
;

;***************************************************************************
;**   C O N F I D E N T I A L --- W E S T W O O D    S T U D I O S        **
;***************************************************************************
;*                                                                         *
;*                 Project Name : Westwood Library                         *
;*                                                                         *
;*                    File Name : STAMP.ASM                                *
;*                                                                         *
;*                   Programmer : Joe L. Bostic                            *
;*                                                                         *
;*                   Start Date : August 23, 1993                          *
;*                                                                         *
;*                  Last Update : August 23, 1993   [JLB]                  *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *

; Converted TASM IDEAL to MASM
.386P
.MODEL FLAT
JUMPS

MAX_CACHED_ICONS=300
ICON_WIDTH	=24
ICON_HEIGHT	=24
MAX_ICON_SETS	=100


EXTERNDEF		C IconPointers:dword
EXTERNDEF		C Init_Stamps:near
EXTERNDEF		C IconCacheLookup:word
EXTERNDEF		LastIconset:dword
EXTERNDEF		MapPtr:dword
EXTERNDEF		IconCount:dword
EXTERNDEF		IconSize:dword
EXTERNDEF		StampPtr:dword
EXTERNDEF		IconEntry:dword
EXTERNDEF		IconData:dword

EXTERNDEF		Clear_Icon_Pointers_:near
EXTERNDEF		Cache_Copy_Icon_:near
EXTERNDEF		Is_Icon_Cached_:near
EXTERNDEF		Get_Icon_Index_:near
EXTERNDEF		Get_Free_Index_:near
EXTERNDEF		Cache_New_Icon_:near
EXTERNDEF		Is_Stamp_Registered_:near
EXTERNDEF		Get_Free_Cache_Slot_:near


IconSetType	struc

		IconSetPtr	dd	?
		IconListOffset	dd	?

		ends

EXTERNDEF		C IconSetList:IconSetType

		.code	; converted from TASM: codeseg



;************************************************************************************************
;* Cache_Copy_Icon -- copy an icon to its video memory cache                                    *
;*                                                                                              *
;*                                                                                              *
;* INPUT:	eax - ptr to icon_data                                                          *
;*              edx - ptr to video surface                                                      *
;*              ebx - pitch of video surface                                                    *
;*                                                                                              *
;* OUTPUT:      none                                                                            *
;*                                                                                              *
;* PROTO:       extern "C" Cache_Copy_Icon (void const *icon_ptr ,                              *
;*		VideoSurfaceDescription.lpSurface ,                                             *
;*		VideoSurfaceDescription.lPitch);						*
;*                                                                                              *
;* HISTORY:                                                                                     *
;*   11/8/95 3:16PM ST: Created                                                                 *
;*==============================================================================================*

proc		Cache_Copy_Icon_ near
		pushad

		mov	esi,eax
		mov	edi,edx
		sub	ebx,ICON_WIDTH

		mov	dl,ICON_HEIGHT		;icon height

??each_line_lp:	mov	ecx,ICON_WIDTH/4
		rep	movsd
		lea	edi,[edi+ebx]
		dec	dl
		jnz	??each_line_lp

		popad
		ret

Cache_Copy_Icon_		endp





;************************************************************************************************
;* Is_Icon_Cached -- has an icon been cached? If not, is it cacheable?                          *
;*                                                                                              *
;*                                                                                              *
;* INPUT:	eax - ptr to icon_data                                                          *
;*              edx - icon number                                                               *
;*                                                                                              *
;* OUTPUT:      eax - index of cached icon or -1 if not cached                                  *
;*                                                                                              *
;* PROTO:       extern "C" int Is_Icon_Cached (void const *icon_data , int icon);               *
;*                                                                                              *
;* HISTORY:                                                                                     *
;*   11/8/95 2:16PM ST: Created                                                                 *
;*==============================================================================================*

proc		Is_Icon_Cached_ near

		mov	[IconData],eax		;save the icon data ptr for later
		push	edx
		test	eax,eax
		je	??out

; Initialize the stamp data if necessary.
		cmp	[LastIconset],eax
		je	short ??noreset
		call	Init_Stamps C,eax

; Determine if the icon number requested is actually in the set.
; Perform the logical icon to actual icon number remap if necessary.
??noreset:	cmp	[MapPtr],0
		je	short ??notmap
		push	edi
		mov	edi,[MapPtr]
		mov	dl,[edi+edx]
		pop	edi

??notmap:	cmp	edx,[IconCount]
		jl	??in_range
		pop	edx
		mov	eax,-1
		ret

; See if the stamp is registered - if not then it cant be cached
??in_range:	mov	eax,[IconData]
		call	Is_Stamp_Registered_
		cmp	eax,-1
		jnz	??got_entry
		pop	edx
		ret

; Stamp is registered - if its cached already then just return the index
??got_entry:	mov	eax,[(IconSetType eax).IconListOffset]
		cmp	[word eax+edx*2+IconCacheLookup],-1
		jz	??not_cached

; it is cached and [eax+edx] is the index
		movzx	eax,[word eax+edx*2+IconCacheLookup]
		pop	edx
		ret



;
; The stamps set is registered but we havn't seen this stamp before
; so try caching it
;

??not_cached:	mov	[IconEntry],eax
		add	[IconEntry],edx
		add	[IconEntry],edx
		call	Get_Free_Cache_Slot_
		test	eax,eax
		jge	??got_free_slot
		pop	edx			;eax is -1 here anyway
		ret

; We found a free caching slot so try caching the stamp into it
??got_free_slot:imul	edx,[IconSize]
		add	edx,[StampPtr]
		push	eax
		call	Cache_New_Icon_		;takes icon index in eax, ptr to icon in edx
		test	eax,eax
		jz	??cache_failed


; Success! Add the index into the table
		pop	eax
		mov	edx,[IconEntry]
		mov	[edx+IconCacheLookup],ax
		and	eax,0ffffh
		pop	edx
		ret

; Couldnt cache the new Icon - return -1 to say icon isnt cached
??cache_failed:	pop	eax
??out:		pop	edx
		mov	eax,-1
		ret


Is_Icon_Cached_		endp







;************************************************************************************************
;* Is_Stamp_Registered -- has an icon's set been previously registered?                         *
;*                                                                                              *
;*                                                                                              *
;* INPUT:	eax - ptr to icon_data                                                          *
;*                                                                                              *
;* OUTPUT:      eax - ptr to registration entry or -1 if not registered                         *
;*                                                                                              *
;* PROTO:       extern "C" int Is_Stamp_Registered (void const *icon_data);                     *
;*                                                                                              *
;* HISTORY:                                                                                     *
;*   11/10/95 10:00AM ST: Created                                                               *
;*==============================================================================================*

proc		Is_Stamp_Registered_

		push	edi
		push	ecx
		mov	edi,offset IconSetList
		mov	ecx,MAX_ICON_SETS

??each_set_lp:	cmp	eax,[edi]
		jz	??got_icon_set
		add	edi,size IconSetType
		dec	ecx
		jnz	??each_set_lp
		mov	eax,-1
		pop	ecx
		pop	edi
		ret

??got_icon_set:	mov	eax,edi
		pop	ecx
		pop	edi
		ret

Is_Stamp_Registered_		endp







		.data	; converted from TASM: dataseg


IconEntry	dd	0	;Temporary pointer to icon index entry in table
IconData	dd	0	;Temporary ptr to icon set data



end
