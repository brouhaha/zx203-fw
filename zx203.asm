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


; left I/O space is entirely 8X350 RAM, 256x8

ram_00	liv	00h
ram_01	liv	01h
ram_02	liv	02h
ram_03	liv	03h
ram_04	liv	04h
ram_05	liv	05h
ram_06	liv	06h
ram_07	liv	07h
ram_08	liv	08h
ram_09	liv	09h
ram_0a	liv	0ah
ram_0b	liv	0bh
ram_0c	liv	0ch
ram_0d	liv	0dh
ram_0e	liv	0eh
ram_0f	liv	0fh

ram_14	liv	14h
ram_15	liv	15h
ram_16	liv	16h
ram_17	liv	17h
ram_18	liv	18h

ram_1a	liv	1ah
ram_1b	liv	1bh
ram_1c	liv	1ch
ram_1d	liv	1dh
ram_1e	liv	1eh
ram_1f	liv	1fh
ram_20	liv	20h

ram_23	liv	23h
ram_24	liv	24h
ram_25	liv	25h
ram_26	liv	26h
ram_27	liv	27h
ram_28	liv	28h
ram_29	liv	29h
ram_2a	liv	2ah
ram_2b	liv	2bh
ram_2c	liv	2ch
ram_2d	liv	2dh
ram_2e	liv	2eh
ram_2f	liv	2fh
ram_30	liv	30h
ram_31	liv	31h
ram_32	liv	32h
ram_33	liv	33h
ram_34	liv	34h
ram_35	liv	35h
ram_36	liv	36h

ram_38	liv	38h

ram_39	liv	39h	; 5 byes used

ram_3f	liv	3fh
ram_40	liv	40h
ram_41	liv	41h
ram_42	liv	42h


; right I/O space:

; 8X376 and 8T35 I/O ports from 01h..09h
; all 8X376 (three-state) unless otherwise specified
port1	riv	01h
port2	riv	02h
port3	riv	03h
port4	riv	04h
port5	riv	05h
port6	riv	06h
port7	riv	07h	; 8T35 (open-collector)
port8	riv	08h
dip_sw	riv	09h	; DIP switches, bits 7, 6, 2..0 used

; 8X320 bus interface from 30h..3fh
host0	riv	30h
host2	riv	32h
host3	riv	33h
host4	riv	34h
host5	riv	35h
host6	riv	36h
host7	riv	37h
host8	riv	38h
host9	riv	39h
hosta	riv	3ah
hostb	riv	3bh
hostc	riv	3ch
hostd	riv	3dh
hoste	riv	3eh
hostf	riv	3fh

; 8X330 RAM from 48h..57h
f_ram	riv	48h

; 8X330 floppy control registers
f_csr1	riv	5ah	; disk command (write), disk status (read)
f_wg_n	riv	5ah,7	;   7 write gate enable, active low
f_crc	riv	5ah,6	;   6 CRC enable, 1 = compute, 0 = CRC sources data
f_dci	riv	5ah,5	;   5 data register control
			;        0 = data and clocks interleaved, used to write AM
			;        1 = data only
f_syne	riv	5ah,4	;   4 sync enable
f_ldc	riv	5ah,3	;   3 load counter - 1 to transfer sector length and
			;                      byte counter MSB to byte counter
f_bycm	riv	5ah,2	;   2 byte counter MSB
f_bytra	riv	5ah,1	;   1 BYTRA
			;         1-to-0 transition increments byte counter
fd_dsi1	riv	5ah,0	;   0 disk status 1 input (pin 17)	ready

f_csr2	riv	5bh	; mode control
f_prec	riv	5bh,7	;   7 precompensation enable, active high
f_wrmod	riv	5bh,6	;   6 read mode - 0 for read, 1 for write
			;   5..4  bit selects
f_pream	riv	5bh,3	;   3 preamble select
f_enc	riv	5bh,1,2	;   2..1  encoding  1x FM, 00 MFM, 01 M2FM
f_rate	riv	5bh,0	;   0 1/2F   0 to halve xfer rate

fd_cntl	riv	5ch	; drive control
fd_dir	riv	5ch,7	;   7 DC1 output (pin 12)	dir
fd_step	riv	5ch,6	;   6 DC2 output (pin 11)	step
fd_drsl	riv	5ch,4,2	;   5 DC3 output (pin 10)	drsel
			;   4 DC4 output (pin 9)	drsel
fd_side	riv	5ch,3	;   3 DC5 output (pin 8)	side
fd_hdld	riv	5ch,2	;   2 DC6 output (pin 7)	head load
fd_rwc	riv	5ch,1	;   1 DC7 output (pin 6)	rwc
			;   0 no effect, always reads 0

fd_sta	riv	5dh	; drive status, read only
fd_trk0	riv	5dh,7	;   7 DS2 input (pin 16)	track 0
fd_idx	riv	5dh,6	;   6 DS3 input (pin 15)	index
fd_wp	riv	5dh,5	;   5 DS4 input (pin 14)	write protect
fd_dchg	riv	5dh,4	;   4 DS5 input (pin 13)	disk changed (not used)
			;   3..0 always read 0

f_slen	riv	5eh	; sector length
f_data	riv	5fh	; data


	org	0

	xmit	port7,ivr
	xmit	77h,aux
	move	aux,driv

	xmit	0ffh,aux
	xmit	port1,ivr
	move	aux,driv

	xmit	fd_cntl,ivr
	xmit	38h,aux		; drive sel 3, head
	move	aux,driv

	xmit	f_csr1,ivr	; turn off write gate enable
	xmit	01h,driv[7]

	xmit	ram_35,ivl
	xmit	00h,dliv

	xmit	ram_36,ivl
	xmit	00h,dliv

	xmit	ram_31,ivl
	xmit	00h,dliv

	xmit	host0,ivr
	xmit	00h,driv

	xmit	host6,ivr
	xmit	00h,driv

	xmit	host7,ivr
	xmit	00h,driv

	xmit	hostd,ivr
	xmit	00h,driv

	xmit	hoste,ivr
	xmit	00h,driv

	xmit	hostf,ivr
	xmit	00h,driv

	xmit	hostc,ivr
	xmit	00h,driv

	xmit	0ffh,aux
	xmit	f_ram+7,ivr
	move	aux,driv

	xmit	f_ram+2,ivr
	move	aux,driv

	xmit	ram_3f,ivl
	move	aux,dliv

	xmit	ram_40,ivl
	move	aux,dliv

	xmit	ram_41,ivl
	move	aux,dliv

	xmit	f_ram+0,ivr
	move	aux,driv

	xmit	f_ram+1,ivr
	move	aux,driv

	xmit	7fh,aux
	xmit	port7,ivr
	move	aux,driv

	xmit	host9,ivr	; second cont subsystem status
	xmit	09h,driv	; controller present, drive 0 ready

	xmit	host8,ivr	; first cont subsystem status
	xmit	19h,driv	; double dens, controller present, drive 0 ready

	xmit	dip_sw,ivr
	xmit	0ebh,aux	; HD cont present, drives 0-3 ready
	nzt	sriv[6],$+2
	xmit	88h,aux		; HD cont present, drives not ready
	xmit	ram_36,ivl
	move	aux,dliv[0]

	xmit	hosta,ivr
	move	aux,driv

; read DIP switch 2:0 for drive configuration
	xmit	07h,aux
	xmit	dip_sw,ivr
	xor	sriv[2:0],r1
	xec	x0041,r1

; xec table
x0041:	jmp	x007e
	jmp	x0049
	jmp	x007e
	jmp	x008a
	jmp	x008a
	jmp	x008a
	jmp	x008a
	jmp	x00b2


x0049:	xmit	80h,r1
	xmit	81h,r2
	xmit	90h,r3
	xmit	91h,r4
	xmit	05h,r5
	xmit	05h,r6
	xmit	05h,aux
	xmit	ram_2d,ivl
	xmit	05h,dliv
	call	sub_0627	; ret 00h
	xmit	ram_36,ivl
	xmit	01h,dliv[5]
	xmit	0ch,r1
	call	sub_0639	; ret 01h
	xmit	port4,ivr
	xmit	1bh,aux
	move	aux,driv
	xmit	port3,ivr
	xmit	00h,driv
	xmit	01h,r1
	call	sub_0662	; ret 02h
	xmit	32h,r1
	call	sub_0662	; ret 03h
	xmit	04h,r1
	call	sub_0662	; ret 04h
	xmit	00h,r1
	call	sub_0662	; ret 05h
	xmit	99h,r1
	call	sub_0662	; ret 06h
	xmit	00h,r1
	call	sub_0662	; ret 07h
	xmit	00h,r1
	call	sub_0662	; ret 08h
	xmit	0bh,r1
	call	sub_0662	; ret 09h
	xmit	port3,ivr
	xmit	00h,driv
	xmit	08h,r1
	xmit	ram_35,ivl
	xmit	00h,dliv[1]
	call	sub_0b7e	; ret 0ah
	jmp	x00ba

x007e:	xmit	0c0h,r1
	xmit	0c1h,r2
	xmit	0d0h,r3
	xmit	0d1h,r4
	xmit	05h,r5
	xmit	05h,r6
	xmit	05h,aux
	xmit	ram_2d,ivl
	xmit	05h,dliv
	call	sub_0627	; ret 0bh
	jmp	x00ba

x008a:	xmit	dip_sw,ivr
	nzt	sriv[1],x0091
	xmit	0d0h,r1
	xmit	0d1h,r2
	xmit	0c0h,r3
	xmit	0c1h,r4
	jmp	x0095

x0091:	xmit	0c0h,r1
	xmit	0c1h,r2
	xmit	0d0h,r3
	xmit	0d1h,r4
x0095:	xmit	05h,r5
	xmit	05h,r6
	xmit	05h,aux
	xmit	ram_2d,ivl
	xmit	05h,dliv
	call	sub_0627	; ret 0ch
	xmit	ram_39,ivl
	xmit	01h,aux
	xmit	0c1h,r1
	move	r1,dliv
	add	ivl,ivl
	xmit	00h,r1
	move	r1,dliv
	add	ivl,ivl
	move	r1,dliv
	add	ivl,ivl
	move	r1,dliv
	add	ivl,ivl
	xmit	dip_sw,ivr
	xmit	80h,r1
	nzt	sriv[0],x00ac
	xmit	01h,r1
x00ac:	move	r1,dliv
	add	ivl,ivl
	xmit	00h,dliv
	call	sub_0ca8	; ret 0dh
	jmp	x00ba

x00b2:	xmit	hosta,ivr
	xmit	08h,driv
	xmit	00h,r1
	xmit	00h,r2
	xmit	00h,r3
	xmit	00h,r4
	call	sub_0627	; ret 0eh
x00ba:	xmit	ram_35,ivl
	xmit	00h,dliv
	xmit	hostb,ivr
	xmit	01h,driv
	jmp	x03b8

; XXX start of unreachable code?
	xmit	07h,aux
	xmit	fd_cntl,ivr
	move	aux,driv[7:2]
	xmit	01h,aux
	xmit	f_csr1,ivr
	xor	sriv[0],aux
	xmit	host8,ivr
	move	aux,driv[0]
	xmit	host9,ivr
	move	aux,driv[0]
	xmit	fd_cntl,ivr
	xmit	01h,driv[5]
	jmp	x03b8

	xmit	ram_35,ivl
	move	sliv[6],aux
	nzt	aux,x00d0
	jmp	x0b88
; XXX end of unreachable code

x00d0:	xmit	40h,aux
	xmit	port4,ivr
	xor	sriv,aux
	nzt	aux,x00d6
	xmit	00h,dliv[6]
	jmp	x0b88

x00d6:	jmp	x0a57

