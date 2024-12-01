.equ TCCR1A_config = 0                  ; Normal mode
.equ TCCR1B_config = (1 << CS12)        ; Prescaler = 256
.equ TIMSK1_config = (1 << TOIE1)       ; overflow interrupt

; Timer1 Configuration Routine
timer1_config:
    ldi r16, TCCR1A_config
    sts TCCR1A, r16                    

    ldi r16, TCCR1B_config
    sts TCCR1B, r16                    

    ldi r16, TIMSK1_config
    sts TIMSK1, r16                    

    clr r16                            
    sts TCNT1H, r16
    sts TCNT1L, r16

    ret                                

TOV1_isr:
    reti                               
