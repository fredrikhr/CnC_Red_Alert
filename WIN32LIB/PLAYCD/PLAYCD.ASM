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


; Converted TASM IDEAL to MASM
.386P
.MODEL FLAT

;LOCALS ??


DPMI_INTR equ	031h

EXTERNDEF C DPMI_real_alloc   : near
EXTERNDEF C DPMI_real_free    : near
EXTERNDEF C DPMI_real_intr    : near
EXTERNDEF C DPMI_real_call    : near


SEGSEL STRUC
	  segmen  dw ?
 	  select  dw ?
SEGSEL ENDS

REGS STRUC
	_eax   dd ?
	_ebx   dd ?
	_ecx   dd ?
	_edx   dd ?
	_esi   dd ?
	_edi   dd ?
	_cflag dd ?
REGS ENDS

SREGS STRUC
	_es  dw ?
	_cs  dw ?
	_ss  dw ?
	_ds  dw ?
        _fs  dw ?
	_gs  dw ?
SREGS ENDS

DPMI_REGS STRUC
       _edi  dd ?
       _esi  dd ?
       _ebp  dd ?
       	     dd ?
       _ebx  dd ?
       _edx  dd ?
       _ecx  dd ?
       _eax  dd ?
       Flags dw ?
       _es   dw ?
       _ds   dw ?
       _fs   dw ?
       _gs   dw ?
       _ip   dw ?
       _cs   dw ?
       _sp   dw ?
       _ss   dw ?
       	     dd ?
	     dd	?
   size_ref  db	?
DPMI_REGS ENDS


.CODE	; converted from TASM: CODESEG

; int  DPMI_real_alloc ( UINT , SEGREG * , USHORT * ) ;

DPMI_real_alloc	PROC near C	USES	ebx edx,
	paragra        : DWORD,
	blk_segptr     : DWORD,
	largest_blkptr : DWORD

	mov	eax, 0100h
	mov	ebx, [paragra]
	int	DPMI_INTR

	jnc	??dpmi_succed
	mov	ebx, [largest_blkptr]
	mov word ptr [ ebx ] , bx
	movzx	eax , al
 	ret

??dpmi_succed:
	mov	ebx, [blk_segptr]
	assume ebx:ptr SEGSEL
	mov	[ebx]. segmen , ax
	mov	[ebx]. select , dx
	xor	eax , eax
	ret

DPMI_real_alloc ENDP


;**************************************************************************
; int  DPMI_real_free ( UINT ) ;

DPMI_real_free	PROC near C	USES	eax edx,
	blk_selec  : DWORD

	mov	eax, 0101h
	mov	edx, [blk_selec]
	shr	edx , 16
	int	DPMI_INTR
 	ret
DPMI_real_free ENDP


