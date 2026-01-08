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
;*                    File Name : DRAWBUFF.INC                             *
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

; Externs from REGIONSZ.ASM module of the DRAWBUFF library
Buffer_Size_Of_Region	PROTO	NEAR C,
	this_object:DWORD,
	region_width:DWORD,
	region_height:DWORD,

; Externs from GETPIX.ASM module of the DRAWBUFF library
Buffer_Get_Pixel		PROTO	NEAR C,
	this_object:DWORD,
	x_pixel:DWORD,
	y_pixel:DWORD,

; Externs from PUTPIX.ASM module of the DRAWBUFF library
Buffer_Put_Pixel		PROTO	NEAR C,
	this_object:DWORD,
	x_pixel:DWORD,
	y_pixel:DWORD,
	color:BYTE,

; Externs from CLEAR.ASM module of the DRAWBUFF library
Buffer_Clear			PROTO	NEAR C,
	this_object:DWORD,
	color:BYTE,

; Externs from BITBLIT.ASM module of the DRAWBUFF library
Linear_Blit_To_Linear	PROTO	NEAR C,
	this_object :DWORD,
	dest        :DWORD,
	x_pixel     :DWORD,
	y_pixel     :DWORD,
	dest_x0     :dword,
	dest_y0     :dword,
	pixel_width :DWORD,
	pixel_height:DWORD,
	trans       :DWORD,

; Externs from TOBUFF.ASM module of the DRAWBUFF library
Buffer_To_Buffer		PROTO	NEAR C,
	this_object:DWORD,
	x_pixel:DWORD,
	y_pixel:DWORD,
	pixel_width:DWORD,
	pixel_height:DWORD,
	dest:DWORD,
	buffer_size:DWORD,

; Externs from TOPAGE.ASM module of the DRAWBUFF library
Buffer_To_Page			PROTO	NEAR C,
	x_pixel     :DWORD,
	y_pixel     :DWORD,
	pixel_width :DWORD,
	pixel_height:DWORD,
	src         :DWORD,
	dest        :DWORD,

; Externs from SCALE.ASM module of the DRAWBUFF library
Linear_Scale_To_Linear	PROTO	NEAR C,
	this_object:DWORD,
	dest:DWORD,
	src_x:DWORD,
	src_y:DWORD,
	dst_x:DWORD,
	dst_y:DWORD,
	src_width:DWORD,
	src_height:DWORD,
	dst_width:DWORD,
	dst_height:DWORD,
	trans:DWORD,
	remap:DWORD,

; Externs from TXTPRNT.ASM module of the DRAWBUFF library
Buffer_Print			PROTO	NEAR C,
	this_object:DWORD,
	string:DWORD,
	x_pixel:DWORD,
	y_pixel:DWORD,
	fcolor:DWORD,
	bcolor:DWORD,

;*-------------------------------------------------------------------------*
;* Define Buffer only assembly GLOBALS					   *
;*-------------------------------------------------------------------------*

; Externs from DRAWLINE.ASM module of the DRAWBUFF library
Buffer_Draw_Line		PROTO	NEAR C,
	this_object:DWORD,
	x1_pixel:DWORD,
	y1_pixel:DWORD,
	x2_pixel:DWORD,
	y2_pixel:DWORD,
	color:DWORD,

; Externs from FILLQUAD.ASM module of the DRAWBUFF library
Buffer_Fill_Quad		PROTO	NEAR C,
	this_object:DWORD,
	span_buff:DWORD,
	x0_pixel:DWORD,
	y0_pixel:DWORD,
	x1_pixel:DWORD,
	y1_pixel:DWORD,
	x2_pixel:DWORD,
	y2_pixel:DWORD,
	x3_pixel:DWORD,
	y3_pixel:DWORD,
	color:DWORD,

; Externs from FILLRECT.ASM module of the DRAWBUFF library
Buffer_Fill_Rect		PROTO	NEAR C,
	this_object:DWORD,
	x1_pixel:WORD,
	y1_pixel:WORD,
	x2_pixel:WORD,
	y2_pixel:WORD,
	color:BYTE,

; Externs from REMAP.ASM module of the DRAWBUFF library
Buffer_Remap			PROTO	NEAR C,
	this_object:DWORD,
	x0_pixel:DWORD,
	y0_pixel:DWORD,
	region_width:DWORD,
	region_height:DWORD,
	remap	:DWORD,

; Externs from STAMP.ASM module of the DRAWBUFF library
Buffer_Draw_Stamp		PROTO	NEAR C,
	this_object:DWORD,
	icondata:DWORD,
	icon:DWORD,
	x_pixel:DWORD,
	y_pixel:DWORD,
	remap:DWORD,

get_clip				PROTO	NEAR C,
	win	    : dword,
     rect	    : dword,

RECTANGLE	struc
		  x0	dd	?
		  y0 dd	?
		  x1	dd	?
		  y1 dd ?
RECTANGLE	ends