; XXX start of unreachable code
	jmp	0dd6h
	nzt	sliv[3:1],00d7h
	add	r12,driv[5:0]
	xor	ivr,driv[4:2]
	add	r12>>>2,r2
	move	sliv[7:1],aux
	move	aux>>>7,aux
	nop	
	nop	
	jmp	0529h
	xmit	1fh,driv[4:0]
	xmit	69h,r11
	jmp	01eah
	xmit	port1,ivr
	move	r2,dliv
	xmit	ram_14,ivl
	move	r1,dliv
	xmit	0ffh,aux
	jmp	052eh
	xor	r1,r11
	move	sliv[6],aux
	xmit	1fh,driv[4:0]
	xmit	02h,r2
	xmit	ram_35,ivl
	xmit	01h,dliv[6]
	jmp	0537h
	xmit	port3,ivr
	xmit	0fch,aux
	move	aux,driv
	xmit	ram_38,ivl
	xmit	ram_41,ivl
	move	sliv,r2
	move	sliv[7:1],aux
	move	aux>>>7,aux
	move	aux,dliv
	xmit	ram_14,ivl
	move	r2,dliv
	jmp	0548h
	xmit	1fh,driv[4:0]
	jmp	0d0eh
	xor	ivr>>>6,r3
	xmit	ram_14,ivl
	move	sliv[0],aux
	xmit	3eh,r4
	add	r4,r4
	jmp	0110h
	jmp	0549h
	xmit	0ch,driv[7:5]
	xmit	0a8h,r3
	xmit	ram_35,ivl
	move	sliv[6],r1
	xmit	3eh,aux
	nzt	r1,010dh
	xmit	1bh,aux
	jmp	0a54h
	xor	r12>>>6,r15
	xmit	0ch,driv[7:5]
	xmit	ram_35,ivl
	move	sliv[7],aux
	xmit	00h,dliv[7]
	xmit	ram_1a,ivl
	nzt	aux,0116h
	jmp	0549h
	jmp	0576h
	xor	r12>>>6,r15
	xec	010ch,sriv[3:1]
	xmit	0a8h,r3
	xor	r12,driv[1]
	move	r2>>>1,r1
	xmit	0fh,driv[5:3]
	xmit	93h,r15
	and	sriv[6:1],dliv[10:5]
	xec	016ah,aux
	add	r1>>>6,r15
	xor	ivr,dliv[1]
	jmp	1fcdh
	xmit	0ch,driv[7:5]
	xmit	0a8h,r3
	xor	r12,driv[5:0]
	xor	ovf>>>7,r5
	xor	ovf>>>7,r13
	xmit	0ffh,aux
	xmit	ram_3f,ivl
	move	aux,dliv
	xmit	ram_40,ivl
	move	aux,dliv
	xmit	ram_41,ivl
	move	aux,dliv
	xmit	ram_25,ivl
	jmp	043ch
	xor	r12,driv[8:7]
	xor	r12,driv[2:1]
	xor	r12>>>3,r4
	xor	r12>>>3,r12
	xmit	01h,aux
	xmit	0fdh,r2
	add	r1,r1
	nzt	r1,0137h
	add	r2,r2
	nzt	r2,0137h
	jmp	0482h
	jmp	0482h
	dw	2248h		; add r2>>>4,ovf ???
	xor	r1,driv[5]
	nzt	r2,0162h
; XXX end of unreachable code


x0140:	xmit	f_ram+7,ivr
	xmit	1fh,driv[4:0]
	call	sub_0676	; ret 0fh
	xmit	26h,r6
	xmit	00h,r5
x0146:	move	r6,ivl
	move	sliv[7],aux
	nzt	aux,x0150
x0149:	xmit	hosta,ivr
	xec	x014c,r5
	jmp	x0166

; xec table
x014c:	xmit	00h,driv[0]
	xmit	00h,driv[1]
	xmit	00h,driv[5]
	xmit	00h,driv[6]

x0150:	move	sliv[5:4],r6
	xmit	ram_32,ivl
	move	r5,dliv
	xmit	ram_16,ivl
	xmit	00h,dliv
	xmit	ram_01,ivl
	move	r6,dliv[5:4]
	xmit	ram_36,ivl
	xmit	01h,dliv[3]
	jmp	x0507

x015a:	xmit	ram_32,ivl
	move	sliv,r5
	xmit	hosta,ivr
	xec	x015f,r5
	jmp	x0166

; xec table
x015f:	xmit	01h,driv[0]
	xmit	01h,driv[1]
	xmit	01h,driv[5]
	xmit	01h,driv[6]

x0163:	xmit	ram_32,ivl
	move	sliv,r5
	jmp	x0149

x0166:	call	sub_0676	; 10h
	xmit	01h,aux
	add	r5,r5
	xmit	04h,aux
	and	r5,aux
	nzt	aux,x0170
	xmit	26h,aux
	add	r5,r6
	jmp	x0146

x0170:	xmit	00h,r5
x0171:	xmit	fd_cntl,ivr
	xec	x01aa,r5
	move	aux,driv[7:2]
	xmit	f_csr1,ivr	; read disk status DS1
	move	sriv[0],r1
	xmit	host8,ivr
	xec	x01ae,r5
	xor	r1,aux
	nzt	aux,x019a
	xmit	01h,aux
	xor	r1,aux
	xmit	host8,ivr
	xec	x01b2,r5
	xmit	host9,ivr
	xec	x01b2,r5
	xmit	hostb,ivr
	xmit	02h,driv
	xmit	host8,ivr
	xmit	01h,driv[2]
	xmit	00h,aux
	add	sriv[6:5],aux
	move	aux>>>2,aux
	add	sriv[1:0],aux
	move	aux>>>2,aux
	xmit	hostc,ivr
	move	aux,driv
	xmit	port1,ivr
	xmit	00h,driv[5]
	nzt	r1,x018f
	jmp	x019a

x018f:	call	sub_0790	; 11h
	xmit	0ffh,aux
	move	aux,driv
	xmit	f_ram+4,ivr
	move	sriv,aux
	xor	r5,aux
	nzt	aux,x019a
	xmit	f_ram+2,ivr
	xmit	0ffh,aux
	move	aux,driv
x019a:	xmit	fd_cntl,ivr
	xmit	01h,driv[5]
	call	sub_0676	; ret 12h
	xmit	01h,aux
	xmit	0fch,r2

x01a0:	add	r1,r1		; delay
	nzt	r1,x01a0
	add	r2,r2
	nzt	r2,x01a0

	add	r5,r5
	xmit	04h,aux
	and	r5,aux
	nzt	aux,x01a9
	jmp	x0171

x01a9:	jmp	x0140

; xec table
x01aa:	xmit	0fh,aux
	xmit	2fh,aux
	xmit	1eh,aux
	xmit	3eh,aux

; xec table
x01ae:	move	sriv[0],aux
	move	sriv[1],aux
	move	sriv[5],aux
	move	sriv[6],aux

; xec table
x01b2:	move	aux,driv[0]
	move	aux,driv[1]
	move	aux,driv[5]
	move	aux,driv[6]

x01b6:	xmit	fd_cntl,ivr
	xmit	00h,driv[3]
	xmit	00h,driv[4]
	xmit	0d2h,r2
	xmit	00h,r1
	xmit	01h,aux
x01bc:	add	r1,r1
	xmit	01h,driv[4]
	nzt	r1,x01bc
	add	r2,r2
	nzt	r2,x01bc
	xmit	fd_sta,ivr
	move	sriv[7],aux	; track 0
	nzt	aux,x01ce
x01c4:	call	sub_0790	; ret 13h
	xmit	00h,driv
	xmit	ram_35,ivl
	move	sliv[1],aux
	nzt	aux,x01cb
	jmp	x039c

x01cb:	xmit	00h,dliv[1]
	call	sub_07b5	; ret 14h, does not return!

x01ce:	xmit	0b1h,r3
x01cf:	xmit	fd_cntl,ivr
	xmit	01h,driv[3]
	xmit	00h,driv[4]
	xmit	0d2h,r2
	xmit	01h,aux
x01d4:	add	r1,r1
	xmit	01h,driv[4]
	nzt	r1,x01d4
	add	r2,r2
	nzt	r2,x01d4
	xmit	fd_sta,ivr
	move	sriv[7],aux	; track 0?
	nzt	aux,x01dd
	jmp	x01c4

x01dd:	add	r3,r3
	nzt	r3,x01cf
	call	sub_0790	; ret 15h
	xmit	0ffh,aux
	move	aux,driv
	jmp	x039e

x01e4:	xmit	fd_sta,ivr
	nzt	sriv[5],x01e7	; write protect?
	jmp	x03a2

x01e7:	xmit	ram_06,ivl
	move	sliv[5:4],aux
	xmit	f_ram+4,ivr
	xor	sriv,aux
	nzt	aux,x01f3
	xmit	ram_08,ivl
	move	sliv,aux
	xmit	f_ram+2,ivr
	xor	sriv,aux
	nzt	aux,x01f3
	xmit	0ffh,aux
	move	aux,driv
x01f3:	call	sub_07b3	; ret 16h
	call	sub_07ef	; ret 17h

	xmit	(-43)&0ffh,aux	; choose precomp based on track
	add	r4,aux
	xmit	f_csr2,ivr
	xmit	01h,driv[7]	; precomp enabled
	nzt	ovf,$+2
	xmit	00h,driv[7]	; precomp disabled

	xmit	0c4h,aux
	add	r4,aux
	xmit	fd_cntl,ivr
	xmit	00h,driv[1]
	nzt	ovf,x0203
	xmit	01h,driv[1]
x0203:	xmit	98h,r3
	nzt	r5,x0206
	xmit	0cch,r3
x0206:	xmit	ram_05,ivl
	move	sliv[6],aux
	nzt	aux,x020a
	jmp	x0210

x020a:	xmit	ram_24,ivl
	move	r3,dliv
	xmit	1ah,r4
	call	sub_0adf	; ret 18h
	jmp	x0236

x0210:	xmit	0ffh,aux
	xmit	ram_24,ivl
	move	aux,dliv
	xmit	1ah,r4
	call	sub_0adf	; ret 19h
	xmit	port3,ivr
	move	r3,driv
	xmit	1ah,aux
	xmit	port4,ivr
	move	aux,driv
	xmit	port1,ivr
	xmit	12h,driv[4:0]
	xmit	port2,ivr
	move	sriv,r1
	xmit	port1,ivr
	xmit	0ch,driv[4:0]
	xmit	01h,aux
	xmit	01h,r2
x0223:	xmit	port1,ivr
	xmit	00h,driv[4]
	xmit	port2,ivr
	move	r2,driv
	xmit	port1,ivr
	xmit	01h,driv[4]
	xmit	port3,ivr
	add	sriv,driv
	xmit	port1,ivr
	xmit	00h,driv[4]
	add	r2,r2
	xmit	port2,ivr
	move	r1,driv
	xmit	port1,ivr
	xmit	01h,driv[4]
	xmit	port3,ivr
	add	sriv,driv
	nzt	ovf,x0236
	jmp	x0223

x0236:	xmit	1ah,aux
	xmit	port4,ivr
	move	aux,driv
	xmit	port3,ivr
	move	r3,driv
	xmit	port1,ivr
	xmit	12h,driv[4:0]
	call	sub_077d	; ret 1ah
	xmit	0ffh,r2
	xmit	00h,r3
	nzt	r5,x0244
	xmit	00h,r2
	xmit	0ffh,r3
x0244:	xmit	ram_02,ivl
	xmit	0c0h,r1
	move	r1,dliv
	xmit	01h,aux

	xmit	f_csr1,ivr	; enable write gate, enable CRC, data only,
	xmit	06h,driv[7:4]	; not sync enable

; keep writing r3 until index goes high
x024a:	xmit	fd_sta,ivr
	nzt	sriv[6],x0252	; index?

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	jmp	x024a

; keep writing r3 until index goes low
x0252:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	xmit	fd_sta,ivr
	move	sriv[6],r1	; index?
	nzt	r1,x0252

x025a:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv

	add	sliv,dliv
	nzt	ovf,x0262
	jmp	x025a

x0262:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv

	xmit	0fah,r1
	nzt	r5,x026a
	xmit	0fch,r1
x026a:	move	r1,dliv

x026b:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv

	add	sliv,dliv
	nzt	ovf,x0273
	jmp	x026b

x0273:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv

	nzt	r5,x0282
	xmit	0f5h,r4

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	05h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r4,driv
	xmit	7eh,r4
	jmp	x0295

x0282:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	07h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv
	xmit	2ah,r4

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	05h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r4,driv
	xmit	54h,r4

x0295:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r4,driv
	
	xmit	ram_08,ivl

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	07h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	sliv,driv

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	00h,driv

	xmit	port2,ivr
	move	sriv,r1

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r1,driv

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	00h,driv
	xmit	port3,ivr
	add	sriv,driv

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	xmit	00h,driv[6]	;   while writing 0 to CRC enable (CRC gen sources data)
	nzt	sriv[1],$-2

	xmit	f_data,ivr
	xmit	f_data,ivr

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	01h,driv[6]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	xmit	0f0h,r1
	nzt	r5,x02c6
	xmit	0f7h,r1