DPMI_real_intr	PROC near C	USES	eax ebx ecx edx edi esi,
	vector  : dword,
	regs_ptr: dword,
	sreg_ptr: dword

	LOCAL	regblk : DPMI_REGS

	lea	edi , [ regblk ]
	xor	eax , eax
	lea	ecx , [ regblk . size_ref ]
	sub	ecx , edi
	shr	ecx , 2
	rep	stosd

  	mov	ebx , [ regs_ptr ]
	assume ebx : ptr REGS
	mov	eax , [ ebx ] . _eax
	mov	[ regblk . _eax ] , eax

	mov	eax , [ ebx ] . _ebx
	mov	[ regblk . _ebx ] , eax

	mov	eax , [ ebx ] . _ecx
	mov	[ regblk . _ecx ] , eax

	mov	eax , [ ebx ] . _edx
	mov	[ regblk . _edx ] , eax

	mov	eax , [ ebx ] . _esi
	mov	[ regblk . _esi ] , eax

	mov	eax , [ ebx ] . _edi
	mov	[ regblk . _edi ] , eax


  	mov	ebx , [ sreg_ptr ]
	assume ebx : ptr SREGS
	mov	ax , [ ebx ] . _es
	mov	[ regblk . _es ] , ax

	mov	ax , [ ebx ] . _ds
	mov	[ regblk . _ds ] , ax

	mov	eax , 0300h
	mov	ebx , [ vector ]
	xor     bh , bh
	xor 	ecx , ecx
	lea	edi , [ regblk ]

	int	DPMI_INTR

  	mov	ebx , [ regs_ptr ]
	assume ebx : ptr REGS
	mov	eax , [ regblk . _eax ]
	mov	[ ebx ] . _eax , eax

	mov	eax , [ regblk . _ebx ]
	mov	[ ebx ] . _ebx , eax

	mov	eax , [ regblk . _ecx ]
	mov	[ ebx ] . _ecx , eax

	mov	eax , [ regblk . _edx ]
	mov	[ ebx ] . _edx , eax

	mov	eax , [ regblk . _esi ]
	mov	[ ebx ] . _esi , eax

	mov	eax , [ regblk . _edi ]
	mov	[ ebx ] . _edi , eax


  	mov	ebx , [ sreg_ptr ]
	assume ebx : ptr SREGS
	mov	ax , [ regblk . _es ]
	mov	[ ebx ] . _es , ax

	mov	ax , [ regblk . _ds ]
	mov	[ ebx ] . _ds , ax

 	ret
DPMI_real_intr ENDP


DPMI_real_call	PROC near C	USES	eax ebx ecx edx edi esi,
	vector  : dword,
	regs_ptr: dword,
	sreg_ptr: dword

	LOCAL	regblk : DPMI_REGS


	lea	edi , [ regblk ]
	xor	al , al
	lea	ecx , [ regblk . size_ref ]
	sub	ecx , edi
	rep	movsb


  	mov	ebx , [ regs_ptr ]
	assume ebx : ptr REGS
	mov	eax , [ ebx ] . _eax
	mov	[ regblk . _eax ] , eax

	mov	eax , [ ebx ] . _ebx
	mov	[ regblk . _ebx ] , eax

	mov	eax , [ ebx ] . _ecx
	mov	[ regblk . _ecx ] , eax

	mov	eax , [ ebx ] . _edx
	mov	[ regblk . _edx ] , eax

	mov	eax , [ ebx ] . _esi
	mov	[ regblk . _esi ] , eax

	mov	eax , [ ebx ] . _edi
	mov	[ regblk . _edi ] , eax


  	mov	ebx , [ sreg_ptr ]
	assume ebx : ptr SREGS
	mov	ax , [ ebx ] . _es
	mov	[ regblk . _es ] , ax

	mov	ax , [ ebx ] . _ds
	mov	[ regblk . _ds ] , ax

;	mov	eax , 0300h
;	mov	ebx , [ vector ]
;	xor     bh , bh
;	xor 	ecx , ecx
;	lea	edi , [ regblk ]

;	int	DPMI_INTR

  	mov	ebx , [ regs_ptr ]
	assume ebx : ptr REGS
	mov	eax , [ regblk . _eax ]
	mov	[ ebx ] . _eax , eax
	mov	eax , [ regblk . _ebx ]
	mov	[ ebx ] . _ebx , eax
	mov	eax , [ regblk . _ecx ]
	mov	[ ebx ] . _ecx , eax
	mov	eax , [ regblk . _edx ]
	mov	[ ebx ] . _edx , eax

	mov	eax , [ regblk . _esi ]
	mov	[ ebx ] . _esi , eax
	mov	eax , [ regblk . _edi ]
	mov	[ ebx ] . _edi , eax


  	mov	ebx , [ sreg_ptr ]
	assume ebx : ptr SREGS
	mov	ax , [ regblk . _es ]
	mov	[ ebx ] . _es , ax

	mov	ax , [ regblk . _ds ]
	mov	[ ebx ] . _ds , ax

 	ret
DPMI_real_call ENDP

END



