; Zendex ZX-203 Disk Controller firmware

; Assembly source code copyright 2016 Eric Smith <spacewar@gmail.com>

; No copyright is claimed on the executable object code as
; found in the ZX-203 PROM chips.

; This program is free software: you can redistribute it and/or modify
; it under the terms of version 3 of the GNU General Public License
; as published by the Free Software Foundation.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.


; The assembler syntax used herein does not match any existing 8X305
; assembler, including Signetics MCCAP.	 This assembly source code
; has not been assembled for verification against the actual ZX-203
; PROM chips.

; U11 PROM ("BM2") is most significant byte
; U12 PROM ("BM3") is least significant byte

        xmit    7h,ivr
        xmit    77h,aux
        move    aux,driv

        xmit    0ffh,aux
        xmit    1h,ivr
        move    aux,driv

        xmit    5ch,ivr
        xmit    38h,aux
        move    aux,driv

        xmit    5ah,ivr
        xmit    1h,driv[7]

        xmit    35h,ivl
        xmit    0h,dliv

        xmit    36h,ivl
        xmit    0h,dliv

        xmit    31h,ivl
        xmit    0h,dliv

        xmit    30h,ivr
        xmit    0h,driv

        xmit    36h,ivr
        xmit    0h,driv

        xmit    37h,ivr
        xmit    0h,driv

        xmit    3dh,ivr
        xmit    0h,driv

        xmit    3eh,ivr
        xmit    0h,driv

        xmit    3fh,ivr
        xmit    0h,driv

        xmit    3ch,ivr
        xmit    0h,driv

        xmit    0ffh,aux
        xmit    4fh,ivr
        move    aux,driv

        xmit    4ah,ivr
        move    aux,driv

        xmit    3fh,ivl
        move    aux,dliv

        xmit    40h,ivl
        move    aux,dliv

        xmit    41h,ivl
        move    aux,dliv

        xmit    48h,ivr
        move    aux,driv

        xmit    49h,ivr
        move    aux,driv

        xmit    7fh,aux
        xmit    7h,ivr
        move    aux,driv

        xmit    39h,ivr
        xmit    9h,driv

        xmit    38h,ivr
        xmit    19h,driv

        xmit    9h,ivr
        xmit    0ebh,aux
        nzt     sriv[6],x0039
        xmit    88h,aux
x0039:  xmit    36h,ivl
        move    aux,dliv[0]

        xmit    3ah,ivr
        move    aux,driv

        xmit    7h,aux
        xmit    9h,ivr
        xor     sriv[2:0],r1
        xec     x0041,r1

; xec table
x0041:  jmp     x007e
        jmp     x0049
        jmp     x007e
        jmp     x008a
        jmp     x008a
        jmp     x008a
        jmp     x008a
        jmp     x00b2


x0049:  xmit    80h,r1
        xmit    81h,r2
        xmit    90h,r3
        xmit    91h,r4
        xmit    5h,r5
        xmit    5h,r6
        xmit    5h,aux
        xmit    2dh,ivl
        xmit    5h,dliv
	call	sub_0627	; ret 00h
	xmit    36h,ivl
        xmit    1h,dliv[5]
        xmit    0ch,r1
        call    sub_0639	; ret 01h
	xmit    4h,ivr
        xmit    1bh,aux
        move    aux,driv
        xmit    3h,ivr
        xmit    0h,driv
        xmit    1h,r1
        call    sub_0662	; ret 02h
	xmit    32h,r1
        call    sub_0662	; ret 03h
	xmit    4h,r1
        call    sub_0662	; ret 04h
	xmit    0h,r1
        call    sub_0662	; ret 05h
	xmit    99h,r1
        call    sub_0662	; ret 06h
	xmit    0h,r1
        call    sub_0662	; ret 07h
	xmit    0h,r1
        call	sub_0662	; ret 08h
	xmit    0bh,r1
        call    sub_0662	; ret 09h
	xmit    3h,ivr
        xmit    0h,driv
        xmit    8h,r1
        xmit    35h,ivl
        xmit    0h,dliv[1]
        call    sub_0b7e	; ret 0ah
	jmp     x00ba

x007e:  xmit    0c0h,r1
        xmit    0c1h,r2
        xmit    0d0h,r3
        xmit    0d1h,r4
        xmit    5h,r5
        xmit    5h,r6
        xmit    5h,aux
        xmit    2dh,ivl
        xmit    5h,dliv
        call    sub_0627	; ret 0bh
	jmp     x00ba

x008a:  xmit    9h,ivr
        nzt     sriv[1],x0091
        xmit    0d0h,r1
        xmit    0d1h,r2
        xmit    0c0h,r3
        xmit    0c1h,r4
        jmp     x0095

x0091:  xmit    0c0h,r1
        xmit    0c1h,r2
        xmit    0d0h,r3
        xmit    0d1h,r4
x0095:  xmit    5h,r5
        xmit    5h,r6
        xmit    5h,aux
        xmit    2dh,ivl
        xmit    5h,dliv
        call    sub_0627	; ret 0ch
	xmit    39h,ivl
        xmit    1h,aux
        xmit    0c1h,r1
        move    r1,dliv
        add     ivl,ivl
        xmit    0h,r1
        move    r1,dliv
        add     ivl,ivl
        move    r1,dliv
        add     ivl,ivl
        move    r1,dliv
        add     ivl,ivl
        xmit    9h,ivr
        xmit    80h,r1
        nzt     sriv[0],x00ac
        xmit    1h,r1
x00ac:  move    r1,dliv
        add     ivl,ivl
        xmit    0h,dliv
        call    sub_0ca8	; ret 0dh
	jmp     x00ba

x00b2:  xmit    3ah,ivr
        xmit    8h,driv
        xmit    0h,r1
        xmit    0h,r2
        xmit    0h,r3
        xmit    0h,r4
        call    sub_0627	; ret 0eh
x00ba:  xmit    35h,ivl
        xmit    0h,dliv
        xmit    3bh,ivr
        xmit    1h,driv
        jmp     x03b8

; XXX start of unreachable code?
        xmit    7h,aux
        xmit    5ch,ivr
        move    aux,driv[7:2]
        xmit    1h,aux
        xmit    5ah,ivr
        xor     sriv[0],aux
        xmit    38h,ivr
        move    aux,driv[0]
        xmit    39h,ivr
        move    aux,driv[0]
        xmit    5ch,ivr
        xmit    1h,driv[5]
        jmp     x03b8

        xmit    35h,ivl
        move    sliv[6],aux
        nzt     aux,x00d0
        jmp     x0b88
; XXX end of unreachable code

x00d0:  xmit    40h,aux
        xmit    4h,ivr
	xor     sriv,aux
        nzt     aux,x00d6
        xmit    0h,dliv[6]
        jmp     x0b88

x00d6:  jmp     x0a57

; XXX start of unreachable code
	jmp     0dd6h
        nzt     sliv[3:1],00d7h
        add     r12,driv[5:0]
        xor     ivr,driv[4:2]
        add     r12>>>2,r2
        move    sliv[7:1],aux
        move    aux>>>7,aux
        nop     
        nop     
        jmp     0529h
        xmit    1fh,driv[4:0]
        xmit    69h,r11
        jmp     01eah
        xmit    1h,ivr
        move    r2,dliv
        xmit    14h,ivl
        move    r1,dliv
        xmit    0ffh,aux
        jmp     052eh
        xor     r1,r11
        move    sliv[6],aux
        xmit    1fh,driv[4:0]
        xmit    2h,r2
        xmit    35h,ivl
        xmit    1h,dliv[6]
        jmp     0537h
        xmit    3h,ivr
        xmit    0fch,aux
        move    aux,driv
        xmit    38h,ivl
        xmit    41h,ivl
        move    sliv,r2
        move    sliv[7:1],aux
        move    aux>>>7,aux
        move    aux,dliv
        xmit    14h,ivl
        move    r2,dliv
        jmp     0548h
        xmit    1fh,driv[4:0]
        jmp     0d0eh
        xor     ivr>>>6,r3
        xmit    14h,ivl
        move    sliv[0],aux
        xmit    3eh,r4
        add     r4,r4
        jmp     0110h
        jmp     0549h
        xmit    0ch,driv[7:5]
        xmit    0a8h,r3
        xmit    35h,ivl
        move    sliv[6],r1
        xmit    3eh,aux
        nzt     r1,010dh
	xmit    1bh,aux
	jmp     0a54h
        xor     r12>>>6,r15
        xmit    0ch,driv[7:5]
	xmit    35h,ivl
        move    sliv[7],aux
        xmit    0h,dliv[7]
        xmit    1ah,ivl
        nzt     aux,0116h
        jmp     0549h
	jmp     0576h
        xor     r12>>>6,r15
        xec     010ch,sriv[3:1]
        xmit    0a8h,r3
        xor     r12,driv[1]
        move    r2>>>1,r1
        xmit    0fh,driv[5:3]
        xmit    93h,r15
        and     sriv[6:1],dliv[10:5]
        xec     016ah,aux
        add     r1>>>6,r15
        xor     ivr,dliv[1]
        jmp     1fcdh

        xmit    0ch,driv[7:5]
        xmit    0a8h,r3
        xor     r12,driv[5:0]
        xor     ovf>>>7,r5
        xor     ovf>>>7,r13
        xmit    0ffh,aux
        xmit    3fh,ivl
        move    aux,dliv
        xmit    40h,ivl
        move    aux,dliv
        xmit    41h,ivl
        move    aux,dliv
        xmit    25h,ivl
        jmp     043ch
        xor     r12,driv[8:7]
        xor     r12,driv[2:1]
        xor     r12>>>3,r4
        xor     r12>>>3,r12
        xmit    1h,aux
        xmit    0fdh,r2
	add     r1,r1
        nzt     r1,0137h
        add     r2,r2
        nzt     r2,0137h
        jmp     0482h
        jmp     0482h
        dw      2248h		; add r2>>>4,ovf ???
        xor     r1,driv[5]
        nzt     r2,0162h
; XXX end of unreachable code


x0140:  xmit    4fh,ivr
        xmit    1fh,driv[4:0]
        call    sub_0676	; ret 0fh
	xmit    26h,r6
        xmit    0h,r5
x0146:  move    r6,ivl
        move    sliv[7],aux
        nzt     aux,x0150
x0149:  xmit    3ah,ivr
        xec     x014c,r5
        jmp     x0166

; xec table
x014c:  xmit    0h,driv[0]
        xmit    0h,driv[1]
        xmit    0h,driv[5]
        xmit    0h,driv[6]

x0150:  move    sliv[5:4],r6
        xmit    32h,ivl
        move    r5,dliv
        xmit    16h,ivl
        xmit    0h,dliv
        xmit    1h,ivl
        move    r6,dliv[5:4]
        xmit    36h,ivl
        xmit    1h,dliv[3]
        jmp     x0507

x015a:  xmit    32h,ivl
        move    sliv,r5
        xmit    3ah,ivr
        xec     x015f,r5
        jmp     x0166

; xec table
x015f:  xmit    1h,driv[0]
        xmit    1h,driv[1]
        xmit    1h,driv[5]
	xmit    1h,driv[6]

x0163:  xmit    32h,ivl
        move    sliv,r5
        jmp     x0149

x0166:  call    sub_0676	; 10h
	xmit    1h,aux
        add     r5,r5
	xmit    4h,aux
        and     r5,aux
        nzt     aux,x0170
        xmit    26h,aux
        add     r5,r6
        jmp     x0146

x0170:  xmit    0h,r5
x0171:  xmit    5ch,ivr
        xec     x01aa,r5
        move    aux,driv[7:2]
        xmit    5ah,ivr
        move    sriv[0],r1
        xmit    38h,ivr
        xec     x01ae,r5
        xor     r1,aux
        nzt     aux,x019a
        xmit    1h,aux
        xor     r1,aux
        xmit    38h,ivr
        xec     x01b2,r5
        xmit    39h,ivr
        xec     x01b2,r5
        xmit    3bh,ivr
        xmit    2h,driv
        xmit    38h,ivr
        xmit    1h,driv[2]
        xmit    0h,aux
        add     sriv[6:5],aux
        move    aux>>>2,aux
        add     sriv[1:0],aux
        move    aux>>>2,aux
        xmit    3ch,ivr
        move    aux,driv
        xmit    1h,ivr
        xmit    0h,driv[5]
        nzt     r1,x018f
        jmp     x019a

