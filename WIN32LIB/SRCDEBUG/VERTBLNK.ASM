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

; $Header: g:/library/wwlib32/video/rcs/vertblnk.asm 1.1 1994/04/18 09:34:51 jeff_wilson Exp $
;***************************************************************************
;**   C O N F I D E N T I A L --- W E S T W O O D   A S S O C I A T E S   **
;***************************************************************************
;*                                                                         *
;*                 Project Name : Library routine                          *
;*                                                                         *
;*                    File Name : VERTBLNK.ASM                             *
;*                                                                         *
;*                   Programmer : Christopher Yates                        *
;*                                                                         *
;*                  Last Update : 20 August, 1990   [CY]                   *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;*                                                                         *
; WORD Get_Vert_Blank(VOID);                                               *
; VOID Wait_Vert_Blank(VOID);						   *
; WORD get_vga_state (VOID) ;
; VOID set_vga_mode (WORD) ;
;*                                                                         *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *

; Converted TASM IDEAL to MASM
.386P
.MODEL FLAT

;LOCALS ??

EXTERNDEF             Get_Vert_Blank       : NEAR
EXTERNDEF             Wait_Vert_Blank      : NEAR
EXTERNDEF		   get_vga_state	: NEAR
EXTERNDEF		   set_vga_mode		: NEAR


.CODE	; converted from TASM: CODESEG

; ----------------------------------------------------------------
;
; Here are prototypes for the routines defined within this module:
;
; WORD Get_Vert_Blank(VOID);
; VOID Wait_Vert_Blank(VOID);
; WORD get_vga_state (VOID) ;
; VOID set_vga_mode (WORD) ;

;
; ----------------------------------------------------------------

;----------------------------------------------------------------------------

Get_Vert_BlankPROC	near C
	USES edx

	mov	dx,03DAH	; CRTC status register
	in	al,dx
	and	al,008H		; look at bit 3 vertical sync
	xor	ah,ah		; zero ah
	ret

Get_Vert_Blank	ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
Wait_Vert_BlankPROC	near C
	USES eax,ebx,edx
	ARG	blank:DWORD

	mov	ebx,[blank]	; get vertical blank 0 or 1 for on

	mov	edx,03DAH	; CRTC status register

	and	bl,01b
	shl	bl,3

??in_vbi:
	in	al,dx			; read CRTC status
	and	al,008h			; only vertical sync bit
	xor	al,bl
	je	??in_vbi		; in vertical sync

??out_vbi:
	in	al,dx			; read CRTC status
	and	al,008h			; only vertical sync bit
	xor	al,bl
	jne	??out_vbi		; not in vertical sync

	ret

Wait_Vert_Blank	ENDP

;----------------------------------------------------------------------------

; WORD get_vga_state (VOID) ;

get_vga_statePROC	near C
	USES  ebx
	mov   eax,0f00h
	int   10h
	and   eax, 0ffh
	ret
get_vga_state	ENDP

;----------------------------------------------------------------------------

; VOID set_vga_mode (WORD) ;

set_vga_modePROC   near C
	ARG   mode:dword
	mov   eax , [mode]
	and   eax , 0ffh
	int   10h
	ret
set_vga_mode   ENDP



END


