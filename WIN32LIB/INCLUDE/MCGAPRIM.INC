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
;*                    File Name : MCGAPRIM.INC                             *
;*                                                                         *
;*                   Programmer : Phil W. Gorrow                           *
;*                                                                         *
;*                   Start Date : January 16, 1995                         *
;*                                                                         *
;*                  Last Update : January 16, 1995   [PWG]                 *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *

; Externs from REGIONSZ.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Size_Of_Region	:NEAR

; Externs from GETPIX.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Get_Pixel          	:NEAR

; Externs from VGETPIX.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_Get_Pixel          	:NEAR

; Externs from PUTPIX.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Put_Pixel 		:NEAR

; Externs from VPUTTPIX.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_Put_Pixel 		:NEAR

; Externs from CLEAR.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Clear	          	:NEAR

; Externs from VCLEAR.ASM module of the MCGA/SVGAPRIM library
EXTERNDEF Vesa_Clear			:NEAR
; Externs from BITBLIT.ASM module of the MCGAPRIM library
EXTERNDEF Linear_Blit_To_Linear		:NEAR

; Externs from VBITBLIT.ASM module of the MCGA/SVGAPRIM library
EXTERNDEF Linear_Blit_To_Vesa		:NEAR
EXTERNDEF Vesa_Blit_To_Linear		:NEAR
EXTERNDEF Vesa_Blit_To_Vesa		:NEAR

; Externs from TOBUFF.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_To_Buffer		:NEAR

; Externs from VTOBUFF.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_To_Buffer		:NEAR

; Externs from TOPAGE.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Buffer_To_Page		:NEAR

; Externs from VTOPAGE.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_Buffer_To_Page		:NEAR

; Externs from SCALE.ASM module of the MCGAPRIM library
EXTERNDEF Linear_Scale_To_Linear 	:NEAR

; Externs from VSCALE.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Linear_Scale_To_Vesa 		:NEAR
EXTERNDEF Vesa_Scale_To_Linear		:NEAR
EXTERNDEF Vesa_Scale_To_Vesa 		:NEAR

; Externs from TXTPRNT.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Print			:NEAR

; Externs from VTXTPRNT.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_Print			:NEAR

;*-------------------------------------------------------------------------*
;* Define MCGA only assembly GLOBALS					   *
;*-------------------------------------------------------------------------*

; Externs from DRAWLINE.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Draw_Line 		:NEAR

; Externs from FILLQUAD.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Fill_Quad 		:NEAR

; Externs from FILLRECT.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Fill_Rect 		:NEAR

; Externs from REMAP.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Remap      		:NEAR

; Externs from STAMP.ASM module of the MCGAPRIM library
EXTERNDEF MCGA_Draw_Stamp 		:NEAR

EXTERNDEF get_clip	 	   : NEAR

RECTANGLE  struc
		  x0	dd	?
		  y0 dd	?
		  x1	dd	?
		  y1 dd ?
RECTANGLE 	 ends