x018f:  call    sub_0790	; 11h
	xmit    0ffh,aux
        move    aux,driv
        xmit    4ch,ivr
        move    sriv,aux
        xor     r5,aux
        nzt     aux,x019a
        xmit    4ah,ivr
        xmit    0ffh,aux
        move    aux,driv
x019a:  xmit    5ch,ivr
        xmit    1h,driv[5]
        call    sub_0676	; ret 12h
	xmit    1h,aux
        xmit    0fch,r2
x01a0:  add     r1,r1
        nzt     r1,x01a0
        add     r2,r2
        nzt     r2,x01a0
        add     r5,r5
        xmit    4h,aux
        and     r5,aux
        nzt     aux,x01a9
        jmp     x0171

x01a9:  jmp     x0140

; xec table
x01aa:  xmit    0fh,aux
        xmit    2fh,aux
        xmit    1eh,aux
        xmit    3eh,aux

; xec table
x01ae:  move    sriv[0],aux
        move    sriv[1],aux
        move    sriv[5],aux
        move    sriv[6],aux

; xec table
x01b2:  move    aux,driv[0]
        move    aux,driv[1]
        move    aux,driv[5]
        move    aux,driv[6]

x01b6:  xmit    5ch,ivr
        xmit    0h,driv[3]
        xmit    0h,driv[4]
        xmit    0d2h,r2
        xmit    0h,r1
        xmit    1h,aux
x01bc:  add     r1,r1
        xmit    1h,driv[4]
        nzt     r1,x01bc
        add     r2,r2
        nzt     r2,x01bc
        xmit    5dh,ivr
        move    sriv[7],aux
        nzt     aux,x01ce
x01c4:  call    sub_0790	; ret 13h
	xmit    0h,driv
        xmit    35h,ivl
        move    sliv[1],aux
        nzt     aux,x01cb
        jmp     x039c

x01cb:  xmit    0h,dliv[1]
        call    sub_07b5	; ret 14h, does not return!

x01ce:  xmit    0b1h,r3
x01cf:  xmit    5ch,ivr
        xmit    1h,driv[3]
        xmit    0h,driv[4]
        xmit    0d2h,r2
        xmit    1h,aux
x01d4:  add     r1,r1
        xmit    1h,driv[4]
        nzt     r1,x01d4
        add     r2,r2
        nzt     r2,x01d4
        xmit    5dh,ivr
        move    sriv[7],aux
        nzt     aux,x01dd
        jmp     x01c4

x01dd:  add     r3,r3
        nzt     r3,x01cf
        call    sub_0790	; ret 15h
	xmit    0ffh,aux
        move    aux,driv
        jmp     x039e

x01e4:  xmit    5dh,ivr
        nzt     sriv[5],x01e7
        jmp     x03a2

x01e7:  xmit    6h,ivl
        move    sliv[5:4],aux
        xmit    4ch,ivr
	xor     sriv,aux
        nzt     aux,x01f3
        xmit    8h,ivl
        move    sliv,aux
        xmit    4ah,ivr
        xor     sriv,aux
        nzt     aux,x01f3
        xmit    0ffh,aux
        move    aux,driv
x01f3:  call    sub_07b3	; ret 16h
        call    sub_07ef	; ret 17h
	xmit    0d5h,aux
        add     r4,aux
        xmit    5bh,ivr
        xmit    1h,driv[7]
        nzt     ovf,x01fd
        xmit    0h,driv[7]
x01fd:  xmit    0c4h,aux
        add     r4,aux
        xmit    5ch,ivr
        xmit    0h,driv[1]
        nzt     ovf,x0203
        xmit    1h,driv[1]
x0203:  xmit    98h,r3
        nzt     r5,x0206
        xmit    0cch,r3
x0206:  xmit    5h,ivl
        move    sliv[6],aux
        nzt     aux,x020a
        jmp     x0210

x020a:  xmit    24h,ivl
        move    r3,dliv
        xmit    1ah,r4
        call    sub_0adf	; ret 18h
	jmp     x0236

x0210:  xmit    0ffh,aux
        xmit    24h,ivl
        move    aux,dliv
        xmit    1ah,r4
        call    sub_0adf	; ret 19h
	xmit    3h,ivr
        move    r3,driv
        xmit    1ah,aux
        xmit    4h,ivr
        move    aux,driv
        xmit    1h,ivr
        xmit    12h,driv[4:0]
        xmit    2h,ivr
        move    sriv,r1
        xmit    1h,ivr
        xmit    0ch,driv[4:0]
        xmit    1h,aux
        xmit    1h,r2
x0223:  xmit    1h,ivr
        xmit    0h,driv[4]
        xmit    2h,ivr
        move    r2,driv
        xmit    1h,ivr
        xmit    1h,driv[4]
        xmit    3h,ivr
        add     sriv,driv
        xmit    1h,ivr
        xmit    0h,driv[4]
        add     r2,r2
        xmit    2h,ivr
        move    r1,driv
        xmit    1h,ivr
        xmit    1h,driv[4]
        xmit    3h,ivr
        add     sriv,driv
        nzt     ovf,x0236
        jmp     x0223

x0236:  xmit    1ah,aux
        xmit    4h,ivr
        move    aux,driv
        xmit    3h,ivr
        move    r3,driv
        xmit    1h,ivr
        xmit    12h,driv[4:0]
        call    sub_077d	; ret 1ah
	xmit    0ffh,r2
        xmit    0h,r3
        nzt     r5,x0244
        xmit    0h,r2
        xmit    0ffh,r3
x0244:  xmit    2h,ivl
        xmit    0c0h,r1
        move    r1,dliv
        xmit    1h,aux
        xmit    5ah,ivr
        xmit    6h,driv[7:4]
x024a:  xmit    5dh,ivr
        nzt     sriv[6],x0252
x024c:  xmit    5ah,ivr
        nzt     sriv[1],x024c
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        jmp     x024a

x0252:  xmit    5ah,ivr
        nzt     sriv[1],x0252
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        xmit    5dh,ivr
        move    sriv[6],r1
        nzt     r1,x0252
x025a:  xmit    5ah,ivr
        nzt     sriv[1],x025a
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        add     sliv,dliv
        nzt     ovf,x0262
        jmp     x025a

x0262:  xmit    5ah,ivr
        nzt     sriv[1],x0262
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        xmit    0fah,r1
        nzt     r5,x026a
        xmit    0fch,r1
x026a:  move    r1,dliv
x026b:  xmit    5ah,ivr
        nzt     sriv[1],x026b
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        add     sliv,dliv
        nzt     ovf,x0273
        jmp     x026b

x0273:  xmit    5ah,ivr
        nzt     sriv[1],x0273
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        nzt     r5,x0282
        xmit    0f5h,r4
x027a:  xmit    5ah,ivr
        nzt     sriv[1],x027a
        xmit    5h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r4,driv
        xmit    7eh,r4
        jmp     x0295

x0282:  xmit    5ah,ivr
        nzt     sriv[1],x0282
        xmit    7h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
x0288:  xmit    5ah,ivr
        nzt     sriv[1],x0288
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        xmit    2ah,r4
x028e:  xmit    5ah,ivr
        nzt     sriv[1],x028e
        xmit    5h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r4,driv
        xmit    54h,r4
x0295:  xmit    5ah,ivr
        nzt     sriv[1],x0295
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r4,driv
        xmit    8h,ivl
x029b:  xmit    5ah,ivr
        nzt     sriv[1],x029b
        xmit    7h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    sliv,driv
x02a1:  xmit    5ah,ivr
        nzt     sriv[1],x02a1
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    0h,driv
        xmit    2h,ivr
        move    sriv,r1
x02a8:  xmit    5ah,ivr
        nzt     sriv[1],x02a8
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r1,driv
x02ad:  xmit    5ah,ivr
        nzt     sriv[1],x02ad
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    0h,driv
        xmit    3h,ivr
        add     sriv,driv
x02b4:  xmit    5ah,ivr
        nzt     sriv[1],x02b4
        xmit    5fh,ivr
        xmit    5fh,ivr
x02b8:  xmit    5ah,ivr
        xmit    0h,driv[6]
        nzt     sriv[1],x02b8
        xmit    5fh,ivr
        xmit    5fh,ivr
x02bd:  xmit    5ah,ivr
        nzt     sriv[1],x02bd
        xmit    1h,driv[6]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        xmit    0f0h,r1
        nzt     r5,x02c6
        xmit    0f7h,r1
x02c6:  xmit    5ah,ivr
        nzt     sriv[1],x02c6
        xmit    6h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        xmit    2h,ivl
        move    r1,dliv
x02ce:  xmit    5ah,ivr
        nzt     sriv[1],x02ce
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        add     sliv,dliv
        nzt     ovf,x02d6
        jmp     x02ce

x02d6:  xmit    5ah,ivr
        nzt     sriv[1],x02d6
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        xmit    0fah,r1
        nzt     r5,x02de
        xmit    0fch,r1
x02de:  move    r1,dliv
        jmp     x02e0

x02e0:  xmit    5ah,ivr
        nzt     sriv[1],x02e0
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        add     sliv,dliv
        nzt     ovf,x02e8
        jmp     x02e0

x02e8:  xmit    5ah,ivr
        nzt     sriv[1],x02e8
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        nzt     r5,x02f7
        xmit    0f5h,r4
x02ef:  xmit    5ah,ivr
        nzt     sriv[1],x02ef
        xmit    5h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r4,driv
        xmit    6fh,r4
        jmp     x030a

x02f7:  xmit    5ah,ivr
        nzt     sriv[1],x02f7
        xmit    7h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
x02fd:  xmit    5ah,ivr
        nzt     sriv[1],x02fd
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        xmit    2ah,r4
x0303:  xmit    5ah,ivr
        nzt     sriv[1],x0303
        xmit    5h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r4,driv
        xmit    45h,r4
x030a:  xmit    5ah,ivr
        nzt     sriv[1],x030a
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r4,driv
        xmit    2h,ivr
        move    sriv,r4
x0311:  xmit    5ah,ivr
        nzt     sriv[1],x0311
        xmit    7h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r4,driv
        xmit    2h,ivl
        xmit    80h,r1
        move    r1,dliv
x031a:  xmit    5ah,ivr
        nzt     sriv[1],x031a
        xmit    5fh,ivr
        xmit    5fh,ivr
        add     sliv,dliv
        nzt     ovf,x0321
        jmp     x031a

x0321:  xmit    5ah,ivr
        xmit    0h,driv[6]
        nzt     sriv[1],x0321
        xmit    5fh,ivr
        xmit    5fh,ivr
        nzt     r5,x032b
x0327:  xmit    5ah,ivr
        nzt     sriv[1],x0327
        xmit    5fh,ivr
        xmit    5fh,ivr
x032b:  xmit    5ah,ivr
        nzt     sriv[1],x032b
        xmit    1h,driv[6]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
x0331:  xmit    5ah,ivr
        nzt     sriv[1],x0331
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        xmit    3h,ivr
        add     sriv,driv
x0338:  xmit    5ah,ivr
        nzt     sriv[1],x0338
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        nzt     ovf,x033f
        jmp     x0342

x033f:  xmit    5ah,ivr
        xmit    1h,driv[7]
        jmp     x039c

x0342:  xmit    5ah,ivr
        nzt     sriv[1],x0342
        xmit    6h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        xmit    0f2h,aux
        nzt     r5,x034b
        xmit    0e9h,aux
x034b:  xmit    2h,ivl
        move    aux,dliv
        xmit    1h,aux
x034e:  xmit    5ah,ivr
        nzt     sriv[1],x034e
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        add     sliv,dliv
        nzt     ovf,x0356
        jmp     x034e

x0356:  xmit    0fah,r1
        nzt     r5,x0359
        xmit    0fch,r1
x0359:  xmit    5ah,ivr
        nzt     sriv[1],x0359
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r2,driv
        move    r1,dliv
        jmp     x026b

