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
;*                    File Name : VTOBUFF.ASM                              *
;*                                                                         *
;*                   Programmer : Phil W. Gorrow                           *
;*                                                                         *
;*                   Start Date : January 16, 1995                         *
;*                                                                         *
;*                  Last Update : January 16, 1995   [PWG]                 *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;*   Vesa_To_Buffer -- Copies a vesa viewport to a linear buffer           *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *

; Converted from TASM: IDEAL
.386P	; Converted from TASM: P386
.MODEL	FLAT	; Converted from TASM: MODEL USE32 FLAT

INCLUDE <mcgaprim.inc>
INCLUDE <.\gbuffer.inc>


.CODE; Converted from TASM: CODESEG


;***************************************************************************
;* VESA_TO_BUFFER -- Copies a vesa viewport to a linear buffer             *
;*                                                                         *
;* INPUT:                                                                  *
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
Vesa_To_Buffer PROC	near C
	ret
Vesa_To_Buffer	ENDP
END