x02c6:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	06h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	xmit	ram_02,ivl
	move	r1,dliv

x02ce:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	add	sliv,dliv
	nzt	ovf,x02d6
	jmp	x02ce

x02d6:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv
	xmit	0fah,r1
	nzt	r5,x02de
	xmit	0fch,r1
x02de:	move	r1,dliv
	jmp	x02e0

x02e0:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv
	add	sliv,dliv
	nzt	ovf,x02e8
	jmp	x02e0

x02e8:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv

	nzt	r5,x02f7	; M2FM?

; write data=fb clock=c7 FM data address mark
	xmit	0f5h,r4

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	05h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r4,driv
	xmit	6fh,r4
	jmp	x030a

x02f7:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	07h,driv[6:4]

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv

; write data=0b clock=70, Intel M2FM data address mark
	xmit	2ah,r4

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	05h,driv[6:4]

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r4,driv

	xmit	45h,r4

x030a:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r4,driv
	xmit	port2,ivr
	move	sriv,r4

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	07h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r4,driv
	xmit	ram_02,ivl
	xmit	80h,r1
	move	r1,dliv

x031a:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	add	sliv,dliv
	nzt	ovf,x0321
	jmp	x031a

x0321:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	xmit	00h,driv[6]	;   while writing 0 to CRC enable (CRC gen sources data)
	nzt	sriv[1],$-2

	xmit	f_data,ivr
	xmit	f_data,ivr
	nzt	r5,x032b

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr

x032b:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	01h,driv[6]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	xmit	port3,ivr
	add	sriv,driv

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	nzt	ovf,x033f
	jmp	x0342

x033f:	xmit	f_csr1,ivr
	xmit	01h,driv[7]
	jmp	x039c

x0342:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	06h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	xmit	0f2h,aux
	nzt	r5,x034b
	xmit	0e9h,aux
x034b:	xmit	ram_02,ivl
	move	aux,dliv
	xmit	01h,aux

x034e:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	add	sliv,dliv
	nzt	ovf,x0356
	jmp	x034e

x0356:	xmit	0fah,r1
	nzt	r5,x0359
	xmit	0fch,r1

x0359:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r2,driv
	move	r1,dliv
	jmp	x026b

x0360:	call	sub_0756	; ret 1bh
	call	sub_0796	; ret 1ch
	xmit	ram_00,ivl
	move	sliv[3],r5
	xmit	ram_09,ivl
	xmit	00h,dliv[7:6]
	xmit	0cbh,aux
	nzt	r5,x036c
	xmit	0e5h,aux
	xmit	00h,dliv[5]
x036c:	xmit	ram_06,ivl
	nzt	sliv[2],x036f
	jmp	x037a

x036f:	xmit	ram_09,ivl
	add	sliv,r1
	nzt	ovf,x0398
	nzt	sliv,x0374
	jmp	x0398

x0374:	xmit	0ffh,aux
	add	r1,aux
	xmit	ram_07,ivl
	add	sliv,aux
	nzt	ovf,x0398
	jmp	x037e

x037a:	move	sliv[1],aux
	xor	sliv[0],aux
	nzt	aux,x037e
	jmp	x0382

x037e:	xmit	ram_08,ivl
	xmit	0b3h,aux
	add	sliv,aux
	nzt	ovf,x0398
x0382:	xmit	ram_06,ivl
	move	sliv[2:0],aux
	xec	x0387,aux
x0385:	call	sub_07b3	; ret 1dh

; xec table
x0387:	jmp	x039c
	jmp	x0385
	jmp	x01e4
	jmp	x01b6
	jmp	x03f4
	jmp	x041c
	jmp	x03cd
	jmp	x03cd

x038f:	xmit	ram_0d,ivl
	xmit	port3,ivr
	move	sliv,driv
	xmit	ram_0e,ivl
	xmit	port4,ivr
	move	sliv,driv
	xmit	port5,ivr
	xmit	00h,driv
	jmp	x06eb

x0398:	xmit	08h,r1
	jmp	x03a3

x039a:	xmit	80h,r1
	jmp	x03a3

x039c:	xmit	00h,r1
	jmp	x03a3

x039e:	xmit	04h,r1
	jmp	x03a3

x03a0:	xmit	0ah,r1
	jmp	x03a3

x03a2:	xmit	10h,r1
x03a3:	xmit	hostc,ivr
	move	r1,driv
	xmit	hostb,ivr
	xmit	00h,driv
	xmit	ram_00,ivl
	move	sliv[3],aux
	xmit	host8,ivr
	nzt	aux,x03af
	xmit	ram_05,ivl
	move	sliv[2],aux
	nzt	aux,x038f
	xmit	host9,ivr
x03af:	xmit	ram_05,ivl
	xmit	01h,aux
	xor	sliv[4],r1
	move	r1,driv[2]
	xmit	port1,ivr
	xmit	0dfh,aux
	move	aux,driv
	xmit	ram_31,ivl
	xmit	00h,dliv
x03b8:	xmit	ram_32,ivl
	xmit	0feh,aux
	move	aux,dliv
	xmit	ram_30,ivl
	xmit	00h,dliv
	xmit	ram_2f,ivl
	xmit	00h,dliv
x03bf:	call	sub_0676	; ret 1eh
	xmit	01h,aux
	xmit	ram_2f,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_30,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_32,ivl
	add	sliv,dliv
	nzt	ovf,x03cc
	jmp	x03bf

x03cc:	jmp	x0140

x03cd:	xmit	fd_sta,ivr
	nzt	sriv[5],x03d0	; write protect?
	jmp	x03a2

x03d0:	xmit	ram_06,ivl
	move	sliv[5:4],aux
	xmit	f_ram+4,ivr
	xor	sriv,aux
	nzt	aux,x03dc
	xmit	ram_08,ivl
	move	sliv,aux
	xmit	f_ram+2,ivr
	xor	sriv,aux
	nzt	aux,x03dc
	xmit	0ffh,aux
	move	aux,driv
x03dc:	xmit	80h,r3
	xmit	ram_24,ivl
	move	r3,dliv
	xmit	1ah,r4
	call	sub_0adf	; ret 1fh
	xmit	port4,ivr
	xmit	1ah,aux
	move	aux,driv
	xmit	port3,ivr
	xmit	80h,aux
	move	aux,driv
	call	sub_093e	; ret 20h
	xmit	0ffh,aux
	xmit	ram_07,ivl
	add	sliv,dliv
	move	sliv,aux
	nzt	aux,x03f0
	jmp	x039c

x03f0:	xmit	01h,aux
	xmit	ram_09,ivl
	add	sliv,dliv
	jmp	x03dc

x03f4:	xmit	ram_08,ivl
	move	sliv,aux
	xmit	f_ram+2,ivr
	xor	sriv,aux
	nzt	aux,x03ff
	xmit	ram_06,ivl
	move	sliv[5:4],aux
	xmit	f_ram+4,ivr
	xor	sriv,aux
	nzt	aux,x03ff
	jmp	x0409

x03ff:	call	sub_08a1	; ret 21h
	xmit	ram_08,ivl
	move	sliv,aux
	xmit	f_ram+2,ivr
	move	aux,driv
	xmit	ram_06,ivl
	move	sliv[5:4],aux
	xmit	f_ram+4,ivr
	move	aux,driv
x0409:	xmit	ram_09,ivl
	move	sliv[0],r3
	move	r3>>>1,r3
	move	sliv[7:1],r4
	xmit	ram_24,ivl
	xmit	80h,aux
	move	aux,dliv
	call	sub_0b2f	; ret 22h
	xmit	0ffh,aux
	xmit	ram_07,ivl
	add	sliv,dliv
	move	sliv,aux
	nzt	aux,x0418
	jmp	x039c

x0418:	xmit	01h,aux
	xmit	ram_09,ivl
	add	sliv,dliv
	jmp	x0409

x041c:	xmit	ram_08,ivl
	move	sliv,aux
	xmit	f_ram+2,ivr
	xor	sriv,aux
	nzt	aux,x0427
	xmit	ram_06,ivl
	move	sliv[5:4],aux
	xmit	f_ram+4,ivr
	xor	sriv,aux
	nzt	aux,x0427
	jmp	x039c

x0427:	call	sub_08a1	; ret 23h
	xmit	ram_08,ivl
	move	sliv,aux
	xmit	f_ram+2,ivr
	move	aux,driv
	xmit	ram_06,ivl
	move	sliv[5:4],aux
	xmit	f_ram+4,ivr
	move	aux,driv
	jmp	x039c

x0432:	xmit	ram_09,ivl
	xmit	01h,aux
	xor	sliv,aux
	xmit	ram_06,ivl
	add	sliv[3],aux
	xmit	ram_08,ivl
	add	sliv,aux
	nzt	aux,x0480
	nzt	ovf,x0480
x043b:	xmit	ram_25,ivl
x043c:	xmit	0e1h,aux
	move	aux,dliv
x043e:	call	sub_0a34	; ret 24h
	call	sub_0639	; ret 25h
	xmit	20h,aux
	call	sub_09d3	; ret 26h
	xmit	0ffh,aux
	xmit	ram_25,ivl
	add	sliv,dliv
	move	sliv,aux
	nzt	aux,x043e
	xmit	ram_35,ivl
	move	sliv[4],aux
	nzt	aux,x0480
	xmit	01h,dliv[4]
	jmp	x043b

x044f:	xmit	port3,ivr
	xmit	00h,driv
	xmit	port4,ivr
	xmit	1ch,aux
	move	aux,driv
	xmit	0e5h,r1
x0455:	call	sub_0662	; ret 27h
	nzt	ovf,x0459
	jmp	x0455

x0459:	xmit	ram_25,ivl
	xmit	8fh,aux
	move	aux,dliv
x045c:	xmit	ram_24,ivl
	xmit	80h,aux
	move	aux,dliv
	xmit	ram_1f,ivl
	xmit	1ch,aux
	move	aux,dliv
	xmit	ram_20,ivl
	xmit	00h,dliv
	xmit	ram_35,ivl
	xmit	01h,dliv[1]
	call	sub_0ac6	; ret 28h
	xmit	80h,r2
	xmit	ram_36,ivl
	xmit	01h,dliv[5]
	call	sub_0639	; ret 29h
x046d:	call	sub_0b77	; ret 2ah
	call	sub_0b7d	; ret 2bh
	xmit	01h,aux
	call	sub_09d3	; ret 2ch
	xmit	01h,aux
	xmit	ram_24,ivl
	add	sliv,dliv
	nzt	ovf,x0479
	jmp	x046d

x0479:	call	sub_0bb6		; ret 2dh
	xmit	01h,aux
	xmit	ram_25,ivl
	add	sliv,dliv
	nzt	ovf,x0480
	jmp	x045c

x0480:	call	sub_0c91		; ret 2eh
x0482:	xmit	host6,ivr
	xmit	00h,driv
	xmit	host7,ivr
	xmit	00h,driv
	xmit	ram_35,ivl
	xmit	01h,dliv[4:3]
	xmit	ram_36,ivl
	xmit	00h,dliv[3]
	xmit	ram_08,ivl
	move	sliv[6:0],r1
	move	sliv[7],aux
	xmit	ram_09,ivl
	move	sliv[7],r2
	add	r2>>>7,r2
	xmit	ram_15,ivl
	move	r2,dliv
	xmit	ram_06,ivl
	move	sliv[3],aux
	add	r1>>>7,r1
	xmit	ram_14,ivl
	move	r1,dliv
	move	sliv[6:0],r1
	move	sliv[7],aux
	xmit	ram_17,ivl
	xmit	00h,dliv
	move	r1,dliv[7:1]
	add	r2>>>7,r2
	xmit	ram_18,ivl
	move	r2,dliv
	xmit	ram_14,ivl
	move	sliv[3:0],r1
	move	sliv[7:4],aux
	xmit	00h,dliv
	move	r1,dliv[7:4]
	xmit	ram_15,ivl
	move	sliv[3:0],r1
	move	sliv[7:4],r2
	move	aux,dliv[3:0]
	move	r1,dliv[7:4]
	xmit	ram_16,ivl
	move	r2,dliv
	xmit	ram_17,ivl
	move	sliv,aux
	xmit	ram_14,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_18,ivl
	add	sliv,aux
	move	ovf,r1
	xmit	ram_15,ivl
	add	sliv,dliv
	move	ovf,aux
	add	r1,aux
	xmit	ram_16,ivl
	add	sliv,dliv
	xmit	01h,aux
	xmit	ram_09,ivl
	add	sliv,r1
	xmit	3fh,aux
	and	r1>>>1,r1
	xmit	0ffh,aux
	add	r1,aux
	xmit	ram_14,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_15,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_16,ivl
	add	sliv,dliv
	xmit	ram_09,ivl
	move	sliv[5:0],r1
	xmit	ram_1a,ivl
	move	r1,dliv
	xmit	ram_07,ivl
	move	sliv,r1
	xmit	ram_1b,ivl
	move	r1,dliv
	call	sub_0756	; ret 2fh
	xmit	ram_06,ivl
	move	sliv[7],aux
	add	sliv[5],aux
	nzt	aux,x04ea
	move	sliv[4],aux
	move	aux>>>7,aux
	add	sliv[6],aux
	xmit	26h,r3
	add	r3,r3
	move	r3,ivl
	move	sliv,r1
	xmit	ram_01,ivl
	move	r1,dliv
	move	sliv[3:2],r1
	move	sliv[7],r2
	xmit	04h,aux
	add	r3,ivl
	move	sliv,r4
	xmit	ram_2e,ivl
	move	r4,dliv
	xmit	7eh,aux
	xmit	ram_23,ivl
	move	aux,dliv
	nzt	r2,x04f2