x0360:  call    sub_0756	; ret 1bh
        call    sub_0796	; ret 1ch
	xmit    0h,ivl
        move    sliv[3],r5
        xmit    9h,ivl
        xmit    0h,dliv[7:6]
        xmit    0cbh,aux
        nzt     r5,x036c
        xmit    0e5h,aux
        xmit    0h,dliv[5]
x036c:  xmit    6h,ivl
        nzt     sliv[2],x036f
        jmp     x037a

x036f:  xmit    9h,ivl
        add     sliv,r1
        nzt     ovf,x0398
        nzt     sliv,x0374
        jmp     x0398

x0374:  xmit    0ffh,aux
        add     r1,aux
        xmit    7h,ivl
        add     sliv,aux
        nzt     ovf,x0398
        jmp     x037e

x037a:  move    sliv[1],aux
        xor     sliv[0],aux
        nzt     aux,x037e
        jmp     x0382

x037e:  xmit    8h,ivl
        xmit    0b3h,aux
        add     sliv,aux
        nzt     ovf,x0398
x0382:  xmit    6h,ivl
        move    sliv[2:0],aux
        xec     x0387,aux
x0385:  call    sub_07b3	; ret 1dh

; xec table
x0387:  jmp     x039c
        jmp     x0385
        jmp     x01e4
        jmp     x01b6
        jmp     x03f4
        jmp     x041c
        jmp     x03cd
        jmp     x03cd

x038f:  xmit    0dh,ivl
        xmit    3h,ivr
        move    sliv,driv
        xmit    0eh,ivl
        xmit    4h,ivr
        move    sliv,driv
        xmit    5h,ivr
        xmit    0h,driv
        jmp     x06eb

x0398:  xmit    8h,r1
        jmp     x03a3

x039a:  xmit    80h,r1
        jmp     x03a3

x039c:  xmit    0h,r1
        jmp     x03a3

x039e:  xmit    4h,r1
        jmp     x03a3

x03a0:  xmit    0ah,r1
        jmp     x03a3

x03a2:  xmit    10h,r1
x03a3:  xmit    3ch,ivr
        move    r1,driv
        xmit    3bh,ivr
        xmit    0h,driv
        xmit    0h,ivl
        move    sliv[3],aux
        xmit    38h,ivr
        nzt     aux,x03af
        xmit    5h,ivl
        move    sliv[2],aux
        nzt     aux,x038f
        xmit    39h,ivr
x03af:  xmit    5h,ivl
        xmit    1h,aux
        xor     sliv[4],r1
        move    r1,driv[2]
        xmit    1h,ivr
        xmit    0dfh,aux
        move    aux,driv
        xmit    31h,ivl
        xmit    0h,dliv
x03b8:  xmit    32h,ivl
        xmit    0feh,aux
        move    aux,dliv
        xmit    30h,ivl
        xmit    0h,dliv
        xmit    2fh,ivl
        xmit    0h,dliv
x03bf:  call    sub_0676	; ret 1eh
	xmit    1h,aux
        xmit    2fh,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    30h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    32h,ivl
        add     sliv,dliv
        nzt     ovf,x03cc
        jmp     x03bf

x03cc:  jmp     x0140

x03cd:  xmit    5dh,ivr
        nzt     sriv[5],x03d0
        jmp     x03a2

x03d0:  xmit    6h,ivl
        move    sliv[5:4],aux
        xmit    4ch,ivr
        xor     sriv,aux
        nzt     aux,x03dc
        xmit    8h,ivl
        move    sliv,aux
        xmit    4ah,ivr
        xor     sriv,aux
        nzt     aux,x03dc
        xmit    0ffh,aux
        move    aux,driv
x03dc:  xmit    80h,r3
        xmit    24h,ivl
        move    r3,dliv
        xmit    1ah,r4
        call    sub_0adf	; ret 1fh
	xmit    4h,ivr
        xmit    1ah,aux
        move    aux,driv
        xmit    3h,ivr
        xmit    80h,aux
        move    aux,driv
        call    sub_093e	; ret 20h
	xmit    0ffh,aux
        xmit    7h,ivl
        add     sliv,dliv
        move    sliv,aux
        nzt     aux,x03f0
        jmp     x039c

x03f0:  xmit    1h,aux
        xmit    9h,ivl
        add     sliv,dliv
        jmp     x03dc

x03f4:  xmit    8h,ivl
        move    sliv,aux
        xmit    4ah,ivr
        xor     sriv,aux
        nzt     aux,x03ff
        xmit    6h,ivl
        move    sliv[5:4],aux
        xmit    4ch,ivr
        xor     sriv,aux
        nzt     aux,x03ff
        jmp     x0409

x03ff:  call    sub_08a1	; ret 21h
	xmit    8h,ivl
        move    sliv,aux
        xmit    4ah,ivr
        move    aux,driv
        xmit    6h,ivl
        move    sliv[5:4],aux
        xmit    4ch,ivr
        move    aux,driv
x0409:  xmit    9h,ivl
        move    sliv[0],r3
        move    r3>>>1,r3
        move    sliv[7:1],r4
        xmit    24h,ivl
        xmit    80h,aux
        move    aux,dliv
        call    sub_0b2f	; ret 22h
	xmit    0ffh,aux
        xmit    7h,ivl
        add     sliv,dliv
        move    sliv,aux
        nzt     aux,x0418
        jmp     x039c

x0418:  xmit    1h,aux
        xmit    9h,ivl
        add     sliv,dliv
        jmp     x0409

x041c:  xmit    8h,ivl
        move    sliv,aux
        xmit    4ah,ivr
        xor     sriv,aux
        nzt     aux,x0427
        xmit    6h,ivl
        move    sliv[5:4],aux
        xmit    4ch,ivr
        xor     sriv,aux
        nzt     aux,x0427
        jmp     x039c

x0427:  call    sub_08a1	; ret 23h
	xmit    8h,ivl
        move    sliv,aux
        xmit    4ah,ivr
        move    aux,driv
        xmit    6h,ivl
        move    sliv[5:4],aux
        xmit    4ch,ivr
        move    aux,driv
        jmp     x039c

x0432:  xmit    9h,ivl
        xmit    1h,aux
        xor     sliv,aux
        xmit    6h,ivl
        add     sliv[3],aux
        xmit    8h,ivl
        add     sliv,aux
        nzt     aux,x0480
        nzt     ovf,x0480
x043b:  xmit    25h,ivl
x043c:  xmit    0e1h,aux
        move    aux,dliv
x043e:  call    sub_0a34	; ret 24h
        call    sub_0639	; ret 25h
	xmit    20h,aux
        call    sub_09d3	; ret 26h
	xmit    0ffh,aux
        xmit    25h,ivl
        add     sliv,dliv
        move    sliv,aux
        nzt     aux,x043e
        xmit    35h,ivl
        move    sliv[4],aux
        nzt     aux,x0480
        xmit    1h,dliv[4]
        jmp     x043b

x044f:  xmit    3h,ivr
        xmit    0h,driv
        xmit    4h,ivr
        xmit    1ch,aux
        move    aux,driv
        xmit    0e5h,r1
x0455:  call    sub_0662	; ret 27h
	nzt     ovf,x0459
        jmp     x0455

x0459:  xmit    25h,ivl
        xmit    8fh,aux
        move    aux,dliv
x045c:  xmit    24h,ivl
        xmit    80h,aux
        move    aux,dliv
        xmit    1fh,ivl
        xmit    1ch,aux
        move    aux,dliv
        xmit    20h,ivl
        xmit    0h,dliv
        xmit    35h,ivl
        xmit    1h,dliv[1]
        call    sub_0ac6	; ret 28h
	xmit    80h,r2
        xmit    36h,ivl
        xmit    1h,dliv[5]
        call    sub_0639	; ret 29h
x046d:  call    sub_0b77	; ret 2ah
        call    sub_0b7d	; ret 2bh
	xmit    1h,aux
        call    sub_09d3	; ret 2ch
	xmit    1h,aux
        xmit    24h,ivl
        add     sliv,dliv
        nzt     ovf,x0479
        jmp     x046d

x0479:  call    sub_0bb6		; ret 2dh
	xmit    1h,aux
        xmit    25h,ivl
        add     sliv,dliv
        nzt     ovf,x0480
        jmp     x045c

x0480:  call    sub_0c91		; ret 2eh
x0482:  xmit    36h,ivr
        xmit    0h,driv
        xmit    37h,ivr
        xmit    0h,driv
        xmit    35h,ivl
        xmit    1h,dliv[4:3]
        xmit    36h,ivl
        xmit    0h,dliv[3]
        xmit    8h,ivl
        move    sliv[6:0],r1
        move    sliv[7],aux
        xmit    9h,ivl
        move    sliv[7],r2
        add     r2>>>7,r2
        xmit    15h,ivl
        move    r2,dliv
        xmit    6h,ivl
        move    sliv[3],aux
        add     r1>>>7,r1
        xmit    14h,ivl
        move    r1,dliv
        move    sliv[6:0],r1
        move    sliv[7],aux
        xmit    17h,ivl
        xmit    0h,dliv
        move    r1,dliv[7:1]
        add     r2>>>7,r2
        xmit    18h,ivl
        move    r2,dliv
        xmit    14h,ivl
        move    sliv[3:0],r1
        move    sliv[7:4],aux
        xmit    0h,dliv
        move    r1,dliv[7:4]
        xmit    15h,ivl
        move    sliv[3:0],r1
        move    sliv[7:4],r2
        move    aux,dliv[3:0]
        move    r1,dliv[7:4]
        xmit    16h,ivl
        move    r2,dliv
        xmit    17h,ivl
        move    sliv,aux
        xmit    14h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    18h,ivl
        add     sliv,aux
        move    ovf,r1
        xmit    15h,ivl
        add     sliv,dliv
        move    ovf,aux
        add     r1,aux
        xmit    16h,ivl
        add     sliv,dliv
        xmit    1h,aux
        xmit    9h,ivl
        add     sliv,r1
        xmit    3fh,aux
        and     r1>>>1,r1
        xmit    0ffh,aux
        add     r1,aux
        xmit    14h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    15h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    16h,ivl
        add     sliv,dliv
        xmit    9h,ivl
        move    sliv[5:0],r1
        xmit    1ah,ivl
        move    r1,dliv
        xmit    7h,ivl
        move    sliv,r1
        xmit    1bh,ivl
        move    r1,dliv
        call    sub_0756	; ret 2fh
	xmit    6h,ivl
        move    sliv[7],aux
        add     sliv[5],aux
        nzt     aux,x04ea
        move    sliv[4],aux
        move    aux>>>7,aux
        add     sliv[6],aux
        xmit    26h,r3
        add     r3,r3
        move    r3,ivl
        move    sliv,r1
        xmit    1h,ivl
        move    r1,dliv
        move    sliv[3:2],r1
        move    sliv[7],r2
        xmit    4h,aux
        add     r3,ivl
        move    sliv,r4
        xmit    2eh,ivl
        move    r4,dliv
        xmit    7eh,aux
        xmit    23h,ivl
        move    aux,dliv
        nzt     r2,x04f2
x04ea:  xmit    11h,r1
        xmit    36h,ivr
        xmit    80h,r2
        move    r2,driv
        xmit    37h,ivr
        move    r2,driv
        call    sub_0c7d		; ret 30h
x04f2:  xmit    1h,ivl
        move    sliv[1:0],r6
x04f4:  nzt     r6,x04f6
        jmp     x05e5

x04f6:  xmit    14h,ivl
        xmit    0h,aux
        add     sliv,dliv
        xmit    15h,ivl
        move    ovf,aux
        add     sliv,dliv
        move    ovf,r1
        xmit    40h,aux
        add     sliv,dliv
        xmit    16h,ivl
        move    ovf,aux
        add     sliv,dliv
        move    r1,aux
        add     sliv,dliv
        xmit    0ffh,aux
        add     r6,r6
        jmp     x04f4

x0507:  xmit    0h,r1
        call    sub_0639	; ret 31h
	xmit    36h,ivl
        move    sliv[3],aux
        nzt     aux,x050f
        call    sub_0c91	; ret 32h
x050f:  jmp     x015a

x0510:  xmit    1h,r1
        call    sub_0639	; ret 33h
        call    sub_0c91	; ret 34h
