.def tc0_overflow = r25
.equ TCCR0A_config = 0
.equ TCCR0B_config = (1 << CS02)|(0 << CS01)|(1 << CS00)
.equ TIMSK0_config = (1 << TOIE0)

timer0_config:
    ldi r16, TCCR0A_config
    out TCCR0A, r16

    ldi r16, TCCR0B_config
    out TCCR0B, r16

    ldi r16, TIMSK0_config
    sts TIMSK0, r16

OCR0A_isr:
reti

OCR0B_isr:
reti

TOV0_isr:
    ori tc0_overflow, 0xFF
reti