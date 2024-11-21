.def ADH = r1
.def ADL = r2

.equ input_pin_C = 0

;avcc vs. pinc and right alingned output
.equ ADMUX_config = (0<<refs1)|(1<<refs0)|(1<<adlar)|input_pin_C

; start AD | enable AD | automatic trigger enable
.equ ADCSRA_config  = (0<<ADSC)|(1<<ADEN)|(1<<ADATE)| \
                      (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0)
.cseg

AD_config:
    cbi DDRC, input_pin_C
    cbi PORTC, input_pin_C

    ldi r16, ADMUX_config
    sts ADMUX, r16
    ldi r16, ADCSRA_config
    sts ADCSRA, r16
ret

AD_read:
    lds r16, ADCSRA
    sbr r16, (1<<ADSC)
    sts ADCSRA, r16
    
    wait_AD:
        lds r16, ADCSRA
        sbrs r16, ADIF
        rjmp wait_AD

    lds r16, ADCL
    lds r17, ADCH

    lds r18, ADCSRA
    ori r18, (1<<ADIF)
    sts ADCSRA, r18

ret