x0515:  xmit    0bh,r1
	call    sub_0639	; ret 35h
        call    sub_0c91	; ret 36h
x051a:  xmit    1h,ivl
        move    sliv[5:4],aux
        move    aux>>>3,aux
        xmit    16h,ivl
        add     sliv[6:0],aux
        xmit    3fh,ivl
        xor     sliv,aux
	nzt     aux,x052e
        xmit    15h,ivl
        move    sliv,aux
        xmit    40h,ivl
        xor     sliv,aux
        nzt     aux,x052e
        xmit    14h,ivl
        move    sliv[7:1],aux
	move    aux>>>7,aux
        xmit    41h,ivl
        xor     sliv,aux
        nzt     aux,x052e
        jmp     x0554

x052e:  xmit    14h,ivl
        move    sliv[7:1],r1
        move    r1>>>7,r1
        move    sliv,r2
        xmit    41h,ivl
        move    r2,dliv
        xmit    14h,ivl
        move    r1,dliv
        xmit    0ffh,aux
	xmit    3fh,ivl
        move    aux,dliv
        xmit    40h,ivl
        move    aux,dliv
        call    sub_0a63	; ret 37h
	xmit    2h,r2
        xmit    35h,ivl
        xmit    1h,dliv[6]
        call    sub_0639	; ret 38h
	xmit    1h,ivl
        move    sliv[5:4],aux
        move    aux>>>3,aux
        xmit    16h,ivl
        add     sliv[6:0],aux
        xmit    3fh,ivl
	move    aux,dliv
	xmit    15h,ivl
        move    sliv,aux
        xmit    40h,ivl
        move    aux,dliv
        xmit    41h,ivl
        move    sliv,r2
        move    sliv[7:1],aux
        move    aux>>>7,aux
        move    aux,dliv
        xmit    14h,ivl
        move    r2,dliv
x0554:  xmit    14h,ivl
        move    sliv[0],aux
        xmit    1eh,r4
        add     r4,r4
        xmit    35h,ivl
        move    sliv[7],aux
        xmit    0h,dliv[7]
        nzt     aux,x055d
        jmp     x055e

x055d:  jmp     x0587

x055e:  xmit    1ah,ivl
        move    sliv[0],aux
        nzt     aux,x0563
x0561:  xmit    80h,r3
        jmp     x0564

x0563:  xmit    0h,r3
x0564:  xmit    6h,ivl
        xmit    4h,aux
        xor     sliv[2:0],aux
        nzt     aux,x056d
        xmit    24h,ivl
        xmit    80h,aux
        move    aux,dliv
        call    sub_0b2f	; ret 39h
x056d:  xmit    1ah,ivl
        xmit    1h,aux
        add     sliv,dliv
        move    sliv[0],r2
        xmit    1bh,ivl
        xmit    0ffh,aux
        add     sliv,dliv
        move    sliv,aux
        nzt     aux,x0578
	call    sub_0c91	; ret 3ah
x0578:  nzt     r2,x057a
        jmp     x0561

x057a:  xmit    14h,ivl
        xmit    1h,aux
        add     sliv,dliv
        move    ovf,aux
        xmit    15h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    16h,ivl
        add     sliv,dliv
        jmp     x051a

x0584:  xmit    35h,ivl
        xmit    1h,dliv[7]
        jmp     x051a

x0587:  xmit    1ah,ivl
        move    sliv[0],aux
        nzt     aux,x058b
        jmp     x05c3

x058b:  xmit    0h,r3
        xmit    24h,ivl
        xmit    80h,aux
        move    aux,dliv
        call    sub_0adf	; ret 3bh
	xmit    1bh,ivl
        move    sliv[7:1],r1
        nzt     r1,x0595
        jmp     x05b1

x0595:  xmit    80h,r3
        xmit    24h,ivl
        xmit    80h,aux
        move    aux,dliv
        call    sub_0adf	; ret 3ch
	xmit    1fh,ivl
        move    r4,dliv
        xmit    20h,ivl
        xmit    0h,dliv
        xmit    35h,ivl
        xmit    1h,dliv[1]
        call    sub_0ac6	; ret 3dh
	xmit    1h,r2
        call    sub_0639	; ret 3eh
	xmit    35h,ivl
        xmit    0h,dliv[1]
        call    sub_0b7d	; ret 3fh
	xmit    1bh,ivl
        xmit    0ffh,aux
        add     sliv,dliv
        xmit    1ah,ivl
        xmit    1h,aux
        add     sliv,dliv
        jmp     x05d8

x05b1:  xmit    1fh,ivl
        move    r4,dliv
        xmit    20h,ivl
        xmit    0h,dliv
        xmit    35h,ivl
        xmit    1h,dliv[1]
        call    sub_0ac6	; ret 40h
	xmit    1h,r2
        call    sub_0639	; ret 41h
	xmit    35h,ivl
        xmit    0h,dliv[1]
        xmit    20h,ivl
        xmit    10h,dliv[7:3]
        call    x0b74		; ret 42h
	jmp     x05d8

x05c3:  xmit    80h,r3
        xmit    24h,ivl
        xmit    80h,aux
        move    aux,dliv
        call    sub_0adf	; ret 43h
	xmit    1fh,ivl
        move    r4,dliv
        xmit    20h,ivl
        xmit    0h,dliv
        xmit    35h,ivl
        xmit    1h,dliv[1]
        call    sub_0ac6	; ret 44h
	xmit    1h,r2
        call    sub_0639	; ret 45h
	xmit    35h,ivl
        xmit    0h,dliv[1]
        call    sub_0b7d	; ret 46h
x05d8:  xmit    1ah,ivl
        xmit    1h,aux
        add     sliv,dliv
        call    sub_09d3	; ret 47h
	xmit    1bh,ivl
        xmit    0ffh,aux
        add     sliv,dliv
        move    sliv,aux
        nzt     aux,x05e4
        call    sub_0c91	; ret 48h
x05e4:  jmp     x0584

x05e5:  xmit    3dh,ivr
        xmit    1h,driv[7]
        xmit    6h,ivl
        move    sliv[2:0],r1
        xec     x05ec,r1
        call    sub_0c83	; ret 49h

; xec table
x05ec:  jmp     x0507
        jmp     x0515
        jmp     x0432
        jmp     x0510
        jmp     x051a
        jmp     x051a
        jmp     x0584
        xmit    63h,r1


; XXX start of unreachable garbage
        jmp     0600h
        jmp     0432h
        jmp     0517h
        jmp     0521h
        jmp     0521h
        jmp     058bh
        xmit    63h,r1
        jmp     0600h
        xmit    1h,dliv[1]
        xmit    48h,r11
        jmp     0a94h
        xmit    1h,r2
; XXX end of unreachable garbage


x0600:  xec     x0603-1,r1
	call    sub_0c7d	; ret 4ah

x0603:  xmit    28h,r1
        xmit    2dh,r1
        xmit    19h,r1
        xmit    10h,r1
        xmit    1bh,r1
        xmit    25h,r1
        xmit    11h,r1
        xmit    2dh,r1
        xmit    10h,r1
        xmit    43h,r1
        xmit    1dh,r1
        xmit    63h,r1
        xmit    63h,r1
        xmit    63h,r1
        xmit    63h,r1
        xmit    22h,r1
        xmit    23h,r1
        xmit    1ch,r1
        xmit    1dh,r1
        xmit    29h,r1
        xmit    12h,r1
        xmit    63h,r1
        xmit    1ah,r1
        jmp     x0c8b

; XXX start of unreachable code
        xmit    13h,r1
        xmit    4fh,r1
        xmit    63h,r1
        xmit    29h,r1
        xmit    63h,r1
        xmit    63h,r1
        xmit    63h,r1
        xmit    48h,r1
        xmit    11h,r1
        xmit    47h,r1
        xmit    20h,r1
        return
; XXX end of unreachable code

sub_0627:
	xmit    26h,ivl
        move    r1,dliv
        xmit    27h,ivl
        move    r2,dliv
        xmit    28h,ivl
        move    r3,dliv
        xmit    29h,ivl
        move    r4,dliv
        xmit    2ah,ivl
        move    r5,dliv
        xmit    2bh,ivl
        move    r6,dliv
        xmit    2ch,ivl
        move    aux,dliv
        xmit    23h,ivl
        xmit    7eh,aux
        move    aux,dliv
        return

sub_0639:
	xmit    34h,ivl
        move    r11,dliv
        xmit    38h,ivl
        xmit    39h,aux
        move    aux,dliv
        xmit    1h,ivl
        move    sliv[5:4],aux
        move    aux>>>3,aux
        move    aux,r4
        call    sub_065b	; ret 4bh
	move    r4,aux
        xmit    16h,ivl
        add     sliv[6:0],r1
        call    sub_065b	; ret 4ch
	xmit    15h,ivl
        move    sliv,r1
        call    sub_065b	; ret 4dh
	xmit    14h,ivl
        move    sliv,r1
        call    sub_065b	; ret 4eh
	move    r2,r1
        call    sub_065b	; ret 4fh
	xmit    0h,r1
        call    sub_065b	; ret 50h
        call    sub_0ca8	; ret 51h
	jmp     x0cdb

        return			; automatically inserted by MCCAP


sub_065b:
	xmit    38h,ivl
        move    sliv,ivl
        move    r1,dliv
        xmit    38h,ivl
        xmit    1h,aux
        add     sliv,dliv
        return


sub_0662:
	xmit    2h,ivr
        move    r1,driv
        xmit    1h,ivr
        xmit    0ch,driv[4:0]
        xmit    1h,aux
        xmit    1h,driv[4]
        xmit    1fh,driv[4:0]
        xmit    3h,ivr
        add     sriv,driv
        return

        xmit    1h,ivr
        xmit    12h,driv[4:0]
        xmit    1h,aux
        xmit    2h,ivr
        move    sriv,r1
        xmit    1h,ivr
        xmit    1fh,driv[4:0]
        xmit    3h,ivr
        add     sriv,driv
        return


sub_0676:
	xmit    6h,ivr
        nzt     sriv[7],x0679
        jmp     x067a

x0679:  return


x067a:  jmp     x0680


; XXX start of presumed garbage
        jmp     0680h
        xmit    55h,r11
        jmp     0c7ah
        jmp     0ca9h
        return
; XXX end of presumed garbage


x0680:  nzt     sriv[0],x0689
        xmit    3ah,ivr
        xmit    0h,driv[2]
        xmit    39h,ivr
        xmit    0h,driv[2]
        xmit    38h,ivr
        xmit    0h,driv[2]
        xmit    1h,ivr
        xmit    1h,driv[5]
x0689:  xmit    1h,ivr
        xmit    0h,driv[6]
x068b:  xmit    6h,ivr
        nzt     sriv[7],x068e
        jmp     x068b

x068e:  xmit    35h,ivl
        xmit    0h,dliv[0]
        xmit    1h,ivr
        xmit    1h,driv[6]
        xmit    31h,ivl
        xmit    30h,ivr
        jmp     x06a0


; XXX start of unreachable code
        move    sriv,r1
        xmit    1h,ivr
        xmit    1fh,driv[4:0]
        xmit    3h,ivr
        add     sriv,driv
        return

        xmit    6h,ivr
        nzt     sriv[7],x069e
        jmp     x069f

x069e:  return

x069f:  jmp     x06a0
; XXX end of unreachable code


x06a0:  nzt     sriv[2],x06a6
        nzt     sriv[3],x06a8
        nzt     sriv[4],x06aa
        nzt     sriv[5],x06ac
x06a4:  xmit    0h,driv
        return

x06a6:  xmit    32h,ivr
        jmp     x06b0

x06a8:  xmit    33h,ivr
        jmp     x06b0

x06aa:  xmit    34h,ivr
        jmp     x06b0

x06ac:  xmit    3dh,ivr
        nzt     sriv[7],x06ba
        xmit    1h,driv[7]
        xmit    35h,ivr
x06b0:  xmit    0ch,aux
        add     sliv[1:0],ivl
        move    sriv,dliv
        xmit    31h,ivl
        xmit    1h,aux
        add     sliv,dliv
        xmit    30h,ivr
        move    sriv[2],aux
        nzt     aux,x06a4
        jmp     x06bd

