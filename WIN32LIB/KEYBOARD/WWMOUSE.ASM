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
;**   C O N F I D E N T I A L --- W E S T W O O D   A S S O C I A T E S   **
;***************************************************************************
;*                                                                         *
;*                 Project Name : Westwood 32 bit Library                  *
;*                                                                         *
;*                    File Name : BITBLIT.ASM                              *
;*                                                                         *
;*                   Programmer : Philip W. Gorrow			   *
;*                                                                         *
;*                   Start Date : December 12, 1995                        *
;*                                                                         *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *
.386
.MODEL FLAT
OPTION SEGMENT:USE32

INCLUDE <drawbuff.inc>
INCLUDE <gbuffer.inc>
INCLUDE <shape.inc>
INCLUDE <mouse.inc>

EXTERN	C LCW_Uncompress:NEAR
EXTERN	C Get_Shape_Uncomp_Size     :NEAR
EXTERN	C Get_Shape_Width      	  :NEAR
EXTERN	C Get_Shape_Original_Height :NEAR
EXTERN	_ShapeBuffer		  :DWORD

.CODE


;***************************************************************************
;* MOUSE_SHADOW_BUFFER -- Handles storing and restoring the mouse buffer   *
;*                                                                         *
;* INPUT:	MouseClass *		- pointer to mouse class data	   *
;*		GraphicBufferClass *	- screen to draw the mouse on	   *
;*		int x			- x position to store the mouse at *
;*		int y			- y position to store the mouse at *
;*		int store		- whether to store buffer or save  *
;*									   *
;* OUTPUT:	none                                                       *
;*                                                                         *
;* Note: The x and y that this routine expects to receive are based on	   *
;*       the mouse cursor position.  This routine automatically adjusts	   *
;*	 for hot spot, so that adjustment should not be made prior to	   *
;*	 this point.							   *
;*                                                                         *
;* PROTO:	void Mouse_Shadow_Buffer(GraphicBufferClass *src/dest,	   *
;*					void *buffer
;*					int x_pixel,			   *
;*					int y_pixel,			   *
;*					int store);			   *
;*                                                                         *
;* HISTORY:                                                                *
;*   10/27/1994 PWG : Created.                                             *
;*=========================================================================*
	PUBLIC	C Mouse_Shadow_Buffer
Mouse_Shadow_Buffer	PROC	NEAR C USES eax ebx ecx edx edi esi,
	_this:		DWORD,
	src_dst_obj:	DWORD,
	buffer:DWORD,
	x:		DWORD,
	y:		DWORD,
	hotx:		DWORD,
	hoty:		DWORD,
	store:		DWORD,

	local	x0: 		dword
	local	y0: 		dword
	local	x1: 		dword
	local	y1: 		dword
	local	buffx0: 	dword
	local	buffy0: 	dword


	;*=========================================================================*
	; Direction flag must be forward in this routine.
	;*=========================================================================*
	cld

	;*===================================================================
	;* Copy of X, Y, Width and Height into local registers
	;*===================================================================
	mov	esi, [_this]			; get offset to mouse data
	mov	edi, [src_dst_obj]		; get offset to mouse data

	mov	eax, [x]
	mov	ebx, [y]
	sub	eax, [hotx]
	sub	ebx, [hoty]

	mov	[x0], eax
	mov	[y0], ebx
	add	eax, (MouseType PTR [esi]).CursorWidth
	add	ebx, (MouseType PTR [esi]).CursorHeight
	mov	[x1], eax
	mov	[y1], ebx

	mov	[buffx0], 0
	mov	eax, [buffer]
	mov	[buffy0], eax

	;*===================================================================
	;* Bounds check source X.
	;*===================================================================

	xor 	eax, eax
	xor 	edx, edx

	mov	ecx, [x0]
	mov	ebx, [x1]

	shld	eax, ecx, 1
	shld	edx, ebx, 1

	mov	ecx, [x0]
	mov	ebx, [x1]
	sub	ecx, (GraphicViewPort PTR [edi]).GVPWidth
	sub	ebx, (GraphicViewPort PTR [edi]).GVPWidth
	dec	ecx
	dec	ebx
	shld	eax, ecx, 1
	shld	edx, ebx, 1

	mov	ecx, [y0]
	mov	ebx, [y1]
	shld	eax, ecx, 1
	shld	edx, ebx, 1

	mov	ecx, [y0]
	mov	ebx, [y1]
	sub	ecx, (GraphicViewPort PTR [edi]).GVPHeight
	sub	ebx, (GraphicViewPort PTR [edi]).GVPHeight
	dec	ecx
	dec	ebx
	shld	eax, ecx, 1
	shld	edx, ebx, 1

	xor	al, 5
	xor	dl, 5
	mov	ah, al
	test	dl, al
	jnz	??out
	or	al, dl
	jz	??not_clip

	test	ah, 1000b
	jz	??scr_left_ok
	mov	ebx, [x0]
	neg	ebx
	mov	[buffx0], ebx
	mov	[x0], 0