x04ea:	xmit	11h,r1
	xmit	host6,ivr
	xmit	80h,r2
	move	r2,driv
	xmit	host7,ivr
	move	r2,driv
	call	sub_0c7d		; ret 30h
x04f2:	xmit	ram_01,ivl
	move	sliv[1:0],r6
x04f4:	nzt	r6,x04f6
	jmp	x05e5

x04f6:	xmit	ram_14,ivl
	xmit	00h,aux
	add	sliv,dliv
	xmit	ram_15,ivl
	move	ovf,aux
	add	sliv,dliv
	move	ovf,r1
	xmit	40h,aux
	add	sliv,dliv
	xmit	ram_16,ivl
	move	ovf,aux
	add	sliv,dliv
	move	r1,aux
	add	sliv,dliv
	xmit	0ffh,aux
	add	r6,r6
	jmp	x04f4

x0507:	xmit	00h,r1
	call	sub_0639	; ret 31h
	xmit	ram_36,ivl
	move	sliv[3],aux
	nzt	aux,x050f
	call	sub_0c91	; ret 32h
x050f:	jmp	x015a

x0510:	xmit	01h,r1
	call	sub_0639	; ret 33h
	call	sub_0c91	; ret 34h
x0515:	xmit	0bh,r1
	call	sub_0639	; ret 35h
	call	sub_0c91	; ret 36h
x051a:	xmit	ram_01,ivl
	move	sliv[5:4],aux
	move	aux>>>3,aux
	xmit	ram_16,ivl
	add	sliv[6:0],aux
	xmit	ram_3f,ivl
	xor	sliv,aux
	nzt	aux,x052e
	xmit	ram_15,ivl
	move	sliv,aux
	xmit	ram_40,ivl
	xor	sliv,aux
	nzt	aux,x052e
	xmit	ram_14,ivl
	move	sliv[7:1],aux
	move	aux>>>7,aux
	xmit	ram_41,ivl
	xor	sliv,aux
	nzt	aux,x052e
	jmp	x0554

x052e:	xmit	ram_14,ivl
	move	sliv[7:1],r1
	move	r1>>>7,r1
	move	sliv,r2
	xmit	ram_41,ivl
	move	r2,dliv
	xmit	ram_14,ivl
	move	r1,dliv
	xmit	0ffh,aux
	xmit	ram_3f,ivl
	move	aux,dliv
	xmit	ram_40,ivl
	move	aux,dliv
	call	sub_0a63	; ret 37h
	xmit	02h,r2
	xmit	ram_35,ivl
	xmit	01h,dliv[6]
	call	sub_0639	; ret 38h
	xmit	ram_01,ivl
	move	sliv[5:4],aux
	move	aux>>>3,aux
	xmit	ram_16,ivl
	add	sliv[6:0],aux
	xmit	ram_3f,ivl
	move	aux,dliv
	xmit	ram_15,ivl
	move	sliv,aux
	xmit	ram_40,ivl
	move	aux,dliv
	xmit	ram_41,ivl
	move	sliv,r2
	move	sliv[7:1],aux
	move	aux>>>7,aux
	move	aux,dliv
	xmit	ram_14,ivl
	move	r2,dliv
x0554:	xmit	ram_14,ivl
	move	sliv[0],aux
	xmit	1eh,r4
	add	r4,r4
	xmit	ram_35,ivl
	move	sliv[7],aux
	xmit	00h,dliv[7]
	nzt	aux,x055d
	jmp	x055e

x055d:	jmp	x0587

x055e:	xmit	ram_1a,ivl
	move	sliv[0],aux
	nzt	aux,x0563
x0561:	xmit	80h,r3
	jmp	x0564

x0563:	xmit	00h,r3
x0564:	xmit	ram_06,ivl
	xmit	04h,aux
	xor	sliv[2:0],aux
	nzt	aux,x056d
	xmit	ram_24,ivl
	xmit	80h,aux
	move	aux,dliv
	call	sub_0b2f	; ret 39h
x056d:	xmit	ram_1a,ivl
	xmit	01h,aux
	add	sliv,dliv
	move	sliv[0],r2
	xmit	ram_1b,ivl
	xmit	0ffh,aux
	add	sliv,dliv
	move	sliv,aux
	nzt	aux,x0578
	call	sub_0c91	; ret 3ah
x0578:	nzt	r2,x057a
	jmp	x0561

x057a:	xmit	ram_14,ivl
	xmit	01h,aux
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_15,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_16,ivl
	add	sliv,dliv
	jmp	x051a

x0584:	xmit	ram_35,ivl
	xmit	01h,dliv[7]
	jmp	x051a

x0587:	xmit	ram_1a,ivl
	move	sliv[0],aux
	nzt	aux,x058b
	jmp	x05c3

x058b:	xmit	00h,r3
	xmit	ram_24,ivl
	xmit	80h,aux
	move	aux,dliv
	call	sub_0adf	; ret 3bh
	xmit	ram_1b,ivl
	move	sliv[7:1],r1
	nzt	r1,x0595
	jmp	x05b1

x0595:	xmit	80h,r3
	xmit	ram_24,ivl
	xmit	80h,aux
	move	aux,dliv
	call	sub_0adf	; ret 3ch
	xmit	ram_1f,ivl
	move	r4,dliv
	xmit	ram_20,ivl
	xmit	00h,dliv
	xmit	ram_35,ivl
	xmit	01h,dliv[1]
	call	sub_0ac6	; ret 3dh
	xmit	01h,r2
	call	sub_0639	; ret 3eh
	xmit	ram_35,ivl
	xmit	00h,dliv[1]
	call	sub_0b7d	; ret 3fh
	xmit	ram_1b,ivl
	xmit	0ffh,aux
	add	sliv,dliv
	xmit	ram_1a,ivl
	xmit	01h,aux
	add	sliv,dliv
	jmp	x05d8

x05b1:	xmit	ram_1f,ivl
	move	r4,dliv
	xmit	ram_20,ivl
	xmit	00h,dliv
	xmit	ram_35,ivl
	xmit	01h,dliv[1]
	call	sub_0ac6	; ret 40h
	xmit	01h,r2
	call	sub_0639	; ret 41h
	xmit	ram_35,ivl
	xmit	00h,dliv[1]
	xmit	ram_20,ivl
	xmit	10h,dliv[7:3]
	call	x0b74		; ret 42h
	jmp	x05d8

x05c3:	xmit	80h,r3
	xmit	ram_24,ivl
	xmit	80h,aux
	move	aux,dliv
	call	sub_0adf	; ret 43h
	xmit	ram_1f,ivl
	move	r4,dliv
	xmit	ram_20,ivl
	xmit	00h,dliv
	xmit	ram_35,ivl
	xmit	01h,dliv[1]
	call	sub_0ac6	; ret 44h
	xmit	01h,r2
	call	sub_0639	; ret 45h
	xmit	ram_35,ivl
	xmit	00h,dliv[1]
	call	sub_0b7d	; ret 46h
x05d8:	xmit	ram_1a,ivl
	xmit	01h,aux
	add	sliv,dliv
	call	sub_09d3	; ret 47h
	xmit	ram_1b,ivl
	xmit	0ffh,aux
	add	sliv,dliv
	move	sliv,aux
	nzt	aux,x05e4
	call	sub_0c91	; ret 48h
x05e4:	jmp	x0584

x05e5:	xmit	hostd,ivr
	xmit	01h,driv[7]
	xmit	ram_06,ivl
	move	sliv[2:0],r1
	xec	x05ec,r1
	call	sub_0c83	; ret 49h

; xec table
x05ec:	jmp	x0507
	jmp	x0515
	jmp	x0432
	jmp	x0510
	jmp	x051a
	jmp	x051a
	jmp	x0584
	xmit	63h,r1


; XXX start of unreachable garbage
	jmp	0600h
	jmp	0432h
	jmp	0517h
	jmp	0521h
	jmp	0521h
	jmp	058bh
	xmit	63h,r1
	jmp	0600h
	xmit	01h,dliv[1]
	xmit	48h,r11
	jmp	0a94h
	xmit	01h,r2
; XXX end of unreachable garbage


x0600:	xec	x0603-1,r1
	call	sub_0c7d	; ret 4ah

x0603:	xmit	28h,r1
	xmit	2dh,r1
	xmit	19h,r1
	xmit	10h,r1
	xmit	1bh,r1
	xmit	25h,r1
	xmit	11h,r1
	xmit	2dh,r1
	xmit	10h,r1
	xmit	43h,r1
	xmit	1dh,r1
	xmit	63h,r1
	xmit	63h,r1
	xmit	63h,r1
	xmit	63h,r1
	xmit	22h,r1
	xmit	23h,r1
	xmit	1ch,r1
	xmit	1dh,r1
	xmit	29h,r1
	xmit	12h,r1
	xmit	63h,r1
	xmit	1ah,r1
	jmp	x0c8b

; XXX start of unreachable code
	xmit	13h,r1
	xmit	4fh,r1
	xmit	63h,r1
	xmit	29h,r1
	xmit	63h,r1
	xmit	63h,r1
	xmit	63h,r1
	xmit	48h,r1
	xmit	11h,r1
	xmit	47h,r1
	xmit	20h,r1
	return
; XXX end of unreachable code

sub_0627:
	xmit	ram_26,ivl
	move	r1,dliv
	xmit	ram_27,ivl
	move	r2,dliv
	xmit	ram_28,ivl
	move	r3,dliv
	xmit	ram_29,ivl
	move	r4,dliv
	xmit	ram_2a,ivl
	move	r5,dliv
	xmit	ram_2b,ivl
	move	r6,dliv
	xmit	ram_2c,ivl
	move	aux,dliv
	xmit	ram_23,ivl
	xmit	7eh,aux
	move	aux,dliv
	return

sub_0639:
	xmit	ram_34,ivl
	move	r11,dliv
	xmit	ram_38,ivl
	xmit	39h,aux
	move	aux,dliv
	xmit	ram_01,ivl
	move	sliv[5:4],aux
	move	aux>>>3,aux
	move	aux,r4
	call	sub_065b	; ret 4bh
	move	r4,aux
	xmit	ram_16,ivl
	add	sliv[6:0],r1
	call	sub_065b	; ret 4ch
	xmit	ram_15,ivl
	move	sliv,r1
	call	sub_065b	; ret 4dh
	xmit	ram_14,ivl
	move	sliv,r1
	call	sub_065b	; ret 4eh
	move	r2,r1
	call	sub_065b	; ret 4fh
	xmit	00h,r1
	call	sub_065b	; ret 50h
	call	sub_0ca8	; ret 51h
	jmp	x0cdb

	return			; inserted automatically by MCCAP


; ram[ram_38++] := r1
sub_065b:
	xmit	ram_38,ivl
	move	sliv,ivl
	move	r1,dliv
	xmit	ram_38,ivl
	xmit	01h,aux
	add	sliv,dliv
	return


