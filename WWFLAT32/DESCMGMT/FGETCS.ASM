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
;*                 Project Name : Get the code selector                    *
;*                                                                         *
;*                    File Name : FGETCS.ASM                               *
;*                                                                         *
;*                   Programmer : Jeff Wilson                              *
;*                                                                         *
;*                   Start Date : March 28, 1994                           *
;*                                                                         *
;*                  Last Update : March 28, 1994   []                      *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;*   GetCs -- Return the current Data selector.                            *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *


; Converted from TASM: IDEAL
.386P	; Converted from TASM: P386
.MODEL	FLAT	; Converted from TASM: MODEL USE32 FLAT


;GLOBAL             GetCs          :NEAR

;============================================================================
.CODE; Converted from TASM: CODESEG

;***************************************************************************
;* GETCS -- Return the current Data selector.                              *
;*                                                                         *
;*                                                                         *
;*                                                                         *
;* INPUT: NONE                                                             *
;*                                                                         *
;* OUTPUT: UWORD        selector of the default code segment               *
;*                                                                         *
;* WARNINGS:                                                               *
;*                                                                         *
;* HISTORY:                                                                *
;*   03/28/1994  jaw: Created.                                             *
;*=========================================================================*

GetCs 	PROC near C

	xor	eax,eax
	mov	ax,cs
	ret
;====================
GetCs ENDP


END





