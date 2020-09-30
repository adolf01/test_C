;
; File generated by cc65 v 2.18 - Git bf4b195
;
	.fopt		compiler,"cc65 v 2.18 - Git bf4b195"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_acia_init
	.import		_acia_putc
	.import		_acia_puts
	.import		_acia_put_newline
	.import		_acia_getc
	.import		_wait
	.import		_spiInit
	.import		_gd_putc
	.import		_gd_backc
	.import		_gd_getc
	.export		_i
	.export		_c
	.export		_main

.segment	"DATA"

_i:
	.word	$0000
_c:
	.byte	$00

.segment	"RODATA"

S0001:
	.byte	$41,$68,$6F,$6A,$20,$73,$76,$65,$74,$65,$2C,$20,$6A,$61,$20,$6A
	.byte	$73,$65,$6D,$20,$50,$72,$6F,$6A,$65,$6B,$74,$36,$35,$20,$53,$50
	.byte	$49,$00
S0002:
	.byte	$41,$20,$6D,$69,$6D,$6F,$63,$68,$6F,$64,$65,$6D,$20,$43,$20,$6A
	.byte	$65,$20,$66,$61,$6A,$6E,$20,$6A,$61,$7A,$79,$6B,$20,$32,$3A,$44
	.byte	$00

; ---------------------------------------------------------------
; int __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

	jsr     _acia_init
	jsr     _wait
	lda     #<(S0001)
	ldx     #>(S0001)
	jsr     _acia_puts
	jsr     _acia_put_newline
	lda     #<(S0002)
	ldx     #>(S0002)
	jsr     _acia_puts
	jsr     _spiInit
	jsr     _wait
	ldx     #$00
	lda     #$14
	jsr     _gd_backc
L0002:	jsr     _acia_getc
	sta     _c
	jsr     _gd_putc
	lda     _c
	jsr     _acia_putc
	jsr     _gd_getc
	sta     _c
	jsr     _acia_putc
	jmp     L0002

.endproc