x06ba:  xmit    0h,dliv
        xmit    30h,ivr
        jmp     x06a4

x06bd:  nzt     sliv[0],x06ba
        move    sliv[1:0],aux
        xmit    0h,ivl
        move    sriv,dliv
        xmit    0h,driv
        nzt     aux,x06dc
        xmit    0ch,ivl
        move    sliv,aux
        xmit    0dh,ivl
        move    sliv[3:0],r1
        add     r1>>>4,r1
        xmit    3h,ivr
        move    r1,driv
        move    ovf,aux
        add     sliv[7:4],aux
        xmit    0fh,ivl
        add     sliv,aux
        move    ovf,r2
        xmit    0eh,ivl
        move    sliv[3:0],r1
        add     r1>>>4,r1
        move    ovf,aux
        xmit    4h,ivr
        move    r1,driv
        add     sliv[7:4],aux
        xmit    5h,ivr
        add     r2,driv
        call    sub_073f	; ret 52h
	xmit    9h,r6
        jmp     x0708

x06dc:  xmit    0ch,ivl
        xmit    3h,ivr
        move    sliv,driv
        xmit    0dh,ivl
        xmit    4h,ivr
        move    sliv,driv
        xmit    5h,ivr
        xmit    0h,driv
x06e4:  call    sub_073f	; ret 53h
	xmit    0h,ivl
        move    sliv[4],aux
        nzt     aux,x06eb
        xmit    7h,r6
        jmp     x0708

x06eb:  xmit    2h,ivr
        move    sriv[2],aux
        xmit    0ah,r6
        nzt     aux,x06f0
        xmit    8h,r6
x06f0:  move    sriv[0],aux
        nzt     aux,x06f3
        jmp     x0708

x06f3:  move    sriv[1],aux
        jmp     x0700


; XXX start of unrechable code, presumed garbage
        add     sliv[7:4],aux
        xmit    5h,ivr
        add     r2,driv
        xmit    56h,r11
        jmp     0753h
        xmit    9h,r6
        jmp     071ch
        xmit    0ch,ivl
        xmit    3h,ivr
        move    sliv,driv
        xmit    0dh,ivl
; XXX end of unreachable code, presumed garbage


	org	0700h

x0700:  nzt     aux,x071d
        xmit    24h,ivl
        xmit    0h,dliv
        xmit    1h,aux
x0704:  add     sliv,dliv
        nzt     ovf,x0707
        jmp     x0704

x0707:  jmp     x06e4

x0708:  xmit    5h,r5
x0709:  xmit    2h,ivr
        move    r5,ivl
        move    sriv,dliv
        xmit    0ffh,aux
        add     r6,r6
        nzt     r6,x0710
        jmp     x0738

x0710:  xmit    1h,aux
        add     r5,r5
        xmit    3h,ivr
        add     sriv,driv
        move    ovf,aux
        xmit    4h,ivr
        add     sriv,driv
        move    ovf,aux
        xmit    5h,ivr
        add     sriv,driv
        call    sub_073f	; ret 54h
	jmp     x0709

x071d:  xmit    8h,aux
        xmit    3h,ivr
        add     sriv,driv
        move    ovf,aux
        xmit    4h,ivr
        add     sriv,driv
        call    sub_073f	; ret 55h
	xmit    1h,ivl
        xmit    2h,ivr
        move    sriv,dliv
        xmit    1h,aux
        xmit    3h,ivr
        add     sriv,driv
        move    ovf,aux
        xmit    4h,ivr
        add     sriv,driv
        call    sub_073f	; ret 56h
	xmit    2h,ivr
        move    sriv,aux
        xmit    4h,ivr
        move    aux,driv
        xmit    1h,ivl
        xmit    3h,ivr
        move    sliv,driv
        jmp     x06e4

x0738:  xmit    0h,ivl
        nzt     sliv[5],x073b
        jmp     x0360

x073b:  xmit    5ch,ivr
        xmit    1h,driv[5]
        jmp     x0482

        return			; inserted automatically by MCCAP


sub_073f:
	xmit    33h,ivl		; save return address
        move    r11,dliv

        xmit    2h,ivl
        xmit    0h,dliv
x0743:  xmit    1h,ivr
        xmit    13h,driv[4:0]
        xmit    2h,ivl
        xmit    1h,aux
        add     sliv,dliv
        nzt     ovf,x074f
        xmit    9h,ivr
        move    sriv[7],aux
        nzt     aux,x0752
        call    sub_0676	; ret 57h
	jmp     x0743

x074f:  xmit    66h,r1
        call    sub_0c83	; ret 58h
x0752:  xmit    1h,ivr
	xmit    1fh,driv[4:0]
        jmp     x0cd9

        return			; automatically inserted by MCCAP


sub_0756:
	xmit    31h,ivl
        move    sliv[1:0],r1
        nzt     r1,x075a
        jmp     x0765

x075a:  xmit    0ah,ivl
        move    sliv,aux
        xmit    1ch,ivl
        move    aux,dliv
        xmit    0bh,ivl
        move    sliv,aux
        xmit    1dh,ivl
        move    aux,dliv
        xmit    1eh,ivl
        xmit    0h,dliv
        return

x0765:  xmit    0ah,ivl
        move    sliv,aux
        xmit    0ch,ivl
        move    sliv[3:0],r1
        move    sliv[7:4],r2
        add     r1>>>4,r1
        xmit    1ch,ivl
        move    r1,dliv
        move    ovf,aux
        add     r2,aux
        xmit    0bh,ivl
        add     sliv,aux
        move    ovf,r3
        xmit    0dh,ivl
        move    sliv[3:0],r1
        move    sliv[7:4],r2
        add     r1>>>4,r1
        move    ovf,aux
        xmit    1dh,ivl
        move    r1,dliv
        add     r2,aux
        xmit    1eh,ivl
        add     r3,dliv
        return


sub_077d:
	xmit    0h,r4
        xmit    0feh,r3
        xmit    0h,r2
        xmit    0h,r1
x0781:  xmit    1h,aux
        xmit    5dh,ivr
        nzt     sriv[6],x0785
        return

x0785:  add     r1,r1
        move    ovf,aux
        add     r2,r2
        move    ovf,aux
        add     r3,r3
        move    ovf,aux
        add     r4,r4
        nzt     ovf,x078e
        jmp     x0781

x078e:  jmp     x039a

        return			; automatically inserted by MCCAP


sub_0790:
	xmit    6h,ivl
        move    sliv[4],aux
        xec     x0794,aux
        return

; xec table
x0794:  xmit    48h,ivr
        xmit    49h,ivr


sub_0796:
	xmit    0h,ivl
        move    sliv[3],aux
        xmit    6h,ivl
        nzt     aux,x079b
        xmit    0h,dliv[5]
x079b:  move    sliv[5],aux
        move    sliv[4],r1
        add     r1>>>7,r1
        xmit    6h,aux
        add     r1>>>4,r1
        xmit    1h,aux
        xor     sliv[5],aux
        add     r1,r1
        xmit    4fh,ivr
        move    sriv,aux
        xor     r1,aux
        move    r1,driv
        xmit    4eh,ivr
        move    aux,driv
        xmit    5ch,ivr
        move    r1,driv[7:2]
        xmit    5ah,ivr
        move    sriv[0],aux
        nzt     aux,x07b0
        xmit    1h,driv[7]
        return

x07b0:  xmit    5ch,ivr
        xmit    1h,driv[5]
        jmp     x039a


sub_07b3:
	xmit    33h,ivl		; save return address
        move    r11,dliv

sub_07b5:
        call    sub_0790	; ret 59h
	xmit    0ffh,aux
        xor     sriv,aux
        nzt     aux,x07bd
        xmit    35h,ivl
        xmit    1h,dliv[1]
        jmp     x01b6

x07bd:  move    sriv,r5
        xmit    8h,ivl
        move    sliv,r3
        move    r5,aux
        xor     r3,r2
        nzt     r2,x07c7
        xmit    4eh,ivr
        move    sriv,aux
        nzt     aux,x07e7
        jmp     x0cd9

x07c7:  xmit    0ffh,aux
        xor     r3,r4
        xmit    1h,aux
        add     r4,aux
        add     r5,r4
        xmit    80h,aux
        and     r4,r4
        xmit    5ch,ivr
        nzt     r4,x07d3
        xmit    1h,driv[3]
        xmit    0ffh,r4
        jmp     x07d5

x07d3:  xmit    0h,driv[3]
        xmit    1h,r4
x07d5:  xmit    0h,driv[4]
        xmit    0d2h,r2
        xmit    1h,aux
x07d8:  add     r1,r1
        xmit    1h,driv[4]
        nzt     r1,x07d8
        add     r2,r2
        nzt     r2,x07d8
        move    r4,aux
        add     r5,r5
        move    r5,aux
        xor     r3,aux
        nzt     aux,x07e3
        jmp     x07e4

x07e3:  jmp     x07c7

x07e4:  call    sub_0790	; ret 5ah
	move    r5,driv
x07e7:  xmit    1h,aux
        xmit    0h,r1
x07e9:  add     r2,r2
        nzt     r2,x07e9
        add     r1,r1
        nzt     r1,x07e9
        jmp     x0cd9

        return			; automatically inserted by MCCAP


sub_07ef:
	move    r5,r4
        xmit    0h,ivl
        move    sliv[3],r5
        xmit    0cbh,r1
        nzt     r5,x07f5
        xmit    45h,r1
x07f5:  xmit    5bh,ivr
        move    r1,driv
        xmit    1h,ivr
        xmit    0h,driv[7]
        return

x07fa:  xmit    5ah,ivr
        xmit    5h,driv[6:4]
        nzt     sriv[1],x07fa
        xmit    1h,driv[5]
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    2ah,aux
        nzt     r5,x0803
        xmit    0f5h,aux
x0803:  xor     sriv,aux
        nzt     aux,x080f
x0805:  xmit    5ah,ivr
        nzt     sriv[1],x0805
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    54h,aux
        nzt     r5,x080c
        xmit    7eh,aux
x080c:  xor     sriv,aux
        nzt     aux,x080f
        jmp     x0846

x080f:  jmp     x0831

        return			; automatically inserted by MCCAP


sub_0811:
	xmit    33h,ivl		; save return address
        move    r11,dliv

        xmit    5bh,ivr
        xmit    0h,driv[6]
        xmit    0ceh,r4
        jmp     x083c

x0817:  xmit    0fch,r2
        xmit    0c0h,r3
x0819:  xmit    0fdh,r6
        nzt     r5,x081c
        xmit    0ffh,r6
x081c:  xmit    1h,ivr
        xmit    0h,driv[7]

        xmit    33h,ivl		; restore return address
        move    sliv,r11

x0820:  xmit    0ffh,aux
        nzt     r5,x0823
        xmit    0h,aux
x0823:  xmit    5ah,ivr
        xmit    6h,driv[6:4]
        nzt     sriv[1],x0823
        xmit    5fh,ivr
        xmit    5fh,ivr
        xor     sriv,aux
        nzt     aux,x0831
        xmit    1h,aux
        add     r6,r6
        nzt     r6,x0820
        xmit    1h,ivr
        xmit    1h,driv[7]
        jmp     x07fa

        return

x0831:  xmit    33h,ivl		; restore return address
        move    sliv,r11

        xmit    1h,aux
        add     r3,r3
        nzt     r3,x0844
        add     r2,r2
        nzt     r2,x0844
        add     r4,r4
        nzt     r4,x083c
        xmit    0eh,r1
        jmp     x03a3

x083c:  xmit    0h,r2
x083d:  xmit    5bh,ivr
        xmit    1h,driv[6]
        add     r2,r2
        nzt     r2,x083d
        xmit    0h,driv[6]
        jmp     x0817

        return

x0844:  jmp     x0819

        return

x0846:  xmit    0h,r1
x0847:  xmit    5ah,ivr
        nzt     sriv[1],x0847
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    8h,ivl
        move    sliv,aux
        xor     sriv,aux
        nzt     aux,x0850
        jmp     x0851

x0850:  xmit    1h,r1
x0851:  xmit    5ah,ivr
        nzt     sriv[1],x0851
        xmit    5fh,ivr
        xmit    5fh,ivr
        nzt     sriv,x0857
        jmp     x0858

