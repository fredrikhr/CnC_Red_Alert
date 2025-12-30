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


		.MODEL SMALL
		OPTION SEGMENT:USE16
;		IDEAL
;		P386N
		.386
;		LOCALS ??



realcode	segment para public USE16 'code'


;global		PASCAL ASM_IPX_INITIALISE:far
;global		PASCAL ASM_IPX_UNINITIALISE:far


ASM_IPX_INITIALISE	proc	FAR PASCAL PUBLIC

		int	3
		mov	ax,7a00h
		int	2fh
		and	eax,0ffh
		cmp	al,-1
		setz	al
		ret

ASM_IPX_INITIALISE	endp




ASM_IPX_UNINITIALISE	proc	FAR PASCAL PUBLIC

		ret

ASM_IPX_UNINITIALISE	endp



realcode	ends

		end



