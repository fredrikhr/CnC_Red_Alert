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
;*                    File Name : SVGAPRIM.INC                             *
;*                                                                         *
;*                   Programmer : Phil W. Gorrow                           *
;*                                                                         *
;*                   Start Date : December 8, 1994                         *
;*                                                                         *
;*                  Last Update : December 8, 1994   [PWG]                 *
;*                                                                         *
;*-------------------------------------------------------------------------*

; Externs from VIDEO.CPP module of the VIDEO library
EXTERNDEF BankTable			:DWORD
EXTERNDEF VesaFunc			:DWORD
EXTERNDEF XRes					:DWORD
EXTERNDEF YRes					:DWORD
EXTERNDEF CurrentMode		:DWORD
EXTERNDEF cpu_video_page	:dword
EXTERNDEF cpu_page_limit   :dword


; Externs from VESA.ASM module of the SVGAPRIM library
EXTERNDEF Vesa_Asm_Set_Win		:NEAR
EXTERNDEF Vesa_Asm_Next_Win		:NEAR

; Externs from VGETPIX.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_Get_Pixel          	:NEAR

; Externs from VPUTTPIX.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_Put_Pixel 		:NEAR


; Externs from VCLEAR.ASM module of the MCGA/SVGAPRIM library
EXTERNDEF Vesa_Clear			:NEAR

; Externs from VBITBLIT.ASM module of the MCGA/SVGAPRIM library
EXTERNDEF Linear_Blit_To_Vesa		:NEAR
EXTERNDEF Vesa_Blit_To_Linear		:NEAR
EXTERNDEF Vesa_Blit_To_Vesa		:NEAR

; Externs from VTOBUFF.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_To_Buffer		:NEAR

; Externs from VTOPAGE.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_Buffer_To_Page		:NEAR

; Externs from VSCALE.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Linear_Scale_To_Vesa 		:NEAR
EXTERNDEF Vesa_Scale_To_Linear		:NEAR
EXTERNDEF Vesa_Scale_To_Vesa 		:NEAR


; Externs from VSCALE.ASM module of the SVGA/MCGAPRIM library
EXTERNDEF Vesa_Print	 		:NEAR