??scr_left_ok:
	test	ah, 0010b
	jz	??scr_bottom_ok
	mov	ebx, [y0]
	neg	ebx
	imul	ebx, (MouseType PTR [esi]).CursorWidth
	add	[buffy0], ebx
	mov	[y0], 0

??scr_bottom_ok:
	test	dl, 0100b
	jz	??scr_right_ok
	mov	eax, (GraphicViewPort PTR [edi]).GVPWidth  ; get width into register
	mov	[x1], eax
??scr_right_ok:
	test	dl, 0001b
	jz	??not_clip
	mov	eax, (GraphicViewPort PTR [edi]).GVPHeight  ; get width into register
	mov	[y1], eax

??not_clip:
	;*===================================================================
	;* Get the offset into the screen.
	;*===================================================================
	mov	eax, [y0]
	mov	edx, (GraphicViewPort PTR [edi]).GVPWidth
	add	edx, (GraphicViewPort PTR [edi]).GVPXAdd
	add	edx, (GraphicViewPort PTR [edi]).GVPPitch
	imul	eax, edx
	add	eax, [x0]
	mov	edi, (GraphicViewPort PTR [edi]).GVPOffset
	add	edi, eax

	;*===================================================================
	;* Adjust the source for the top clip.
	;*===================================================================
	mov	ebx, (MouseType PTR [esi]).CursorWidth	; turn this into an offset
	mov	esi, [buffy0]			; edx points to source
	add	esi, [buffx0]					; plus clipped lines

	;*===================================================================
	;* Calculate the bytes per row add value
	;*===================================================================

	mov	eax, [x1]
	mov	ecx, [y1]
	sub	eax, [x0]
	jle	??out
	sub	ecx, [y0]
	jle	??out

	sub	edx, eax
	sub	ebx, eax
	push	ebp
	cmp	[store], 1					; are we storing page?
	je		??store_entry				; if so go to store
	;*===================================================================
	;* Handle restoring the buffer to the visible page
	;*===================================================================
	mov	ebp, ecx
??restore_loop:
	mov	ecx, eax					; get number to really write
	rep	movsb					; store them into the buffer
	add	esi, ebx				; move past right clipped pixels
	add	edi, edx					; adjust dest to next line
	dec	ebp					; decrement number of rows to do
	jnz	??restore_loop				; if more to do, do it
	pop	ebp
	ret

	;*===================================================================
	;* Handle soting the visible page into the Mouse Shadow Buffer
	;*===================================================================
??store_entry:
	xchg	esi, edi					; xchg the source and the dest
	mov	ebp, ecx

??store_loop:
	mov	ecx, eax					; get number to really write
	rep	movsb					; store them into the buffer
	add	esi, edx				; move past right clipped pixels
	add	edi, ebx					; adjust dest to next line
	dec	ebp					; decrement number of rows to do
	jnz	??store_loop				; if more to do, do it
	pop	ebp
??out:
	ret
Mouse_Shadow_Buffer	ENDP

;***************************************************************************
;* DRAW_MOUSE -- Handles drawing the mouse cursor			   *
;*                                                                         *
;* INPUT:	MouseClass *		- pointer to mouse class data	   *
;*		GraphicBufferClass *	- screen to draw the mouse on	   *
;*		int x			- x position to store the mouse at *
;*		int y			- y position to store the mouse at *
;*                                                                         *
;* Note: The x and y that this routine expects to receive are based on	   *
;*       the mouse cursor position.  This routine automatically adjusts	   *
;*	 for hot spot, so that adjustment should not be made prior to	   *
;*	 this point.							   *
;*                                                                         *
;* PROTO:       void Draw_Mouse(	MouseClass * mouse_data,	   *
;*					GraphicBufferClass *destination,   *
;*					int x_pixel,			   *
;* 					int y_pixel);			   *
;*                                                                         *
;* HISTORY:                                                                *
;*   10/27/1994 PWG : Created.                                             *
;*=========================================================================*
	PUBLIC	C Draw_Mouse