x0857:  xmit    1h,r1
x0858:  xmit    6h,ivl
        jmp     x0860


; XXX start of unreachable code, presumed garbage
        nzt     r1,085ch
        xmit    2h,r1
	xmit    5ah,ivr
        nzt     sriv[1],085ch
        xmit    5fh,ivr
        xmit    5fh,ivr
; XXX end of unreachable code, presumed garbage


	org	0860h
	
x0860:  nzt     sliv[1],x086b
x0861:  xmit    5ah,ivr
        nzt     sriv[1],x0861
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    sriv,aux
        xmit    4bh,ivr
        move    aux,driv
        xmit    4dh,ivr
        add     sriv,driv
        jmp     x0876

x086b:  xmit    9h,ivl
        move    sliv,aux
x086d:  xmit    5ah,ivr
        nzt     sriv[1],x086d
        xmit    5fh,ivr
        xmit    5fh,ivr
        xor     sriv,aux
        nzt     aux,x0874
        jmp     x0876

x0874:  nzt     r1,x0876
        xmit    2h,r1
x0876:  xmit    5ah,ivr
        nzt     sriv[1],x0876
        xmit    5fh,ivr
        xmit    5fh,ivr
        nzt     sriv,x087c
        jmp     x087d

x087c:  xmit    3h,r1
x087d:  xmit    5ah,ivr
        nzt     sriv[1],x087d
        xmit    0h,driv[6]
        xmit    5fh,ivr
        xmit    5fh,ivr
x0882:  xmit    5ah,ivr
        nzt     sriv[1],x0882
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    0f1h,aux
        nzt     r5,x0889
        xmit    0h,aux
x0889:  xmit    5ah,ivr
        nzt     sriv[1],x0889
        xmit    1h,driv[6]
        xmit    5fh,ivr
        xmit    5fh,ivr
        xor     sriv,aux
        nzt     aux,x08a0
        xmit    0ceh,aux
        nzt     r5,x0893
        xmit    0h,aux
x0893:  xmit    5ah,ivr
        nzt     sriv[1],x0893
        xmit    5fh,ivr
        xmit    5fh,ivr
        xor     sriv,aux
        nzt     aux,x08a0
        xec     x089c,r1
        xmit    1h,driv[6]
        return

; xec table
x089c:  xmit    5bh,ivr
        jmp     x039e
        jmp     x0844
        jmp     x0844
x08a0:  jmp     x03a0


sub_08a1:
	xmit    34h,ivl
        move    r11,dliv
        xmit    1h,ivr
        xmit    1ch,driv[4:0]
x08a5:  call    sub_07b3	; ret 5bh
        call    sub_07ef	; ret 5ch
	xmit    4ch,ivr
        xmit    0ffh,aux
        move    aux,driv
        xmit    4dh,ivr
        xmit    0h,driv
        xmit    0cch,aux
        nzt     r5,x08b1
        xmit    0e6h,aux
x08b1:  xmit    24h,ivl
        move    aux,dliv
        xmit    0c4h,aux
        xmit    5ch,ivr
        xmit    0h,driv[1]
        add     r4,aux
        nzt     ovf,x08b9
        xmit    1h,driv[1]
x08b9:  call    sub_0811		; ret 5dh
	xmit    5bh,ivr
        xmit    0h,driv[6]
        xmit    4bh,ivr
        move    sriv[0],aux
        move    sriv[7:1],r1
        xmit    3h,ivr
        move    aux,driv[14:7]
        xmit    0h,driv[6:0]
        xmit    4h,ivr
        move    r1,driv
        xmit    0fdh,r3
        xmit    0f6h,r2
        nzt     r5,x08ca
        xmit    0feh,r3
        xmit    0d1h,r2
x08ca:  xmit    1h,aux
x08cb:  add     r2,r2
        nzt     r2,x08cb
        add     r3,r3
        nzt     r3,x08cb
        xmit    5bh,ivr
        xmit    0h,driv[6]
x08d1:  xmit    0ffh,aux
        nzt     r5,x08d4
        xmit    0h,aux
x08d4:  xmit    5ah,ivr
        xmit    6h,driv[6:4]
        nzt     sriv[1],x08d4
        xmit    5fh,ivr
        xmit    5fh,ivr
        xor     sriv,r1
        nzt     r1,x08d4
        xmit    2ah,aux
        nzt     r5,x08de
        xmit    0f5h,aux
x08de:  jmp     x08e0


; XXX start of unreachable code, presumed garbage
        xmit    1h,aux
; XXX end of unreachable code, presumed garbage


	org	08e0h

x08e0:  xmit    5ah,ivr
        xmit    5h,driv[6:4]
        nzt     sriv[1],x08e0
        xmit    5fh,ivr
        xmit    5fh,ivr
        xor     sriv,r1
        nzt     r1,x08d1
        xmit    45h,aux
        nzt     r5,x08ea
        xmit    6fh,aux
x08ea:  xmit    5ah,ivr
        xmit    7h,driv[6:4]
        nzt     sriv[1],x08ea
        xmit    5fh,ivr
        xmit    5fh,ivr
x08ef:  xor     sriv,aux
        nzt     aux,x08f2
        jmp     x08fb

x08f2:  xmit    48h,aux
        nzt     r5,x08f5
        xmit    6ah,aux
x08f5:  xor     sriv,aux
        nzt     aux,x08f9
        xmit    1h,r1
        jmp     x03a3

x08f9:  xmit    0fh,r1
        jmp     x03a3

x08fb:  xmit    1h,aux
        jmp     x0900

        xor     ivr>>>6,r15
        xor     sriv[5:4],driv[2:1]
        xec     x08ef,sriv[0]	; XXX not sure xec x08ef makes sense
x0900:  xmit    5ah,ivr
        nzt     sriv[1],x0900
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    sriv,r1
        xmit    2h,ivr
        move    r1,driv
        xmit    1h,ivr
        xmit    0h,driv[4]
        xmit    1h,driv[4]
        xmit    3h,ivr
        add     sriv,driv
        nzt     sriv[6:0],x0900
        jmp     x0910

x090e:  xmit    2h,r1
        jmp     x03a3

x0910:  xmit    5ah,ivr
        nzt     sriv[1],x0910
        xmit    0h,driv[6]
        xmit    5fh,ivr
        xmit    5fh,ivr
x0915:  xmit    5ah,ivr
        nzt     sriv[1],x0915
        xmit    5fh,ivr
        xmit    5fh,ivr
x0919:  xmit    5ah,ivr
        nzt     sriv[1],x0919
        xmit    1h,driv[6]
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    0ch,aux
        nzt     r5,x0921
        xmit    0h,aux
x0921:  xor     sriv,aux
        nzt     aux,x090e
x0923:  xmit    5ah,ivr
        nzt     sriv[1],x0923
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    99h,aux
        nzt     r5,x092a
        xmit    0h,aux
x092a:  xor     sriv,aux
        nzt     aux,x090e
        xmit    5bh,ivr
        xmit    1h,driv[6]
        xmit    1h,ivr
        xmit    0h,driv[7]
        xmit    24h,ivl
        xmit    1h,aux
        add     sliv,dliv
        nzt     ovf,x0935
        jmp     x08b9

x0935:  xmit    62h,aux
        nzt     r5,x0938
        xmit    5fh,aux
x0938:  xmit    4dh,ivr
        xor     sriv,aux
        nzt     aux,x093c
        jmp     x0cdb

x093c:  jmp     x08a5

        return			; automatically inserted by MCCAP


sub_093e:
	xmit    34h,ivl		; save return address
        move    r11,dliv

        call    sub_07b3	; ret 5e
        call    sub_07ef	; ret 5f
	xmit    0d5h,aux
        add     r4,aux
        xmit    5bh,ivr
        xmit    1h,driv[7]
        nzt     ovf,x094a
        xmit    0h,driv[7]
x094a:  xmit    0c4h,aux
        add     r4,aux
        xmit    5ch,ivr
        xmit    0h,driv[1]
        nzt     ovf,x0950
        xmit    1h,driv[1]
x0950:  xmit    1h,ivr
        xmit    12h,driv[4:0]
        call    sub_0811	; ret 60h
	xmit    1h,ivr
        xmit    0h,driv[7]
        xmit    0f5h,r3
x0957:  xmit    5ah,ivr
        nzt     sriv[1],x0957
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    0eh,r2
        nzt     r5,x095e
        xmit    8h,r2
x095e:  xmit    0ffh,aux
        jmp     x0960

x0960:  xmit    5ah,ivr
        nzt     sriv[1],x0960
        xmit    5fh,ivr
        xmit    5fh,ivr
        add     r2,r2
        nzt     r2,x0960
        xmit    0ffh,r1
        nzt     r5,x0969
        xmit    0h,r1