sub_0662:
	xmit	port2,ivr
	move	r1,driv
	xmit	port1,ivr
	xmit	0ch,driv[4:0]
	xmit	01h,aux
	xmit	01h,driv[4]
	xmit	1fh,driv[4:0]
	xmit	port3,ivr
	add	sriv,driv
	return

	xmit	port1,ivr
	xmit	12h,driv[4:0]
	xmit	01h,aux
	xmit	port2,ivr
	move	sriv,r1
	xmit	port1,ivr
	xmit	1fh,driv[4:0]
	xmit	port3,ivr
	add	sriv,driv
	return


sub_0676:
	xmit	port6,ivr
	nzt	sriv[7],x0679
	jmp	x067a

x0679:	return			; inserted automatically by MCCAP


x067a:	jmp	x0680


; XXX start of presumed garbage
	jmp	0680h
	xmit	55h,r11
	jmp	0c7ah
	jmp	0ca9h
	return
; XXX end of presumed garbage


x0680:	nzt	sriv[0],x0689

	xmit	hosta,ivr	; clear interrupt pending for all drives
	xmit	00h,driv[2]
	xmit	host9,ivr
	xmit	00h,driv[2]
	xmit	host8,ivr
	xmit	00h,driv[2]

	xmit	port1,ivr
	xmit	01h,driv[5]
x0689:	xmit	port1,ivr
	xmit	00h,driv[6]
x068b:	xmit	port6,ivr
	nzt	sriv[7],x068e
	jmp	x068b

x068e:	xmit	ram_35,ivl
	xmit	00h,dliv[0]
	xmit	port1,ivr
	xmit	01h,driv[6]
	xmit	ram_31,ivl
	xmit	host0,ivr
	jmp	x06a0


; XXX start of unreachable code
	move	sriv,r1
	xmit	port1,ivr
	xmit	1fh,driv[4:0]
	xmit	port3,ivr
	add	sriv,driv
	return

	xmit	port6,ivr
	nzt	sriv[7],x069e
	jmp	x069f

x069e:	return

x069f:	jmp	x06a0
; XXX end of unreachable code


x06a0:	nzt	sriv[2],x06a6
	nzt	sriv[3],x06a8
	nzt	sriv[4],x06aa
	nzt	sriv[5],x06ac
x06a4:	xmit	00h,driv
	return

x06a6:	xmit	host2,ivr
	jmp	x06b0

x06a8:	xmit	host3,ivr
	jmp	x06b0

x06aa:	xmit	host4,ivr
	jmp	x06b0

x06ac:	xmit	hostd,ivr
	nzt	sriv[7],x06ba
	xmit	01h,driv[7]
	xmit	host5,ivr
x06b0:	xmit	0ch,aux
	add	sliv[1:0],ivl
	move	sriv,dliv
	xmit	ram_31,ivl
	xmit	01h,aux
	add	sliv,dliv
	xmit	host0,ivr
	move	sriv[2],aux
	nzt	aux,x06a4
	jmp	x06bd

x06ba:	xmit	00h,dliv
	xmit	host0,ivr
	jmp	x06a4

x06bd:	nzt	sliv[0],x06ba
	move	sliv[1:0],aux
	xmit	ram_00,ivl
	move	sriv,dliv
	xmit	00h,driv
	nzt	aux,x06dc
	xmit	ram_0c,ivl
	move	sliv,aux
	xmit	ram_0d,ivl
	move	sliv[3:0],r1
	add	r1>>>4,r1
	xmit	port3,ivr
	move	r1,driv
	move	ovf,aux
	add	sliv[7:4],aux
	xmit	ram_0f,ivl
	add	sliv,aux
	move	ovf,r2
	xmit	ram_0e,ivl
	move	sliv[3:0],r1
	add	r1>>>4,r1
	move	ovf,aux
	xmit	port4,ivr
	move	r1,driv
	add	sliv[7:4],aux
	xmit	port5,ivr
	add	r2,driv
	call	sub_073f	; ret 52h
	xmit	09h,r6
	jmp	x0708

x06dc:	xmit	ram_0c,ivl
	xmit	port3,ivr
	move	sliv,driv
	xmit	ram_0d,ivl
	xmit	port4,ivr
	move	sliv,driv
	xmit	port5,ivr
	xmit	00h,driv
x06e4:	call	sub_073f	; ret 53h
	xmit	ram_00,ivl
	move	sliv[4],aux
	nzt	aux,x06eb
	xmit	07h,r6
	jmp	x0708

x06eb:	xmit	port2,ivr
	move	sriv[2],aux
	xmit	0ah,r6
	nzt	aux,x06f0
	xmit	08h,r6
x06f0:	move	sriv[0],aux
	nzt	aux,x06f3
	jmp	x0708

x06f3:	move	sriv[1],aux
	jmp	x0700


; XXX start of unrechable code, presumed garbage
	add	sliv[7:4],aux
	xmit	port5,ivr
	add	r2,driv
	xmit	56h,r11
	jmp	0753h
	xmit	09h,r6
	jmp	071ch
	xmit	ram_0c,ivl
	xmit	port3,ivr
	move	sliv,driv
	xmit	ram_0d,ivl
; XXX end of unreachable code, presumed garbage


	org	0700h

x0700:	nzt	aux,x071d
	xmit	ram_24,ivl
	xmit	00h,dliv
	xmit	01h,aux
x0704:	add	sliv,dliv
	nzt	ovf,x0707
	jmp	x0704

x0707:	jmp	x06e4

x0708:	xmit	05h,r5
x0709:	xmit	port2,ivr
	move	r5,ivl
	move	sriv,dliv
	xmit	0ffh,aux
	add	r6,r6
	nzt	r6,x0710
	jmp	x0738

x0710:	xmit	01h,aux
	add	r5,r5
	xmit	port3,ivr
	add	sriv,driv
	move	ovf,aux
	xmit	port4,ivr
	add	sriv,driv
	move	ovf,aux
	xmit	port5,ivr
	add	sriv,driv
	call	sub_073f	; ret 54h
	jmp	x0709

x071d:	xmit	08h,aux
	xmit	port3,ivr
	add	sriv,driv
	move	ovf,aux
	xmit	port4,ivr
	add	sriv,driv
	call	sub_073f	; ret 55h
	xmit	ram_01,ivl
	xmit	port2,ivr
	move	sriv,dliv
	xmit	01h,aux
	xmit	port3,ivr
	add	sriv,driv
	move	ovf,aux
	xmit	port4,ivr
	add	sriv,driv
	call	sub_073f	; ret 56h
	xmit	port2,ivr
	move	sriv,aux
	xmit	port4,ivr
	move	aux,driv
	xmit	ram_01,ivl
	xmit	port3,ivr
	move	sliv,driv
	jmp	x06e4

x0738:	xmit	ram_00,ivl
	nzt	sliv[5],x073b
	jmp	x0360

x073b:	xmit	fd_cntl,ivr
	xmit	01h,driv[5]
	jmp	x0482

	return			; inserted automatically by MCCAP


sub_073f:
	xmit	ram_33,ivl		; save return address
	move	r11,dliv

	xmit	ram_02,ivl
	xmit	00h,dliv
x0743:	xmit	port1,ivr
	xmit	13h,driv[4:0]
	xmit	ram_02,ivl
	xmit	01h,aux
	add	sliv,dliv
	nzt	ovf,x074f
	xmit	dip_sw,ivr
	move	sriv[7],aux
	nzt	aux,x0752
	call	sub_0676	; ret 57h
	jmp	x0743

x074f:	xmit	66h,r1
	call	sub_0c83	; ret 58h
x0752:	xmit	port1,ivr
	xmit	1fh,driv[4:0]
	jmp	x0cd9

	return			; inserted automatically by MCCAP


sub_0756:
	xmit	ram_31,ivl
	move	sliv[1:0],r1
	nzt	r1,x075a
	jmp	x0765

x075a:	xmit	ram_0a,ivl
	move	sliv,aux
	xmit	ram_1c,ivl
	move	aux,dliv
	xmit	ram_0b,ivl
	move	sliv,aux
	xmit	ram_1d,ivl
	move	aux,dliv
	xmit	ram_1e,ivl
	xmit	00h,dliv
	return

x0765:	xmit	ram_0a,ivl
	move	sliv,aux
	xmit	ram_0c,ivl
	move	sliv[3:0],r1
	move	sliv[7:4],r2
	add	r1>>>4,r1
	xmit	ram_1c,ivl
	move	r1,dliv
	move	ovf,aux
	add	r2,aux
	xmit	ram_0b,ivl
	add	sliv,aux
	move	ovf,r3
	xmit	ram_0d,ivl
	move	sliv[3:0],r1
	move	sliv[7:4],r2
	add	r1>>>4,r1
	move	ovf,aux
	xmit	ram_1d,ivl
	move	r1,dliv
	add	r2,aux
	xmit	ram_1e,ivl
	add	r3,dliv
	return


sub_077d:
	xmit	00h,r4
	xmit	0feh,r3
	xmit	00h,r2
	xmit	00h,r1
x0781:	xmit	01h,aux
	xmit	fd_sta,ivr
	nzt	sriv[6],x0785	; index?
	return

x0785:	add	r1,r1
	move	ovf,aux
	add	r2,r2
	move	ovf,aux
	add	r3,r3
	move	ovf,aux
	add	r4,r4
	nzt	ovf,x078e
	jmp	x0781

x078e:	jmp	x039a

	return			; inserted automatically by MCCAP


sub_0790:
	xmit	ram_06,ivl
	move	sliv[4],aux
	xec	x0794,aux
	return

; xec table
x0794:	xmit	f_ram+0,ivr
	xmit	f_ram+1,ivr


sub_0796:
	xmit	ram_00,ivl
	move	sliv[3],aux
	xmit	ram_06,ivl
	nzt	aux,x079b
	xmit	00h,dliv[5]
x079b:	move	sliv[5],aux
	move	sliv[4],r1
	add	r1>>>7,r1
	xmit	06h,aux
	add	r1>>>4,r1
	xmit	01h,aux
	xor	sliv[5],aux
	add	r1,r1
	xmit	f_ram+7,ivr
	move	sriv,aux
	xor	r1,aux
	move	r1,driv
	xmit	f_ram+6,ivr
	move	aux,driv
	xmit	fd_cntl,ivr
	move	r1,driv[7:2]

	xmit	f_csr1,ivr	; test disk status DS1 input
	move	sriv[0],aux
	nzt	aux,x07b0

	xmit	01h,driv[7]
	return

x07b0:	xmit	fd_cntl,ivr
	xmit	01h,driv[5]
	jmp	x039a


sub_07b3:
	xmit	ram_33,ivl		; save return address
	move	r11,dliv

sub_07b5:
	call	sub_0790	; ret 59h
	xmit	0ffh,aux
	xor	sriv,aux
	nzt	aux,x07bd
	xmit	ram_35,ivl
	xmit	01h,dliv[1]
	jmp	x01b6

x07bd:	move	sriv,r5
	xmit	ram_08,ivl
	move	sliv,r3
	move	r5,aux
	xor	r3,r2
	nzt	r2,x07c7
	xmit	f_ram+6,ivr
	move	sriv,aux
	nzt	aux,x07e7
	jmp	x0cd9

x07c7:	xmit	0ffh,aux
	xor	r3,r4
	xmit	01h,aux
	add	r4,aux
	add	r5,r4
	xmit	80h,aux
	and	r4,r4
	xmit	fd_cntl,ivr
	nzt	r4,x07d3
	xmit	01h,driv[3]
	xmit	0ffh,r4
	jmp	x07d5

x07d3:	xmit	00h,driv[3]
	xmit	01h,r4
x07d5:	xmit	00h,driv[4]
	xmit	0d2h,r2
	xmit	01h,aux
x07d8:	add	r1,r1
	xmit	01h,driv[4]
	nzt	r1,x07d8
	add	r2,r2
	nzt	r2,x07d8
	move	r4,aux
	add	r5,r5
	move	r5,aux
	xor	r3,aux
	nzt	aux,x07e3
	jmp	x07e4

x07e3:	jmp	x07c7

x07e4:	call	sub_0790	; ret 5ah
	move	r5,driv
x07e7:	xmit	01h,aux
	xmit	00h,r1
x07e9:	add	r2,r2
	nzt	r2,x07e9
	add	r1,r1
	nzt	r1,x07e9
	jmp	x0cd9

	return			; inserted automatically by MCCAP


sub_07ef:
	move	r5,r4
	xmit	ram_00,ivl
	move	sliv[3],r5
	xmit	0cbh,r1		; precomp, write mode, preamble select,
				; M2FM, full rate
	nzt	r5,x07f5
	xmit	45h,r1		; write mode, FM, full rate