Draw_Mouse	PROC	NEAR C USES eax ebx ecx edx edi esi,
	_this:DWORD,
	dest:DWORD,
	mousex:DWORD,
	mousey:DWORD,

	local	x0:dword
	local	y0:dword
	local	x1:dword
	local	y1:dword
	local	buffx0:dword
	local	buffy0:dword


	mov	esi, [_this]    	; get 32 bit offset to mouse data
	mov	edi, [dest]	; get 32 bit offset to dest buffer

	;*===================================================================
	;* Copy of X, Y, Width and Height into local registers
	;*===================================================================
	mov	eax, [mousex]
	mov	ebx, [mousey]
	sub	eax, (MouseType PTR [esi]).MouseXHot
	sub	ebx, (MouseType PTR [esi]).MouseYHot

	mov	[x0], eax
	mov	[y0], ebx
	add	eax,(MouseType PTR [esi]).CursorWidth
	add	ebx,(MouseType PTR [esi]).CursorHeight
	mov	[x1], eax
	mov	[y1], ebx

	mov	[buffx0], 0
	mov	eax, (MouseType PTR [esi]).MouseCursor
	mov	[buffy0], eax


	;*===================================================================
	;* Bounds check source X. Y.
	;*===================================================================
	xor 	eax, eax
	xor 	edx, edx

	mov	ecx, [x0]
	mov	ebx, [x1]
	shld	eax, ecx, 1
	shld	edx, ebx, 1

	mov	ecx, [x0]
	mov	ebx, [x1]
	sub	ecx, (GraphicViewPort PTR [edi]).GVPWidth
	sub	ebx, (GraphicViewPort PTR [edi]).GVPWidth
	dec	ecx
	dec	ebx
	shld	eax, ecx, 1
	shld	edx, ebx, 1

	mov	ecx, [y0]
	mov	ebx, [y1]
	shld	eax, ecx, 1
	shld	edx, ebx, 1

	mov	ecx, [y0]
	mov	ebx, [y1]
	sub	ecx, (GraphicViewPort PTR [edi]).GVPHeight
	sub	ebx, (GraphicViewPort PTR [edi]).GVPHeight
	dec	ecx
	dec	ebx
	shld	eax, ecx, 1
	shld	edx, ebx, 1

	xor	al, 5
	xor	dl, 5
	mov	ah, al
	test	dl, al
	jnz	??out
	or	al, dl
	jz	??not_clip

	test	ah, 1000b
	jz	??scr_left_ok
	mov	ebx, [x0]
	neg	ebx
	mov	[buffx0], ebx
	mov	[x0], 0

??scr_left_ok:
	test	ah, 0010b
	jz	??scr_bottom_ok
	mov	ebx, [y0]
	neg	ebx
	imul	ebx, (MouseType PTR [esi]).CursorWidth
	add	[buffy0], ebx
	mov	[y0], 0

??scr_bottom_ok:
	test	dl, 0100b
	jz	??scr_right_ok
	mov	eax, (GraphicViewPort PTR [edi]).GVPWidth  ; get width into register
	mov	[x1] , eax
??scr_right_ok:
	test	dl, 0001b
	jz	??not_clip
	mov	eax, (GraphicViewPort PTR [edi]).GVPHeight  ; get width into register
	mov	[y1] , eax

??not_clip:

	;*===================================================================
	;* Get the offset into the screen.
	;*===================================================================
	mov	eax, [y0]
	mov	edx, (GraphicViewPort PTR [edi]).GVPWidth
	add	edx, (GraphicViewPort PTR [edi]).GVPXAdd
	add	edx, (GraphicViewPort PTR [edi]).GVPPitch
	imul	eax, edx
	add	eax, [x0]
	mov	edi, (GraphicViewPort PTR [edi]).GVPOffset
	add	edi, eax

	;*===================================================================
	;* Adjust the source for the top clip.
	;*===================================================================
	mov	ebx, (MouseType PTR [esi]).CursorWidth	; turn this into an offset
	mov	esi, [buffy0]			; edx points to source
	add	esi, [buffx0]					; plus clipped lines

	;*===================================================================
	;* Calculate the bytes per row add value
	;*===================================================================

	mov	eax, [x1]
	mov	ecx, [y1]
	sub	eax, [x0]
	jle	??out
	sub	ecx, [y0]
	jle	??out

	sub	edx, eax
	sub	ebx, eax

	;*===================================================================
	;* Handle restoring the buffer to the visible page
	;*===================================================================
