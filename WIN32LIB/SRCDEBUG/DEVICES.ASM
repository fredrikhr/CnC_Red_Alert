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

; $Header: g:/library/wwlib32/system/rcs/devices.asm 1.2 1994/04/28 12:41:41 jeff_wilson Exp $
;***************************************************************************
;**   C O N F I D E N T I A L --- W E S T W O O D   A S S O C I A T E S   **
;***************************************************************************
;*                                                                         *
;*                 Project Name : LIBRARY                                  *
;*                                                                         *
;*                    File Name : DEVICES.ASM                              *
;*                                                                         *
;*                   Programmer : Christopher Yates                        *
;*                                                                         *
;*                  Last Update : 12 December, 1990   [CY]                 *
;*                                                                         *
;*-------------------------------------------------------------------------*
;* Functions:                                                              *
;*                                                                         *
; VOID Get_Devices(VOID);                                                  *
; WORD Is_Device_Real(WORD drive);                                         *
;*                                                                         *
;* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - *


;----------------------------------------------------------------------------

; Converted TASM IDEAL to MASM
.386P
.MODEL FLAT

EXTERNDEF  	    Get_Devices          :NEAR
EXTERNDEF              Is_Device_Real       :NEAR

EXTERNDEF              MaxDevice          	 :BYTE
EXTERNDEF              DefaultDrive         :BYTE

; ----------------------------------------------------------------
;
; Here are prototypes for the routines defined within this module:
;
; VOID Get_Devices(VOID);
; WORD Is_Device_Real(WORD drive);
;
; ----------------------------------------------------------------

.CODE	; converted from TASM: CODESEG

;***********************************************************
;
; GET_DEVICES
;
; VOID Get_Devices(VOID);
;
; This routine establishes the default disk drive and the maximum drive
; available in the current system.
;
;*
DOS	equ	21h

Get_DevicesPROC	near C
	USES eax,ebx,edx

   	sub	eax,eax
	mov	ah,25			; get current drive service
	int	DOS			; drive returned in al
	mov	[DefaultDrive],al	; save it
	mov	dl,al
	mov	ah,14			; set current as current drive
	int	DOS
	dec	al			; al = max drives, make it n - 1
	xor	ah,ah			; clear high byte
	mov	edx,eax			; use dx to go backward to find out
	sub	ebx,ebx

??back_loop:
	mov	bl,dl			; find out about the drive in dl
	inc	bl
	mov	eax,0440Eh 		; get the physical drive associated
	int	DOS			; with this letter
	jnc	short ??later		; if c clear, no error
	cmp	al,0Fh			; was it invalid? (0Fh = invalid)
	jne	short ??later		; yes, so LATER
	dec	edx
	jmp	??back_loop		; try, try again

??later:
	mov	eax,edx			; restore ax
	mov	[MaxDevice],al		; save the max drive #

	ret

Get_Devices	ENDP

;***************************************************************


;***************************************************************
;
; IS_DEVICE_REAL
;
; WORD Is_Device_Real(WORD drive);
;
; This routine will tell whether or not a device is a true
; phisical one.  Send it the drive # to check.
;
;*
Is_Device_RealPROC	near C
	USES ebx,edx
	ARG	drive:WORD

	sub	edx,edx
	mov	dx,[drive]

??next_drive:
	push	ebx
	mov	bl,dl			; find out about the drive in dl
	inc	bl
	mov	eax,0440Eh 		; get the physical drive associated
	int	DOS			; with this letter
	pop	ebx

	jnc	short ??it_is_real	; jump if no error
	cmp	al,01			; 1 = invalid command,
					; 0F = invalid device
	je	short ??real			; 1? it is ok (RAM device)
	jmp	short ??invalid		; 0Fh, it was not a device

??it_is_real:
	cmp	al,0			; was it a fixed device?
	je	short ??real			; yes, it's ok
	dec	al			; make it a drive #
	cmp	al,dl			; is it a valid drive?
	je	short ??real

??invalid:				; The device is invalid.
	mov	eax,0
	jmp	short ??out

??real:					; Return true, for valid device.
	mov	eax,1

??out:
	ret
Is_Device_Real	ENDP

;***************************************************************

END