x07f5:	xmit	f_csr2,ivr
	move	r1,driv
	xmit	port1,ivr
	xmit	00h,driv[7]
	return


x07fa:	xmit	f_csr1,ivr
	xmit	05h,driv[6:4]
	nzt	sriv[1],x07fa
	xmit	01h,driv[5]
	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	2ah,aux		; 2a = first byte of M2FM ID address mark
	nzt	r5,x0803
	xmit	0f5h,aux
x0803:	xor	sriv,aux
	nzt	aux,x080f

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	54h,aux		; 54 = second byte of M2FM ID address mark
	nzt	r5,x080c
	xmit	7eh,aux
x080c:	xor	sriv,aux
	nzt	aux,x080f
	jmp	x0846		; is an M2FM ID address mark

x080f:	jmp	x0831		; not an M2FM ID address mark

	return			; inserted automatically by MCCAP


sub_0811:
	xmit	ram_33,ivl		; save return address
	move	r11,dliv

	xmit	f_csr2,ivr
	xmit	00h,driv[6]	; read mode
	xmit	0ceh,r4
	jmp	x083c

x0817:	xmit	0fch,r2
	xmit	0c0h,r3
x0819:	xmit	0fdh,r6
	nzt	r5,x081c
	xmit	0ffh,r6
x081c:	xmit	port1,ivr
	xmit	00h,driv[7]

	xmit	ram_33,ivl		; restore return address
	move	sliv,r11

x0820:	xmit	0ffh,aux
	nzt	r5,x0823
	xmit	00h,aux

x0823:	xmit	f_csr1,ivr
	xmit	06h,driv[6:4]
	nzt	sriv[1],x0823

	xmit	f_data,ivr
	xmit	f_data,ivr
	xor	sriv,aux
	nzt	aux,x0831
	xmit	01h,aux
	add	r6,r6
	nzt	r6,x0820
	xmit	port1,ivr
	xmit	01h,driv[7]
	jmp	x07fa

	return

x0831:	xmit	ram_33,ivl		; restore return address
	move	sliv,r11

	xmit	01h,aux
	add	r3,r3
	nzt	r3,x0844
	add	r2,r2
	nzt	r2,x0844
	add	r4,r4
	nzt	r4,x083c
	xmit	0eh,r1
	jmp	x03a3

x083c:	xmit	00h,r2
x083d:	xmit	f_csr2,ivr
	xmit	01h,driv[6]	; write mode
	add	r2,r2
	nzt	r2,x083d
	xmit	00h,driv[6]	; read mode
	jmp	x0817

	return

x0844:	jmp	x0819

	return

x0846:	xmit	00h,r1

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	ram_08,ivl
	move	sliv,aux
	xor	sriv,aux
	nzt	aux,x0850
	jmp	x0851

x0850:	xmit	01h,r1

x0851:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	nzt	sriv,x0857
	jmp	x0858

x0857:	xmit	01h,r1
x0858:	xmit	ram_06,ivl
	jmp	x0860


; XXX start of unreachable code, presumed garbage
	nzt	r1,085ch
	xmit	02h,r1
	xmit	f_csr1,ivr
	nzt	sriv[1],085ch
	xmit	f_data,ivr
	xmit	f_data,ivr
; XXX end of unreachable code, presumed garbage


	org	0860h
	
x0860:	nzt	sliv[1],x086b

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	sriv,aux
	xmit	f_ram+3,ivr
	move	aux,driv
	xmit	f_ram+5,ivr
	add	sriv,driv
	jmp	x0876

x086b:	xmit	ram_09,ivl
	move	sliv,aux

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xor	sriv,aux
	nzt	aux,x0874
	jmp	x0876

x0874:	nzt	r1,x0876
	xmit	02h,r1

x0876:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	nzt	sriv,x087c
	jmp	x087d

x087c:	xmit	03h,r1

x087d:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	00h,driv[6]
	xmit	f_data,ivr
	xmit	f_data,ivr

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	0f1h,aux
	nzt	r5,x0889
	xmit	00h,aux

x0889:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	01h,driv[6]
	xmit	f_data,ivr
	xmit	f_data,ivr
	xor	sriv,aux
	nzt	aux,x08a0
	xmit	0ceh,aux
	nzt	r5,x0893
	xmit	00h,aux

x0893:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xor	sriv,aux
	nzt	aux,x08a0
	xec	x089c,r1
	xmit	01h,driv[6]
	return

; xec table
x089c:	xmit	f_csr2,ivr
	jmp	x039e
	jmp	x0844
	jmp	x0844
x08a0:	jmp	x03a0


sub_08a1:
	xmit	ram_34,ivl
	move	r11,dliv
	xmit	port1,ivr
	xmit	1ch,driv[4:0]
x08a5:	call	sub_07b3	; ret 5bh
	call	sub_07ef	; ret 5ch
	xmit	f_ram+4,ivr
	xmit	0ffh,aux
	move	aux,driv
	xmit	f_ram+5,ivr
	xmit	00h,driv
	xmit	0cch,aux
	nzt	r5,x08b1
	xmit	0e6h,aux
x08b1:	xmit	ram_24,ivl
	move	aux,dliv
	xmit	0c4h,aux
	xmit	fd_cntl,ivr
	xmit	00h,driv[1]
	add	r4,aux
	nzt	ovf,x08b9
	xmit	01h,driv[1]
x08b9:	call	sub_0811		; ret 5dh

	xmit	f_csr2,ivr
	xmit	00h,driv[6]		; read mode

	xmit	f_ram+3,ivr
	move	sriv[0],aux
	move	sriv[7:1],r1
	xmit	port3,ivr
	move	aux,driv[14:7]
	xmit	00h,driv[6:0]
	xmit	port4,ivr
	move	r1,driv
	xmit	0fdh,r3
	xmit	0f6h,r2
	nzt	r5,x08ca
	xmit	0feh,r3
	xmit	0d1h,r2
x08ca:	xmit	01h,aux
x08cb:	add	r2,r2
	nzt	r2,x08cb
	add	r3,r3
	nzt	r3,x08cb

	xmit	f_csr2,ivr
	xmit	00h,driv[6]	; read mode

x08d1:	xmit	0ffh,aux
	nzt	r5,x08d4
	xmit	00h,aux
x08d4:	xmit	f_csr1,ivr
	xmit	06h,driv[6:4]
	nzt	sriv[1],x08d4
	xmit	f_data,ivr
	xmit	f_data,ivr
	xor	sriv,r1
	nzt	r1,x08d4
	xmit	2ah,aux
	nzt	r5,x08de
	xmit	0f5h,aux
x08de:	jmp	x08e0


; XXX start of unreachable code, presumed garbage
	xmit	01h,aux
; XXX end of unreachable code, presumed garbage


	align	10h

x08e0:	xmit	f_csr1,ivr
	xmit	05h,driv[6:4]
	nzt	sriv[1],x08e0
	xmit	f_data,ivr
	xmit	f_data,ivr
	xor	sriv,r1
	nzt	r1,x08d1
	xmit	45h,aux
	nzt	r5,x08ea
	xmit	6fh,aux
x08ea:	xmit	f_csr1,ivr
	xmit	07h,driv[6:4]
	nzt	sriv[1],x08ea
	xmit	f_data,ivr
	xmit	f_data,ivr
	xor	sriv,aux
	nzt	aux,x08f2
	jmp	x08fb

x08f2:	xmit	48h,aux
	nzt	r5,x08f5
	xmit	6ah,aux
x08f5:	xor	sriv,aux
	nzt	aux,x08f9
	xmit	01h,r1
	jmp	x03a3

x08f9:	xmit	0fh,r1
	jmp	x03a3

x08fb:	xmit	01h,aux
	jmp	x0900


; XXX start of unreachable garbage
	xor	ivr>>>6,r15
	xor	sriv[5:4],driv[2:1]
	xec	08efh,sriv[0]
; XXX end of unreachable garbage


	align	100h

x0900:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	sriv,r1
	xmit	port2,ivr
	move	r1,driv
	xmit	port1,ivr
	xmit	00h,driv[4]
	xmit	01h,driv[4]
	xmit	port3,ivr
	add	sriv,driv
	nzt	sriv[6:0],x0900
	jmp	x0910

x090e:	xmit	02h,r1
	jmp	x03a3

x0910:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	00h,driv[6]
	xmit	f_data,ivr
	xmit	f_data,ivr

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	01h,driv[6]
	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	0ch,aux
	nzt	r5,x0921
	xmit	00h,aux
x0921:	xor	sriv,aux
	nzt	aux,x090e

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	99h,aux
	nzt	r5,x092a
	xmit	00h,aux
x092a:	xor	sriv,aux
	nzt	aux,x090e

	xmit	f_csr2,ivr
	xmit	01h,driv[6]	; write mode

	xmit	port1,ivr
	xmit	00h,driv[7]
	xmit	ram_24,ivl
	xmit	01h,aux
	add	sliv,dliv
	nzt	ovf,x0935
	jmp	x08b9

x0935:	xmit	62h,aux
	nzt	r5,x0938
	xmit	5fh,aux
x0938:	xmit	f_ram+5,ivr
	xor	sriv,aux
	nzt	aux,x093c
	jmp	x0cdb

x093c:	jmp	x08a5

	return			; inserted automatically by MCCAP


sub_093e:
	xmit	ram_34,ivl		; save return address
	move	r11,dliv

	call	sub_07b3	; ret 5e
	call	sub_07ef	; ret 5f

	xmit	(-43)&0ffh,aux	; choose precomp based on track
	add	r4,aux
	xmit	f_csr2,ivr
	xmit	01h,driv[7]	; precomp enabled
	nzt	ovf,x094a
	xmit	00h,driv[7]	; precomp disabled

x094a:	xmit	0c4h,aux
	add	r4,aux
	xmit	fd_cntl,ivr
	xmit	00h,driv[1]
	nzt	ovf,x0950
	xmit	01h,driv[1]
x0950:	xmit	port1,ivr
	xmit	12h,driv[4:0]
	call	sub_0811	; ret 60h
	xmit	port1,ivr
	xmit	00h,driv[7]
	xmit	0f5h,r3

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	0eh,r2
	nzt	r5,x095e
	xmit	08h,r2
x095e:	xmit	0ffh,aux
	jmp	x0960

x0960:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	add	r2,r2
	nzt	r2,x0960
	xmit	0ffh,r1
	nzt	r5,x0969
	xmit	00h,r1