??top_loop:
	mov	ah, al
??inner_loop:
	mov	ch, [esi]
	inc	esi
	test	ch, ch
	jz	??inc_edi
	mov	[edi], ch
??inc_edi:
	inc	edi
	dec	ah
	jnz	??inner_loop
	add	esi, ebx      			; move past right clipped pixels
	add	edi, edx      			; adjust dest to next line
	dec	cl	      			; decrement number of rows to do
	jnz	??top_loop    			; if more to do, do it
??out:
	ret

Draw_Mouse	ENDP
;***************************************************************************
;* SET_MOUSE_CURSOR -- Sets the shape to be used as the mouse.             *
;*                                                                         *
;*    This will inform the system of the shape desired as the mouse        *
;*    cursor.                                                              *
;*                                                                         *
;* INPUT:    xhotspot    -- Offset of click point into shape.              *
;*                                                                         *
;*           yhotspot    -- Offset of click point into shape.              *
;*                                                                         *
;*           cursor      -- Shape to use as the new mouse shape.           *
;*                                                                         *
;* OUTPUT:   Returns with a pointer to the original mouse shape.           *
;*                                                                         *
;* PROTO:	VOID  *Set_Mouse_Cursor(	int  xhotspot, 		   *
;*						int  yhotspot, 		   *
;*						void *cursor);		   *
;*                                                                         *
;* HISTORY:                                                                *
;*   02/13/1992 JLB : Created.                                             *
;*=========================================================================*
	PUBLIC	C ASM_Set_Mouse_Cursor
ASM_Set_Mouse_Cursor	PROC	NEAR C USES ebx ecx edx esi edi,
	_this:DWORD,				; pointer to mouse cursor struct
	xhotspot:DWORD,				; the x hot spot of the mouse
	yhotspot:DWORD,				; the y hot spot of the mouse
	cursor:DWORD,				; ptr to the new mouse cursor

	LOCAL	datasize:DWORD
	LOCAL	stype:WORD
	LOCAL	swidth:DWORD		; Shape width.
	LOCAL	sheight:DWORD		; Shape height.
	LOCAL	ssize:DWORD		; Size of raw shape.

	;*=========================================================================*
	; Direction flag must be forward in this routine.
	;*=========================================================================*
	cld
	mov	esi,[_this]			; get offset of real mode data start

	;-------------------------------------------------------------------
	; Calculate the size of the buffer needed.
	;-------------------------------------------------------------------
	push	[cursor]
	call	Get_Shape_Uncomp_Size
	pop	edx
	mov	[datasize],eax

	push	[cursor]
	call	Get_Shape_Width
	pop	edx
	mov	[swidth],eax
	cmp	eax,(MouseType PTR [esi]).MaxWidth
	jg	??end

	push	[cursor]
	call	Get_Shape_Original_Height
	pop	edx
	mov	[sheight],eax
	cmp	eax,(MouseType PTR [esi]).MaxHeight
	jg	??end


	mov	ebx,[sheight]
	mov	eax,[swidth]
	imul	ebx,eax

??copy_mouse:
	mov	edi,(MouseType PTR [esi]).MouseCursor		; set edi to point to mouse buffer
	mov	esi,[cursor]			; set esi to point to mouse shape
	mov	ax,[esi]			; get the shape type byte
	mov	[stype],ax			; save off the shape type
	test	ax,MAKESHAPE_NOCOMP		; is it marked as no compression?
	je	??comp_shape			; if not go to the comped shape code

??copy_type:

	test	[stype],MAKESHAPE_COMPACT	; if the shape a 16 color shape?
	jne	??16_color_copy			; if it is then go handle it

??normal_copy:
	;-------------------------------------------------------------------
	;* Uncompressed NORMAL shapes just get run-length uncompressed
	;-------------------------------------------------------------------
	add	esi,10				; adjust past header of shape
	mov	eax,[swidth]			; load up the width
	mul	[sheight]				; find size of shape in pixels
	mov	edx,eax				; save this in number of bytes
	xor	ecx,ecx				; clear high of loop variable
??norm_unrle:
	mov	al,[esi]			; get a byte out of the file
	inc	esi				; increment to the next pos
	or	al,al				; set the flags on register state
	jz	??norm_trans			; if its a zero its transparent
	mov	[edi],al			; write out the pixel to dest
	inc	edi				; move to next dest position
	dec	edx				; we have now written another pix
	jnz	??norm_unrle			; if more to write then do it
	jmp	??done_copy			; otherwise we are all done

