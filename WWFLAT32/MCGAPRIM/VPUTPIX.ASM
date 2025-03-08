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
;**     C O N F I D E N T I A L --- W E S T W O O D   S T U D I O S       **
;***************************************************************************
;*                                                                         *
;*                 Project Name : Clear the Full Mcga Screen		   *
;*                                                                         *
;*                    File Name : PUTPIXEL.ASM                             *
;*                                                                         *
;*                   Programmer : Phil Gorrow				   *
;*                                                                         *
;*                   Start Date : June 7, 1994				   *
;*                                                                         *
;*                  Last Update : January 16, 1995   [PWG]                 *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;*   Vesa_Put_Pixel -- Puts a pixel on a video viewport                    *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *

; Converted from TASM: IDEAL
.386P	; Converted from TASM: P386
.MODEL	FLAT	; Converted from TASM: MODEL USE32 FLAT

INCLUDE <mcgaprim.inc>
INCLUDE <.\gbuffer.inc>


.CODE; Converted from TASM: CODESEG


;***************************************************************************
;* VESA_PUT_PIXEL -- Puts a pixel on a video viewport                      *
;*                                                                         *
;* INPUT:	 							   *
;*                                                                         *
;* OUTPUT:                                                                 *
;*                                                                         *
;* PROTO:                                                                  *
;*                                                                         *
;* WARNINGS:                                                               *
;*                                                                         *
;* HISTORY:                                                                *
;*   01/16/1995 PWG : Created.                                             *
;*=========================================================================*
Vesa_Put_Pixel PROC	near C
	ret
Vesa_Put_Pixel	ENDP
END