x0969:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	06h,driv[7:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r1,driv
	xmit	0f9h,r1
	nzt	r5,x0972
	xmit	0fbh,r1
x0972:	xmit	01h,aux

x0973:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	add	r1,r1
	nzt	r1,x0973
	xmit	ram_06,ivl
	move	sliv[0],r1
	nzt	r5,x0986

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	05h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	xmit	6ah,r3
	nzt	r1,x0985
	xmit	6fh,r3
x0985:	jmp	x0999

x0986:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	07h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	xmit	48h,r3
	nzt	r1,x0992
	xmit	2ah,r3

x0992:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	05h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	xmit	45h,r3

x0999:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r3,driv
	xmit	port2,ivr
	move	sriv,r1

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	07h,driv[6:4]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r1,driv
x09a6:	xmit	port3,ivr
	add	sriv,driv
	nzt	ovf,x09b1
	xmit	port2,ivr
	move	sriv,r1

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r1,driv
	jmp	x09a6

x09b1:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	xmit	00h,driv[6]	;   while writing 0 to CRC enable (CRC gen sources data)
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
	nzt	r5,x09bf

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr
x09bf:	xmit	00h,r1
	nzt	r5,x09c2
	xmit	0ffh,r1

x09c2:	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	01h,driv[6]
	xmit	f_data,ivr
	xmit	f_data,ivr
	move	r1,driv

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	f_data,ivr
	xmit	f_data,ivr

	xmit	f_csr1,ivr	; wait for BYTRA = 0
	nzt	sriv[1],$-1

	xmit	01h,driv[7]
	xmit	port1,ivr
	xmit	1fh,driv[4:0]
	jmp	x0cdb

	return			; inserted automatically by MCCAP


sub_09d3:
	xmit	ram_14,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_15,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_16,ivl
	add	sliv,dliv
	return


sub_09dc:
	xmit	04h,r2
	xmit	03h,r1
	return


x09df:	xmit	ram_33,ivl		; save return address
	move	r11,dliv

	xmit	ram_38,ivl
	xmit	39h,aux
	move	aux,dliv
	xmit	ram_02,ivl
	xmit	00h,dliv
x09e6:	xmit	3ch,aux
	xmit	port6,ivr
	and	sriv,r1
	xmit	24h,aux
	xor	r1,r1
	nzt	r1,x09ed
	jmp	x09f5

x09ed:	xmit	01h,aux
	xmit	ram_02,ivl
	add	sliv,dliv
	nzt	ovf,x09f2
	jmp	x09e6

x09f2:	xmit	43h,r1
	call	sub_0c83	; ret 61h
x09f5:	xmit	ram_38,ivl
	move	sliv,ivl
	xmit	0ffh,aux
	xor	sliv,r2
	xmit	port7,ivr
	xmit	17h,driv[7:3]
	call	sub_0acd	; ret 62h
	xmit	port7,ivr
	xmit	00h,driv[4]
	xmit	01h,aux
	xmit	ram_38,ivl
	add	sliv,dliv
	xmit	0ffh,aux
	xmit	ram_03,ivl
	add	sliv,dliv
	move	sliv,r2
x0a06:	xmit	port6,ivr
	move	sriv[3],aux
	nzt	aux,x0a0c
	xmit	43h,r1
	xmit	08h,r11		; XXX non-standard use of r11
	jmp	x0a06

x0a0c:	xmit	port7,ivr
	xmit	7fh,aux
	move	aux,driv
	nzt	r2,x0a12
	call	sub_0bb4	; ret 63h
x0a12:	jmp	x09e6

	return

x0a14:	xmit	ram_04,ivl
	move	sliv[2],aux
	nzt	aux,x0a18
	jmp	x0a1b

x0a18:	xmit	64h,r1
	call	sub_0c83	; ret 64h
x0a1b:	xmit	10h,aux
	add	sliv,r1
	xmit	01h,aux
	add	sliv,dliv
	move	r1,ivl
	xmit	port8,ivr
	move	sriv,dliv
	xmit	ram_02,ivl
	xmit	00h,dliv
x0a24:	xmit	port7,ivr
	xmit	00h,driv[4]
	xmit	port6,ivr
	move	sriv[3],aux
	nzt	aux,x0a30
	xmit	01h,aux
	add	sliv,dliv
	nzt	ovf,x0a2d
	jmp	x0a24

x0a2d:	xmit	43h,r1
	call	sub_0c83	; ret 65h
x0a30:	xmit	port7,ivr
	xmit	01h,driv[4]
	jmp	sub_0bb6

	return			; inserted automatically by MCCAP


sub_0a34:
	xmit	0ffh,aux
	xmit	ram_3f,ivl
	move	aux,dliv
	xmit	ram_40,ivl
	move	aux,dliv
	xmit	ram_41,ivl
	move	aux,dliv
	xmit	dip_sw,ivr
	xmit	07h,aux
	xor	sriv[2:0],aux
	nzt	aux,x0a5f
	xmit	04h,r1
	xmit	ram_16,ivl
	xmit	16h,dliv
	xmit	04h,r2
	xmit	ram_36,ivl
	xmit	01h,dliv[12:5]
	call	sub_0639	; ret 66h
	xmit	port4,ivr
	xmit	1bh,aux
	move	aux,driv
	xmit	port3,ivr
	xmit	00h,driv
	xmit	80h,r1
	call	sub_0662	; ret 67h
	xmit	0c4h,r1
	call	sub_0662	; ret 68h
	xmit	02h,r1
	call	sub_0662	; ret 69h
	xmit	port3,ivr
	xmit	00h,driv
x0a57:	xmit	06h,r1
	xmit	ram_35,ivl
	xmit	00h,dliv[1]
	call	sub_0b7e	; ret 6ah
	xmit	ram_16,ivl
	xmit	00h,dliv
	jmp	x044f

x0a5f:	xmit	06h,r1
	xmit	ram_2e,ivl
	move	sliv[4:0],r2
	return


sub_0a63:
	xmit	08h,r1
	return


x0a65:	return

x0a66:	xmit	ram_36,ivl
	move	sliv[5],aux
	nzt	aux,x0a65
	xmit	port3,ivr
	xmit	00h,driv
sub_0a6b:
	xmit	port4,ivr
	xmit	ram_35,ivl
	move	sliv[6],r1
	xmit	1eh,aux
	nzt	r1,x0a71
	xmit	1bh,aux
x0a71:	move	aux,driv

	xmit	ram_33,ivl		; save return address
	move	r11,dliv

x0a74:	xmit	port6,ivr
	xmit	0ch,aux
	xor	sriv[5:2],aux
	nzt	aux,x0a74
	xmit	port8,ivr
	xmit	0ffh,aux
	xor	sriv,r1
	xmit	port2,ivr
	move	r1,driv
	xmit	ram_36,ivl
	move	sliv[5],aux
	xmit	port1,ivr
	nzt	aux,x0a84
	xmit	1ch,driv[4:0]
	xmit	00h,driv[4]
	jmp	x0a88

x0a84:	xmit	ram_38,ivl
	add	sliv,dliv
	xmit	ram_17,ivl
	move	r1,dliv
x0a88:	xmit	ram_01,ivl
	move	sliv[6],aux
	xmit	1fh,driv[4:0]
	nzt	aux,x0a8d
	jmp	x0aa0

x0a8d:	xmit	00h,aux
	xmit	port2,ivr
	add	sriv[0],aux	; compute parity of bits in riv2[7:0], riv6[1]
	add	sriv[1],aux
	add	sriv[2],aux
	add	sriv[3],aux
	add	sriv[4],aux
	add	sriv[5],aux
	add	sriv[6],aux
	add	sriv[7],aux
	xmit	port6,ivr
	add	sriv[1],r1
	xmit	01h,aux
	and	r1,r1
	nzt	r1,x0a9d
	jmp	x0aa0

x0a9d:	xmit	65h,r1
	call	sub_0c83	; ret 6bh
x0aa0:	xmit	port7,ivr
	xmit	00h,driv[4]
	xmit	ram_02,ivl
	xmit	00h,dliv
x0aa4:	xmit	port6,ivr
	move	sriv[3],aux
	nzt	aux,x0aae
	xmit	01h,aux
	add	sliv,dliv
	nzt	ovf,x0aab
	jmp	x0aa4

x0aab:	xmit	43h,r1
	call	sub_0c83	; ret 6ch
x0aae:	xmit	port7,ivr
	xmit	01h,driv[4]
	xmit	port3,ivr
	xmit	01h,aux
	add	sriv,driv
	nzt	ovf,x0ab5
	jmp	x0a74

x0ab5:	move	ovf,aux
	xmit	port4,ivr
	add	sriv,driv
	xmit	ram_35,ivl
	move	sliv[6],aux
	nzt	aux,x0abd
	call	sub_0bb4	; ret 6dh
x0abd:	xmit	20h,aux
	xmit	port4,ivr
	xor	sriv,aux
	nzt	aux,x0ac4
	xmit	00h,dliv[6]
	call	sub_0bb4	; ret 6eh
x0ac4:	jmp	x0a74

	return			; inserted automatically by MCCAP


sub_0ac6:
	xmit	0ah,r1
	return


sub_0ac8:
	xmit	port7,ivr
	xmit	17h,driv[7:3]
	xmit	port2,ivr
	xmit	0ffh,aux
	xor	sriv,r2

sub_0acd:
	xmit	port8,ivr
	move	r2,driv
	xmit	00h,aux
	add	sriv[0],aux
	add	sriv[1],aux
	add	sriv[2],aux
	add	sriv[3],aux
	add	sriv[4],aux
	add	sriv[5],aux
	add	sriv[6],aux
	add	sriv[7],r1
	xmit	01h,aux
	and	r1,r1
	xmit	port7,ivr
	xmit	01h,driv[1]
	nzt	r1,x0ade
	xmit	00h,driv[1]
x0ade:	return


sub_0adf:
	xmit	ram_33,ivl		; save return address
	move	r11,dliv

	xmit	00h,r6
x0ae2:	move	r6,aux
	xmit	ram_1c,ivl
	xmit	port3,ivr
	add	sliv,driv
	move	ovf,aux
	xmit	ram_1d,ivl
	xmit	port4,ivr
	add	sliv,driv
	move	ovf,aux
	xmit	ram_1e,ivl
	xmit	port5,ivr
	add	sliv,driv
	xmit	ram_02,ivl
	xmit	00h,dliv
	xmit	ram_03,ivl
	xmit	00h,dliv
x0af2:	xmit	port1,ivr
	xmit	13h,driv[4:0]
	xmit	dip_sw,ivr
	move	sriv[7],aux
	jmp	x0b00

; XXX start of unreachable code, presumed garbage
	add	r6,r6
	xmit	01h,driv[4]
	xmit	01h,driv[1]
	xmit	1fh,driv[4:0]
	xmit	ram_24,ivl
	add	sliv,dliv
	nzt	ovf,0affh
	jmp	0ac9h
	xmit	ram_1c,ivl
; XXX end of unreachable code, presumed garbage


	align	0100h

x0b00:	nzt	aux,x0b0e
	xmit	01h,aux
	xmit	ram_02,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_03,ivl
	add	sliv,dliv
	call	sub_0676	; ret 6fh
	nzt	ovf,x0b0b
	jmp	x0af2

x0b0b:	xmit	66h,r1
	call	sub_0c83	; ret 70h
x0b0e:	xmit	port1,ivr
	xmit	01h,driv[2]
	xmit	1fh,driv[4:0]
	move	r6,aux
	xmit	port3,ivr
	add	r3,driv
	xmit	port4,ivr
	move	r4,driv
	xmit	port1,ivr
	xmit	1ch,driv[4:0]
	xmit	00h,driv[4]
	xmit	01h,aux
	add	r6,r6
	xmit	01h,driv[4]
	xmit	01h,driv[1]
	xmit	1fh,driv[4:0]
	xmit	ram_24,ivl
	add	sliv,dliv
	nzt	ovf,x0b22
	jmp	x0ae2

x0b22:	xmit	ram_1c,ivl
	move	r6,aux
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_1d,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_1e,ivl
	add	sliv,dliv
	xmit	port1,ivr
	xmit	1fh,driv[4:0]
	jmp	x0cd9

	return			; inserted automatically by MCCAP


sub_0b2f:
	xmit	ram_33,ivl		; save return address
	move	r11,dliv

	xmit	00h,r6
x0b32:	xmit	port3,ivr
	move	r6,aux
	add	r3,driv
	xmit	port4,ivr
	move	r4,driv
	xmit	port1,ivr
	xmit	12h,driv[4:0]
	xmit	ram_1c,ivl
	move	r6,aux
	xmit	01h,driv[2]
	xmit	1fh,driv[4:0]
	xmit	port3,ivr
	add	sliv,driv
	xmit	ram_1d,ivl
	xmit	port4,ivr
	move	ovf,aux
	add	sliv,driv
	xmit	ram_1e,ivl
	xmit	port5,ivr
	move	ovf,aux
	add	sliv,driv
	xmit	01h,aux
	add	r6,r6
	xmit	port1,ivr
	xmit	0dh,driv[4:0]
	xmit	ram_02,ivl
	xmit	00h,dliv
	xmit	ram_03,ivl
	xmit	00h,dliv
x0b4f:	xmit	dip_sw,ivr
	move	sriv[7],aux
	nzt	aux,x0b5f
	xmit	01h,aux
	xmit	ram_02,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_03,ivl
	add	sliv,dliv
	call	sub_0676	; ret 71h
	nzt	ovf,x0b5c
	jmp	x0b4f

x0b5c:	xmit	66h,r1
	call	sub_0c83	; ret 72h
x0b5f:	xmit	port1,ivr
	xmit	01h,driv[4]
	xmit	1fh,driv[4:0]
	xmit	ram_24,ivl
	xmit	01h,aux
	add	sliv,dliv
	nzt	ovf,x0b67
	jmp	x0b32

x0b67:	move	r6,aux
	xmit	ram_1c,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_1d,ivl
	add	sliv,dliv
	move	ovf,aux
	xmit	ram_1e,ivl
	add	sliv,dliv
	jmp	x0cd9

	return

x0b72:	xmit	00h,dliv[5]
	return

x0b74:	xmit	ram_36,ivl
	move	sliv[5],aux
	nzt	aux,x0b72

sub_0b77:
	xmit	ram_1f,ivl
	xmit	port4,ivr
	move	sliv,driv
	xmit	ram_20,ivl
	xmit	port3,ivr
	move	sliv,driv

sub_0b7d:
	xmit	80h,r1

sub_0b7e:
	xmit	ram_33,ivl		; save return address
	move	r11,dliv

	xmit	ram_03,ivl
	move	r1,dliv
x0b82:	xmit	ram_02,ivl
	xmit	00h,dliv
	xmit	port1,ivr
	xmit	12h,driv[4:0]
x0b86:	xmit	port6,ivr
	xmit	3ch,aux
x0b88:	and	sriv,r1
	xmit	34h,aux
	xor	r1,r1
	nzt	r1,x0b8d
	jmp	x0b94

x0b8d:	xmit	01h,aux
	add	sliv,dliv
	nzt	ovf,x0b91
	jmp	x0b86

x0b91:	xmit	43h,r1
	xmit	0fh,r11		; XXX non-standard use of r11
	jmp	x0b86

x0b94:	call	sub_0ac8	; ret 73h
	xmit	port7,ivr
	xmit	00h,driv[4]
	xmit	port3,ivr
	xmit	01h,aux
	add	sriv,driv
	xmit	ram_02,ivl
	xmit	00h,dliv
x0b9d:	xmit	port6,ivr
	move	sriv[3],r1
	nzt	r1,x0ba6
	add	sliv,dliv
	nzt	ovf,x0ba3
	jmp	x0b9d

x0ba3:	xmit	43h,r1
	call	sub_0c83	; ret 74h
x0ba6:	xmit	port7,ivr
	xmit	7fh,aux
	move	aux,driv
	xmit	0ffh,aux
	xmit	ram_03,ivl
	add	sliv,dliv
	move	sliv,aux
	nzt	aux,x0b82
	xmit	ram_35,ivl
	move	sliv[1],aux
	nzt	aux,x0bb2
	jmp	sub_0bb4

x0bb2:	jmp	x0cd9

	return			; inserted automatically by MCCAP


sub_0bb4:
	xmit	ram_33,ivl		; restore return address
	move	sliv,r11

sub_0bb6:
	xmit	port1,ivr
	xmit	1fh,driv[4:0]
	xmit	port6,ivr
	move	sriv[6],aux
	nzt	aux,x0bbc
	jmp	x0bbd

x0bbc:	jmp	x0c00

x0bbd:	xmit	ram_02,ivl
	xmit	00h,dliv
	xmit	ram_2f,ivl
	xmit	00h,dliv
	xmit	ram_30,ivl
	xmit	0c0h,aux
	move	aux,dliv
	xmit	ram_03,ivl
	xmit	06h,aux
	move	aux,dliv
x0bc7:	xmit	port6,ivr
	move	sriv[3],aux
	nzt	aux,x0bcb
	jmp	x0bdb

x0bcb:	move	sriv[6],aux
	nzt	aux,x0bbc
	xmit	ram_02,ivl
	xmit	01h,aux
	add	sliv,dliv
	xmit	ram_2f,ivl
	move	ovf,aux
	add	sliv,dliv
	xmit	ram_30,ivl
	move	ovf,aux
	add	sliv,dliv
	nzt	ovf,x0bd8
	jmp	x0bc7

x0bd8:	xmit	43h,r1
	call	sub_0c83	; ret 75h
x0bdb:	move	sriv[2],aux
	add	sriv[5:3],r1
	xmit	07h,aux
	xor	r1,r1
	xec	x0be3,r1
x0be0:	xmit	64h,r1
	call	sub_0c83	; ret 76h

; xec table
x0be3:	jmp	x0b74
	jmp	x0a66
	jmp	x09df
	jmp	x0a14
	jmp	x0be0
	jmp	x0be0
	jmp	x0be0
	jmp	x0a14

; XXX start of unreachable code, presumed garbage
	jmp	0c00h
	xmit	host6,ivr
	move	sriv,aux
	jmp	0c00h
	move	sriv[6],aux
	nzt	aux,0bdch
	xmit	ram_02,ivl
	xmit	01h,aux
	add	sliv,dliv
	xmit	ram_2f,ivl
	move	ovf,aux
	add	sliv,dliv
	xmit	ram_30,ivl
	move	ovf,aux
	add	sliv,dliv
	nzt	ovf,0bfch
	jmp	0bebh
	xmit	43h,r1
	xmit	05h,r11
	jmp	0b89h
	move	sriv[2],aux
; XXX end of unreachable code, presumed garbage


	align	0100h

x0c00:	xmit	ram_04,ivl
	xmit	02h,aux
	xor	sliv,aux
	nzt	aux,x0c1d
	xmit	0ffh,aux
	add	sliv,r2
	xmit	10h,aux
	add	r2,r3
	move	r3,ivl
	xmit	0ffh,aux
	xor	sliv,aux
	nzt	aux,x0c16
	xmit	0ffh,aux
	add	r3,ivl
	move	sliv[1],aux
	nzt	aux,x0c1c
	xmit	ram_36,ivl
	move	sliv[3],aux
	nzt	aux,x0c14
	jmp	x0482

x0c14:	call	sub_0c1f	; ret 77h
x0c16:	xmit	ram_36,ivl
	move	sliv[0],aux
	nzt	aux,x0c1b
	call	sub_0c1f	; ret 78h
x0c1b:	jmp	x0482

x0c1c:	return

x0c1d:	call	sub_0c1f	; ret 79h

sub_0c1f:
	xmit	ram_36,ivl
	xmit	01h,aux
	xor	sliv[3],aux
	nzt	aux,x0c24
	jmp	x0c28

x0c24:	xmit	host6,ivr
	move	sriv,aux
	nzt	aux,x0c6c
	move	r11,driv
x0c28:	xmit	ram_02,ivl
	xmit	00h,dliv
	xmit	ram_25,ivl
	xmit	00h,dliv
x0c2c:	xmit	port6,ivr
	move	sriv[6],aux
	nzt	aux,x0c53
	xmit	port7,ivr
	xmit	00h,driv[4]
	xmit	ram_03,ivl
	xmit	00h,dliv
	xmit	01h,aux
x0c34:	xmit	ram_02,ivl
	add	sliv,dliv
	nzt	ovf,x0c44
x0c37:	xmit	port6,ivr
	move	sriv[3],aux
	nzt	aux,x0c3e
	xmit	ram_03,ivl
	add	sliv,dliv
	nzt	ovf,x0c37
	jmp	x0c34

x0c3e:	xmit	port7,ivr
	xmit	01h,driv[4]
	xmit	0fbh,r1
x0c41:	add	r1,r1
	nzt	ovf,x0c2c
	jmp	x0c41

x0c44:	xmit	ram_25,ivl
	move	sliv,aux
	nzt	aux,x0c4c
	xmit	01h,dliv[0]
	xmit	ram_02,ivl
	xmit	0f1h,aux
	move	aux,dliv
	jmp	x0c2c

x0c4c:	xmit	01h,aux
	xmit	ram_36,ivl
	xor	sliv[3],aux
	nzt	aux,x0c51
	jmp	x0163

x0c51:	xmit	64h,r1
	jmp	sub_0c7d

x0c53:	xmit	ram_36,ivl
	xmit	01h,aux
	xor	sliv[3],aux
	nzt	aux,x0c58
	jmp	x0163

x0c58:	xmit	ram_24,ivl
	xmit	0fch,aux
	move	aux,dliv
	call	sub_09dc	; ret 7ah
	xmit	ram_36,ivl
	xmit	01h,dliv[5]
	call	sub_0639	; ret 7bh
	xmit	port3,ivr
	xmit	0fch,aux
	move	aux,driv
	xmit	ram_38,ivl
	xmit	41h,aux
	move	aux,dliv
	call	sub_0a6b	; ret 7ch
	xmit	ram_36,ivl
	xmit	00h,dliv[5]
	jmp	sub_0c1f

x0c6c:	xmit	ram_42,ivl
	move	sliv,r1
	xmit	host7,ivr
	move	r1,driv
	nzt	r1,x0c79
x0c71:	xmit	01h,aux
	xmit	00h,r1
	xmit	0feh,r2
x0c74:	add	r1,r1
	nzt	r1,x0c74
	add	r2,r2
	nzt	r2,x0c74
	jmp	x0482

x0c79:	xmit	0e8h,aux
	add	r1,aux		
	nzt	ovf,x0c71
	jmp	x0600


sub_0c7d:
	xmit	hostc,ivr
	move	r1,driv
	xmit	hostb,ivr
	xmit	00h,driv
	call	sub_0c95	; ret 7dh

sub_0c83:
	xmit	ram_36,ivl
	xmit	01h,aux
	xor	sliv[3],aux
	nzt	aux,x0c88
	jmp	x0163

x0c88:	xmit	host6,ivr
	move	r11,driv
	jmp	sub_0c7d

x0c8b:	xmit	host6,ivr
	xmit	0ech,aux
	move	aux,driv
	call	sub_0c91	; ret 7eh
	return


sub_0c91:
	xmit	hostc,ivr
	xmit	00h,driv
	xmit	hostb,ivr
	xmit	00h,driv
sub_0c95:
	xmit	hosta,ivr
	xmit	ram_05,ivl
	xmit	01h,aux
	xor	sliv[4],r1
	move	r1,driv[2]
	xmit	port1,ivr
	xmit	0dfh,aux
	move	aux,driv
	xmit	7fh,aux
	xmit	port7,ivr
	move	aux,driv
	xmit	hostd,ivr
	xmit	00h,driv[7]
	xmit	ram_31,ivl
	xmit	00h,dliv
	xmit	ram_36,ivl
	xmit	00h,dliv[0]
	jmp	x03b8

	return			; inserted automatically by MCCAP


sub_0ca8:
	xmit	ram_33,ivl
	move	r11,dliv
	xmit	ram_04,ivl
	xmit	00h,dliv
	xmit	port7,ivr
	xmit	7fh,aux
	move	aux,driv
	xmit	port6,ivr
	move	sriv[6],aux
	nzt	aux,x0cb5
	xmit	43h,r1
	call	sub_0c83	; ret 7fh
x0cb5:	xmit	port7,ivr
	xmit	01h,driv[7]
	xmit	ram_23,ivl
	xmit	port8,ivr
	move	sliv,driv
	xmit	port7,ivr
	xmit	00h,driv[2]
	xmit	ram_02,ivl
	xmit	00h,dliv
x0cbe:	xmit	port6,ivr
	move	sriv[6],aux
	nzt	aux,x0cc2
	jmp	x0ccd

x0cc2:	xmit	ram_02,ivl
	add	sliv,dliv
	nzt	ovf,x0cc6
	jmp	x0cbe

x0cc6:	xmit	43h,r1
	xmit	ram_36,ivl
	move	sliv[0],aux
	nzt	aux,x0ccc
	call	sub_0c83	; ret 80h
x0ccc:	jmp	x0cbe

x0ccd:	xmit	0ffh,aux
	xmit	port8,ivr
	move	aux,driv
	xmit	7fh,aux
	xmit	port7,ivr
	move	aux,driv
	xmit	port6,ivr
	move	sriv[4],aux
	nzt	aux,x0ccd
	call	sub_0bb4	; ret 81h
	return

x0cd9:	xmit	ram_33,ivl
	jmp	x0cdc

x0cdb:	xmit	ram_34,ivl
x0cdc:	move	sliv,r11
	return


; XXX start of unreachable code, presumed garbage
	xmit	00h,r6
	xmit	port3,ivr
	move	r6,aux
	add	r3,driv
	xmit	port4,ivr
	move	r4,driv
	xmit	port1,ivr
	xmit	12h,driv[4:0]
	xmit	ram_1c,ivl
	move	r6,aux
	xmit	01h,driv[2]
	xmit	1fh,driv[4:0]
	xmit	port3,ivr
	add	sliv,driv
	xmit	ram_1d,ivl
	xmit	port4,ivr
	move	ovf,aux
	add	sliv,driv
	xmit	ram_1e,ivl
	xmit	port5,ivr
	move	ovf,aux
	add	sliv,driv
	xmit	01h,aux
	add	r6,r6
	xmit	port1,ivr
	xmit	0dh,driv[4:0]
	xmit	ram_02,ivl
	xmit	00h,dliv
	xmit	ram_03,ivl
	xmit	00h,dliv
	xmit	dip_sw,ivr
	move	sriv[7],aux
	jmp	00d2h
	xmit	01h,aux
; XXX end of unreachable code, presumed garbage

	align	0100h

; return table here