x0969:  xmit    5ah,ivr
        nzt     sriv[1],x0969
        xmit    6h,driv[7:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r1,driv
        xmit    0f9h,r1
        nzt     r5,x0972
        xmit    0fbh,r1
x0972:  xmit    1h,aux
x0973:  xmit    5ah,ivr
        nzt     sriv[1],x0973
        xmit    5fh,ivr
        xmit    5fh,ivr
        add     r1,r1
        nzt     r1,x0973
        xmit    6h,ivl
        move    sliv[0],r1
        nzt     r5,x0986
x097c:  xmit    5ah,ivr
        nzt     sriv[1],x097c
        xmit    5h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        xmit    6ah,r3
        nzt     r1,x0985
        xmit    6fh,r3
x0985:  jmp     x0999

x0986:  xmit    5ah,ivr
        nzt     sriv[1],x0986
        xmit    7h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
x098b:  xmit    5ah,ivr
        nzt     sriv[1],x098b
        xmit    5fh,ivr
        xmit    5fh,ivr
        xmit    48h,r3
        nzt     r1,x0992
        xmit    2ah,r3
x0992:  xmit    5ah,ivr
        nzt     sriv[1],x0992
        xmit    5h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        xmit    45h,r3
x0999:  xmit    5ah,ivr
        nzt     sriv[1],x0999
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r3,driv
        xmit    2h,ivr
        move    sriv,r1
x09a0:  xmit    5ah,ivr
        nzt     sriv[1],x09a0
        xmit    7h,driv[6:4]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r1,driv
x09a6:  xmit    3h,ivr
        add     sriv,driv
        nzt     ovf,x09b1
        xmit    2h,ivr
        move    sriv,r1
x09ab:  xmit    5ah,ivr
        nzt     sriv[1],x09ab
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r1,driv
        jmp     x09a6

x09b1:  xmit    5ah,ivr
        nzt     sriv[1],x09b1
        xmit    5fh,ivr
        xmit    5fh,ivr
x09b5:  xmit    5ah,ivr
        xmit    0h,driv[6]
        nzt     sriv[1],x09b5
        xmit    5fh,ivr
        xmit    5fh,ivr
        nzt     r5,x09bf
x09bb:  xmit    5ah,ivr
        nzt     sriv[1],x09bb
        xmit    5fh,ivr
        xmit    5fh,ivr
x09bf:  xmit    0h,r1
        nzt     r5,x09c2
        xmit    0ffh,r1
x09c2:  xmit    5ah,ivr
        nzt     sriv[1],x09c2
        xmit    1h,driv[6]
        xmit    5fh,ivr
        xmit    5fh,ivr
        move    r1,driv
x09c8:  xmit    5ah,ivr
        nzt     sriv[1],x09c8
        xmit    5fh,ivr
        xmit    5fh,ivr
x09cc:  xmit    5ah,ivr
        nzt     sriv[1],x09cc
        xmit    1h,driv[7]
        xmit    1h,ivr
        xmit    1fh,driv[4:0]
        jmp     x0cdb

        return			; automatically inserted by MCCAP


sub_09d3:
	xmit    14h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    15h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    16h,ivl
        add     sliv,dliv
        return


sub_09dc:
	xmit    4h,r2
        xmit    3h,r1
        return


x09df:  xmit    33h,ivl		; save return address
        move    r11,dliv

        xmit    38h,ivl
        xmit    39h,aux
        move    aux,dliv
        xmit    2h,ivl
        xmit    0h,dliv
x09e6:  xmit    3ch,aux
        xmit    6h,ivr
        and     sriv,r1
        xmit    24h,aux
        xor     r1,r1
        nzt     r1,x09ed
        jmp     x09f5

x09ed:  xmit    1h,aux
        xmit    2h,ivl
        add     sliv,dliv
        nzt     ovf,x09f2
        jmp     x09e6

x09f2:  xmit    43h,r1
        call    sub_0c83	; ret 61h
x09f5:  xmit    38h,ivl
        move    sliv,ivl
        xmit    0ffh,aux
        xor     sliv,r2
        xmit    7h,ivr
        xmit    17h,driv[7:3]
        call    sub_0acd	; ret 62h
	xmit    7h,ivr
        xmit    0h,driv[4]
        xmit    1h,aux
        xmit    38h,ivl
        add     sliv,dliv
        xmit    0ffh,aux
        xmit    3h,ivl
        add     sliv,dliv
        move    sliv,r2
x0a06:  xmit    6h,ivr
        move    sriv[3],aux
        nzt     aux,x0a0c
        xmit    43h,r1
        xmit    8h,r11		; XXX non-standard use of r11
        jmp     x0a06

x0a0c:  xmit    7h,ivr
        xmit    7fh,aux
        move    aux,driv
        nzt     r2,x0a12
        call    sub_0bb4	; ret 63h
x0a12:  jmp     x09e6

        return

x0a14:  xmit    4h,ivl
        move    sliv[2],aux
        nzt     aux,x0a18
        jmp     x0a1b

x0a18:  xmit    64h,r1
        call    sub_0c83	; ret 64h
x0a1b:  xmit    10h,aux
        add     sliv,r1
        xmit    1h,aux
        add     sliv,dliv
        move    r1,ivl
        xmit    8h,ivr
        move    sriv,dliv
        xmit    2h,ivl
        xmit    0h,dliv
x0a24:  xmit    7h,ivr
        xmit    0h,driv[4]
        xmit    6h,ivr
        move    sriv[3],aux
        nzt     aux,x0a30
        xmit    1h,aux
        add     sliv,dliv
        nzt     ovf,x0a2d
        jmp     x0a24

x0a2d:  xmit    43h,r1
        call    sub_0c83	; ret 65h
x0a30:  xmit    7h,ivr
        xmit    1h,driv[4]
        jmp     sub_0bb6

        return			; automatically inserted by MCCAP


sub_0a34:
	xmit    0ffh,aux
        xmit    3fh,ivl
        move    aux,dliv
        xmit    40h,ivl
        move    aux,dliv
        xmit    41h,ivl
        move    aux,dliv
        xmit    9h,ivr
        xmit    7h,aux
        xor     sriv[2:0],aux
        nzt     aux,x0a5f
        xmit    4h,r1
        xmit    16h,ivl
        xmit    16h,dliv
        xmit    4h,r2
        xmit    36h,ivl
        xmit    1h,dliv[12:5]
        call    sub_0639	; ret 66h
	xmit    4h,ivr
        xmit    1bh,aux
        move    aux,driv
        xmit    3h,ivr
        xmit    0h,driv
        xmit    80h,r1
        call    sub_0662	; ret 67h
	xmit    0c4h,r1
        call    sub_0662	; ret 68h
	xmit    2h,r1
	call    sub_0662	; ret 69h
	xmit    3h,ivr
        xmit    0h,driv
x0a57:  xmit    6h,r1
        xmit    35h,ivl
        xmit    0h,dliv[1]
        call    sub_0b7e	; ret 6ah
	xmit    16h,ivl
        xmit    0h,dliv
        jmp     x044f

x0a5f:  xmit    6h,r1
        xmit    2eh,ivl
        move    sliv[4:0],r2
        return


sub_0a63:
	xmit    8h,r1
        return


x0a65:  return

x0a66:  xmit    36h,ivl
        move    sliv[5],aux
        nzt     aux,x0a65
        xmit    3h,ivr
        xmit    0h,driv
sub_0a6b:  xmit    4h,ivr
        xmit    35h,ivl
        move    sliv[6],r1
        xmit    1eh,aux
        nzt     r1,x0a71
        xmit    1bh,aux
x0a71:  move    aux,driv

        xmit    33h,ivl		; save return address
        move    r11,dliv

x0a74:  xmit    6h,ivr
        xmit    0ch,aux
        xor     sriv[5:2],aux
        nzt     aux,x0a74
        xmit    8h,ivr
        xmit    0ffh,aux
        xor     sriv,r1
        xmit    2h,ivr
        move    r1,driv
        xmit    36h,ivl
        move    sliv[5],aux
        xmit    1h,ivr
        nzt     aux,x0a84
        xmit    1ch,driv[4:0]
        xmit    0h,driv[4]
        jmp     x0a88

x0a84:  xmit    38h,ivl
        add     sliv,dliv
        xmit    17h,ivl
        move    r1,dliv
x0a88:  xmit    1h,ivl
        move    sliv[6],aux
        xmit    1fh,driv[4:0]
        nzt     aux,x0a8d
        jmp     x0aa0

x0a8d:  xmit    0h,aux
        xmit    2h,ivr
        add     sriv[0],aux	; compute parity of bits in riv2[7:0], riv6[1]
        add     sriv[1],aux
        add     sriv[2],aux
        add     sriv[3],aux
        add     sriv[4],aux
	add     sriv[5],aux
        add     sriv[6],aux
        add     sriv[7],aux
        xmit    6h,ivr
        add     sriv[1],r1
        xmit    1h,aux
        and     r1,r1
        nzt     r1,x0a9d
        jmp     x0aa0

x0a9d:  xmit    65h,r1
        call    sub_0c83	; ret 6bh
x0aa0:  xmit    7h,ivr
        xmit    0h,driv[4]
        xmit    2h,ivl
        xmit    0h,dliv
x0aa4:  xmit    6h,ivr
        move    sriv[3],aux
        nzt     aux,x0aae
        xmit    1h,aux
        add     sliv,dliv
        nzt     ovf,x0aab
        jmp     x0aa4

x0aab:  xmit    43h,r1
        call    sub_0c83	; ret 6ch
x0aae:  xmit    7h,ivr
        xmit    1h,driv[4]
        xmit    3h,ivr
        xmit    1h,aux
        add     sriv,driv
        nzt     ovf,x0ab5
        jmp     x0a74

x0ab5:  move    ovf,aux
        xmit    4h,ivr
        add     sriv,driv
        xmit    35h,ivl
        move    sliv[6],aux
        nzt     aux,x0abd
        call    sub_0bb4	; ret 6dh
x0abd:  xmit    20h,aux
        xmit    4h,ivr
        xor     sriv,aux
        nzt     aux,x0ac4
        xmit    0h,dliv[6]
        call    sub_0bb4	; ret 6eh
x0ac4:  jmp     x0a74

        return			; automatically inserted by MCCAP


sub_0ac6:
	xmit    0ah,r1
        return


sub_0ac8:
	xmit    7h,ivr
	xmit    17h,driv[7:3]
        xmit    2h,ivr
        xmit    0ffh,aux
        xor     sriv,r2

sub_0acd:
	xmit    8h,ivr
        move    r2,driv
        xmit    0h,aux
        add     sriv[0],aux
        add     sriv[1],aux
        add     sriv[2],aux
        add     sriv[3],aux
        add     sriv[4],aux
        add     sriv[5],aux
        add     sriv[6],aux
        add     sriv[7],r1
        xmit    1h,aux
        and     r1,r1
        xmit    7h,ivr
        xmit    1h,driv[1]
        nzt     r1,x0ade
        xmit    0h,driv[1]
x0ade:  return


sub_0adf:
	xmit    33h,ivl		; save return address
        move    r11,dliv

        xmit    0h,r6
x0ae2:  move    r6,aux
        xmit    1ch,ivl
        xmit    3h,ivr
        add     sliv,driv
        move    ovf,aux
        xmit    1dh,ivl
        xmit    4h,ivr
        add     sliv,driv
        move    ovf,aux
        xmit    1eh,ivl
        xmit    5h,ivr
        add     sliv,driv
        xmit    2h,ivl
        xmit    0h,dliv
        xmit    3h,ivl
        xmit    0h,dliv
x0af2:  xmit    1h,ivr
        xmit    13h,driv[4:0]
        xmit    9h,ivr
        move    sriv[7],aux
        jmp     x0b00

; XXX start of unreachable code, presumed garbage
        add     r6,r6
        xmit    1h,driv[4]
        xmit    1h,driv[1]
        xmit    1fh,driv[4:0]
        xmit    24h,ivl
        add     sliv,dliv
        nzt     ovf,0affh
        jmp     0ac9h
	xmit    1ch,ivl
; XXX end of unreachable code, presumed garbage


	align	0100h

x0b00:  nzt     aux,x0b0e
        xmit    1h,aux
        xmit    2h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    3h,ivl
        add     sliv,dliv
        call    sub_0676	; ret 6fh
	nzt     ovf,x0b0b
        jmp     x0af2

x0b0b:  xmit    66h,r1
        call    sub_0c83	; ret 70h
x0b0e:  xmit    1h,ivr
        xmit    1h,driv[2]
        xmit    1fh,driv[4:0]
        move    r6,aux
        xmit    3h,ivr
        add     r3,driv
        xmit    4h,ivr
        move    r4,driv
        xmit    1h,ivr
        xmit    1ch,driv[4:0]
        xmit    0h,driv[4]
        xmit    1h,aux
        add     r6,r6
        xmit    1h,driv[4]
        xmit    1h,driv[1]
        xmit    1fh,driv[4:0]
        xmit    24h,ivl
        add     sliv,dliv
        nzt     ovf,x0b22
        jmp     x0ae2

x0b22:  xmit    1ch,ivl
        move    r6,aux
        add     sliv,dliv
        move    ovf,aux
        xmit    1dh,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    1eh,ivl
        add     sliv,dliv
        xmit    1h,ivr
        xmit    1fh,driv[4:0]
        jmp     x0cd9

        return			; automatically inserted by MCCAP


sub_0b2f:
	xmit    33h,ivl		; save return address
        move    r11,dliv

        xmit    0h,r6
x0b32:  xmit    3h,ivr
        move    r6,aux
        add     r3,driv
        xmit    4h,ivr
        move    r4,driv
        xmit    1h,ivr
        xmit    12h,driv[4:0]
        xmit    1ch,ivl
        move    r6,aux
        xmit    1h,driv[2]
        xmit    1fh,driv[4:0]
        xmit    3h,ivr
        add     sliv,driv
        xmit    1dh,ivl
        xmit    4h,ivr
        move    ovf,aux
        add     sliv,driv
        xmit    1eh,ivl
        xmit    5h,ivr
        move    ovf,aux
        add     sliv,driv
        xmit    1h,aux
        add     r6,r6
        xmit    1h,ivr
        xmit    0dh,driv[4:0]
        xmit    2h,ivl
        xmit    0h,dliv
        xmit    3h,ivl
        xmit    0h,dliv
x0b4f:  xmit    9h,ivr
        move    sriv[7],aux
        nzt     aux,x0b5f
        xmit    1h,aux
        xmit    2h,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    3h,ivl
        add     sliv,dliv
        call    sub_0676	; ret 71h
	nzt     ovf,x0b5c
        jmp     x0b4f

x0b5c:  xmit    66h,r1
        call    sub_0c83	; ret 72h
x0b5f:  xmit    1h,ivr
        xmit    1h,driv[4]
        xmit    1fh,driv[4:0]
        xmit    24h,ivl
        xmit    1h,aux
        add     sliv,dliv
        nzt     ovf,x0b67
        jmp     x0b32

x0b67:  move    r6,aux
        xmit    1ch,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    1dh,ivl
        add     sliv,dliv
        move    ovf,aux
        xmit    1eh,ivl
        add     sliv,dliv
        jmp     x0cd9

        return

x0b72:  xmit    0h,dliv[5]
        return

x0b74:  xmit    36h,ivl
        move    sliv[5],aux
        nzt     aux,x0b72

sub_0b77:
	xmit    1fh,ivl
        xmit    4h,ivr
        move    sliv,driv
        xmit    20h,ivl
        xmit    3h,ivr
        move    sliv,driv

sub_0b7d:
	xmit    80h,r1

sub_0b7e:
	xmit    33h,ivl		; save return address
        move    r11,dliv

        xmit    3h,ivl
        move    r1,dliv
x0b82:  xmit    2h,ivl
        xmit    0h,dliv
        xmit    1h,ivr
        xmit    12h,driv[4:0]
x0b86:  xmit    6h,ivr
        xmit    3ch,aux
x0b88:  and     sriv,r1
	xmit    34h,aux
        xor     r1,r1
        nzt     r1,x0b8d
        jmp     x0b94

x0b8d:  xmit    1h,aux
        add     sliv,dliv
        nzt     ovf,x0b91
        jmp     x0b86

x0b91:  xmit    43h,r1
        xmit    0fh,r11		; XXX non-standard use of r11
        jmp     x0b86

x0b94:  call    sub_0ac8	; ret 73h
	xmit    7h,ivr
        xmit    0h,driv[4]
        xmit    3h,ivr
        xmit    1h,aux
        add     sriv,driv
        xmit    2h,ivl
        xmit    0h,dliv
x0b9d:  xmit    6h,ivr
        move    sriv[3],r1
        nzt     r1,x0ba6
        add     sliv,dliv
        nzt     ovf,x0ba3
        jmp     x0b9d

x0ba3:  xmit    43h,r1
        call    sub_0c83	; ret 74h
x0ba6:  xmit    7h,ivr
        xmit    7fh,aux
        move    aux,driv
        xmit    0ffh,aux
        xmit    3h,ivl
        add     sliv,dliv
        move    sliv,aux
        nzt     aux,x0b82
        xmit    35h,ivl
        move    sliv[1],aux
        nzt     aux,x0bb2
        jmp     sub_0bb4

x0bb2:  jmp     x0cd9

        return			; automatically inserted by MCCAP


sub_0bb4:
	xmit    33h,ivl		; restore return address
        move    sliv,r11

sub_0bb6:
	xmit    1h,ivr
        xmit    1fh,driv[4:0]
        xmit    6h,ivr
        move    sriv[6],aux
        nzt     aux,x0bbc
        jmp     x0bbd

x0bbc:  jmp     x0c00

x0bbd:  xmit    2h,ivl
        xmit    0h,dliv
        xmit    2fh,ivl
        xmit    0h,dliv
        xmit    30h,ivl
        xmit    0c0h,aux
        move    aux,dliv
        xmit    3h,ivl
        xmit    6h,aux
        move    aux,dliv
x0bc7:  xmit    6h,ivr
        move    sriv[3],aux
        nzt     aux,x0bcb
        jmp     x0bdb

x0bcb:  move    sriv[6],aux
        nzt     aux,x0bbc
        xmit    2h,ivl
        xmit    1h,aux
        add     sliv,dliv
        xmit    2fh,ivl
        move    ovf,aux
        add     sliv,dliv
        xmit    30h,ivl
        move    ovf,aux
        add     sliv,dliv
        nzt     ovf,x0bd8
        jmp     x0bc7

x0bd8:  xmit    43h,r1
        call    sub_0c83	; ret 75h
x0bdb:  move    sriv[2],aux
	add     sriv[5:3],r1
        xmit    7h,aux
        xor     r1,r1
        xec     x0be3,r1
x0be0:  xmit    64h,r1
        call    sub_0c83	; ret 76h

; xec table
x0be3:  jmp     x0b74
        jmp     x0a66
        jmp     x09df
        jmp     x0a14
        jmp     x0be0
        jmp     x0be0
        jmp     x0be0
        jmp     x0a14

; XXX start of unreachable code, presumed garbage
	jmp     0c00h
        xmit    36h,ivr
        move    sriv,aux
        jmp     0c00h
        move    sriv[6],aux
        nzt     aux,0bdch
        xmit    2h,ivl
        xmit    1h,aux
        add     sliv,dliv
        xmit    2fh,ivl
        move    ovf,aux
        add     sliv,dliv
        xmit    30h,ivl
        move    ovf,aux
        add     sliv,dliv
        nzt     ovf,0bfch
        jmp     0bebh
	xmit    43h,r1
        xmit    5h,r11
        jmp     0b89h
        move    sriv[2],aux
; XXX end of unreachable code, presumed garbage


	align	0100h

x0c00:  xmit    4h,ivl
        xmit    2h,aux
        xor     sliv,aux
        nzt     aux,x0c1d
        xmit    0ffh,aux
        add     sliv,r2
        xmit    10h,aux
        add     r2,r3
        move    r3,ivl
        xmit    0ffh,aux
        xor     sliv,aux
        nzt     aux,x0c16
        xmit    0ffh,aux
        add     r3,ivl
        move    sliv[1],aux
        nzt     aux,x0c1c
        xmit    36h,ivl
        move    sliv[3],aux
        nzt     aux,x0c14
        jmp     x0482

x0c14:  call    sub_0c1f	; ret 77h
x0c16:  xmit    36h,ivl
        move    sliv[0],aux
        nzt     aux,x0c1b
        call    sub_0c1f	; ret 78h
x0c1b:  jmp     x0482

x0c1c:  return

x0c1d:  call	sub_0c1f	; ret 79h

sub_0c1f:
	xmit    36h,ivl
        xmit    1h,aux
        xor     sliv[3],aux
        nzt     aux,x0c24
        jmp     x0c28

x0c24:  xmit    36h,ivr
        move    sriv,aux
        nzt     aux,x0c6c
        move    r11,driv
x0c28:  xmit    2h,ivl
        xmit    0h,dliv
        xmit    25h,ivl
        xmit    0h,dliv
x0c2c:  xmit    6h,ivr
        move    sriv[6],aux
        nzt     aux,x0c53
        xmit    7h,ivr
        xmit    0h,driv[4]
        xmit    3h,ivl
        xmit    0h,dliv
        xmit    1h,aux
x0c34:  xmit    2h,ivl
        add     sliv,dliv
        nzt     ovf,x0c44
x0c37:  xmit    6h,ivr
        move    sriv[3],aux
        nzt     aux,x0c3e
        xmit    3h,ivl
        add     sliv,dliv
        nzt     ovf,x0c37
        jmp     x0c34

x0c3e:  xmit    7h,ivr
        xmit    1h,driv[4]
        xmit    0fbh,r1
x0c41:  add     r1,r1
        nzt     ovf,x0c2c
        jmp     x0c41

x0c44:  xmit    25h,ivl
        move    sliv,aux
        nzt     aux,x0c4c
        xmit    1h,dliv[0]
        xmit    2h,ivl
        xmit    0f1h,aux
        move    aux,dliv
        jmp     x0c2c

x0c4c:  xmit    1h,aux
        xmit    36h,ivl
        xor     sliv[3],aux
        nzt     aux,x0c51
        jmp     x0163

x0c51:  xmit    64h,r1
        jmp     sub_0c7d

x0c53:  xmit    36h,ivl
        xmit    1h,aux
        xor     sliv[3],aux
        nzt     aux,x0c58
        jmp     x0163

x0c58:  xmit    24h,ivl
        xmit    0fch,aux
        move    aux,dliv
        call    sub_09dc	; ret 7ah
	xmit    36h,ivl
        xmit    1h,dliv[5]
        call    sub_0639	; ret 7bh
	xmit    3h,ivr
        xmit    0fch,aux
        move    aux,driv
        xmit    38h,ivl
        xmit    41h,aux
        move    aux,dliv
        call    sub_0a6b	; ret 7ch
	xmit    36h,ivl
        xmit    0h,dliv[5]
        jmp     sub_0c1f

x0c6c:  xmit    42h,ivl
        move    sliv,r1
        xmit    37h,ivr
        move    r1,driv
        nzt     r1,x0c79
x0c71:  xmit    1h,aux
        xmit    0h,r1
        xmit    0feh,r2
x0c74:  add     r1,r1
        nzt     r1,x0c74
        add     r2,r2
        nzt     r2,x0c74
        jmp     x0482

x0c79:  xmit    0e8h,aux
	add     r1,aux		
        nzt     ovf,x0c71
        jmp     x0600


sub_0c7d:
	xmit    3ch,ivr
        move    r1,driv
        xmit    3bh,ivr
        xmit    0h,driv
        call    sub_0c95	; ret 7dh

sub_0c83:
	xmit    36h,ivl
        xmit    1h,aux
        xor     sliv[3],aux
        nzt     aux,x0c88
        jmp     x0163

x0c88:  xmit    36h,ivr
        move    r11,driv
        jmp     sub_0c7d

x0c8b:  xmit    36h,ivr
        xmit    0ech,aux
        move    aux,driv
        call    sub_0c91	; ret 7eh
	return


sub_0c91:
	xmit    3ch,ivr
        xmit    0h,driv
        xmit    3bh,ivr
        xmit    0h,driv
sub_0c95:
	xmit    3ah,ivr
        xmit    5h,ivl
        xmit    1h,aux
        xor     sliv[4],r1
        move    r1,driv[2]
        xmit    1h,ivr
        xmit    0dfh,aux
        move    aux,driv
        xmit    7fh,aux
        xmit    7h,ivr
        move    aux,driv
        xmit    3dh,ivr
        xmit    0h,driv[7]
        xmit    31h,ivl
        xmit    0h,dliv
        xmit    36h,ivl
        xmit    0h,dliv[0]
        jmp     x03b8

        return			; automatically inserted by MCCAP


sub_0ca8:
	xmit    33h,ivl
	move    r11,dliv
        xmit    4h,ivl
        xmit    0h,dliv
        xmit    7h,ivr
        xmit    7fh,aux
        move    aux,driv
        xmit    6h,ivr
        move    sriv[6],aux
        nzt     aux,x0cb5
        xmit    43h,r1
        call    sub_0c83	; ret 7fh
x0cb5:  xmit    7h,ivr
        xmit    1h,driv[7]
        xmit    23h,ivl
        xmit    8h,ivr
        move    sliv,driv
        xmit    7h,ivr
        xmit    0h,driv[2]
        xmit    2h,ivl
        xmit    0h,dliv
x0cbe:  xmit    6h,ivr
        move    sriv[6],aux
        nzt     aux,x0cc2
        jmp     x0ccd

x0cc2:  xmit    2h,ivl
        add     sliv,dliv
        nzt     ovf,x0cc6
        jmp     x0cbe

x0cc6:  xmit    43h,r1
        xmit    36h,ivl
        move    sliv[0],aux
        nzt     aux,x0ccc
        call    sub_0c83	; ret 80h
x0ccc:  jmp     x0cbe

x0ccd:  xmit    0ffh,aux
        xmit    8h,ivr
        move    aux,driv
        xmit    7fh,aux
        xmit    7h,ivr
        move    aux,driv
        xmit    6h,ivr
        move    sriv[4],aux
        nzt     aux,x0ccd
        call    sub_0bb4	; ret 81h
	return

x0cd9:  xmit    33h,ivl
        jmp     x0cdc

x0cdb:  xmit    34h,ivl
x0cdc:  move    sliv,r11
        return


; XXX start of unreachable code, presumed garbage
        xmit    0h,r6
        xmit    3h,ivr
        move    r6,aux
        add     r3,driv
        xmit    4h,ivr
        move    r4,driv
        xmit    1h,ivr
        xmit    12h,driv[4:0]
        xmit    1ch,ivl
        move    r6,aux
        xmit    1h,driv[2]
        xmit    1fh,driv[4:0]
        xmit    3h,ivr
        add     sliv,driv
        xmit    1dh,ivl
        xmit    4h,ivr
        move    ovf,aux
        add     sliv,driv
        xmit    1eh,ivl
        xmit    5h,ivr
        move    ovf,aux
        add     sliv,driv
        xmit    1h,aux
        add     r6,r6
        xmit    1h,ivr
        xmit    0dh,driv[4:0]
        xmit    2h,ivl
        xmit    0h,dliv
        xmit    3h,ivl
        xmit    0h,dliv
        xmit    9h,ivr
        move    sriv[7],aux
        jmp     00d2h
        xmit    1h,aux
; XXX end of unreachable code, presumed garbage

	align	0100h

; return table here
