.equ input_pin_C = 0

;avcc vs. pinc
.equ ADMUX_config = (0<<refs1)|(1<<refs0)|input_pin_C

; start AD | enable AD | automatic enable | enable interrupts |
; divide clock by 128
.equ ADCSRA_config  = (1<<ADSC)|(1<<ADEN)|(1<<ADATE)|(1<<ADIE)| \
                      (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0)
.cseg
; config timer para conversão contínua

AD_config:
    cbi DDRC, input_pin_C
    ldi r16, ADMUX_config
    sts ADMUX, r16
    ldi r16, ADCSRA_config
    sts ADCSRA, r16

AD_isr:
    push r16
    lds r16, ADCL
    mov r2,r16
    lds r16, ADCH
    mov r1, r16
    pop r16
reti
    