??norm_trans:
	mov	cl,[esi]			; get how many zeros to write
	sub	edx,ecx
	inc	esi				; increment the source position
	xor	al,al				; clear out al cuz we're writing zeros
	rep	stosb				; write all of them out
	or	edx,edx
	jnz	??norm_unrle			; if more to do then do it
	jmp	??done_copy			; otherwise we are done

??16_color_copy:
	;-------------------------------------------------------------------
	;* Uncompressed 16 color shapes just get remaped and UN-RLE'd
	;-------------------------------------------------------------------
	add	esi,10				; adjust past header of shape
	mov	ebx,esi				; save of position of remap
	add	esi,16				; move past remap table
	mov	eax,[swidth]			; load up the width
	mul	[sheight]			; load up the height
	mov	edx,eax				; save this in number of bytes
	xor	eax,eax				; clear high of lookup variable
	xor	ecx,ecx				; clear high of loop variable
??16_color_unrle:
	mov	al,[esi]			; get a byte out of the file
	inc	esi				; increment to the next pos
	or	al,al				; set the flags on register state
	jz	??16_color_trans		; if its a zero its transparent
	mov	al,[ebx+eax]			; remap the pixel from 16 color table
	mov	[edi],al			; store it out to the dest address
	inc	edi				; move to next dest address
	dec	edx				; we have now written a pixel
	jnz	??16_color_unrle
	jmp	??done_copy
??16_color_trans:
	mov	cl,[esi]			; get how many zeros to write
	sub	edx,ecx				; subtract off count ahead of time
	inc	esi				; increment the source position
	xor	al,al				; clear out al cuz we're writing zeros
	rep	stosb				; write all of them out
	or	edx,edx				; or edx to test for zero
	jnz	??16_color_unrle
	jmp	??done_copy

	;-------------------------------------------------------------------
	; Deal with the compressed shape by copying it into the shape
	;   staging buffer.
	;-------------------------------------------------------------------
??comp_shape:
	mov	edi,[ShapeBuffer]	; get a pointer to ShapeBuffer
	mov	ax,[esi]		; load in the shape type
	add	esi,2			; increment the shape pointer
	or	ax,MAKESHAPE_NOCOMP	; make the shape as uncompressed
	mov	[stype],ax		; save off the shape type
	mov	[edi],ax		; write out uncompressed shape
	add	edi,2

	;-------------------------------------------------------------------
	; Process the shape header information and copy it over to the new
	;   location.
	;-------------------------------------------------------------------
	mov	ecx,4 			; transfer height, width, org and
	test	eax,MAKESHAPE_COMPACT	; is it a 16 color shape?
	je	??copy_head		; no - don't worry about it
	add	ecx,8			; otherwise adjust ecx for header
??copy_head:
	rep	movsw			; copy the necessary bytes

	mov 	eax,[datasize]		; get uncompressed length
	push	eax			; push as third param
	push	edi			; push the destination offset
	push	esi			; push the source offset
	call	LCW_Uncompress		; do the uncompress
	pop	eax
	pop	eax
	pop	eax
	mov	esi,[_this]
	mov	edi,(MouseType PTR [esi]).MouseCursor		; set edi to point to mouse buffer
	mov	esi,[ShapeBuffer]
	jmp	??copy_type

??done_copy:
	mov	esi,[_this]	; get offset of real mode data start

	mov	eax,[xhotspot]		; get the mouse cursors x hotspot
	mov	(MouseType PTR [esi]).MouseXHot,eax
	mov	eax,[yhotspot]		; get the mouse cursors y hotspot
	mov	(MouseType PTR [esi]).MouseYHot,eax

	mov	ebx,[sheight]		; get shape height
	mov	(MouseType PTR [esi]).CursorHeight,ebx
	mov	ebx,[swidth]
	mov	(MouseType PTR [esi]).CursorWidth,ebx

	;-------------------------------------------------------------------
	; Final cleanup and exit.
	;-------------------------------------------------------------------
??end:
	push	[cursor]
	push	(MouseType PTR [esi]).PrevCursor
	pop	eax
	pop	(MouseType PTR [esi]).PrevCursor
	ret				; and return back to the world

ASM_Set_Mouse_Cursor	ENDP

END
