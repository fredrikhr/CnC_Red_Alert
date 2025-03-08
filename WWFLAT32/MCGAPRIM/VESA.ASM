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
;**      C O N F I D E N T I A L --- W E S T W O O D   S T U D I O S      **
;***************************************************************************
;*                                                                         *
;*                 Project Name : Westwood 32 bit Library                  *
;*                                                                         *
;*                    File Name : VESA.ASM                                 *
;*                                                                         *
;*                   Programmer : Phil W. Gorrow                           *
;*                                                                         *
;*                   Start Date : December 8, 1994                         *
;*                                                                         *
;*                  Last Update : December 8, 1994   [PWG]                 *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;*   Vesa_Asm_Set_Win -- Sets the current vesa window from Asm             *
;*   Vesa_Asm_Next_Window -- Sets to the next vesa window                  *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *

; Converted from TASM: IDEAL
.386P	; Converted from TASM: P386
.MODEL	FLAT	; Converted from TASM: MODEL USE32 FLAT
; Converted from TASM: LOCALS  ??


GLOBAL	Vesa_Asm_Set_Win :near

.DATA; Converted from TASM: DATASEG

.CODE; Converted from TASM: CODESEG


;***************************************************************************
;* VESA_ASM_SET_WIN -- Sets the current vesa window from Asm               *
;*                                                                         *
;* INPUT:	edi - offset to set the window for                         *
;*                                                                         *
;* OUTPUT:      edi - adjusted offset for window                           *
;*                                                                         *
;* PROTO:	void Vesa_Asm_Set_Win(void);				   *
;*                                                                         *
;* HISTORY:                                                                *
;*   12/08/1994 PWG : Created.                                             *
;*=========================================================================*
Vesa_Asm_Set_Win PROC	near C

	ret
Vesa_Asm_Set_Win	ENDP



END
