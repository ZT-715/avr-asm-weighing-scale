.def ad_read_flag = r25
.def ADH = r3
.def ADL = r2

.equ input_pin_C = 0

;avcc vs. pinc and right alingned output
.equ ADMUX_config = (0<<refs1)|(1<<refs0)|(0<<adlar)|input_pin_C

; start AD | enable AD | automatic trigger enable | Interrupt Enable
.equ ADCSRA_config  = (1<<ADSC)|(1<<ADEN)|(1<<ADATE)|(1<<ADIE)| \
                      (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0)

.equ ADCSRB_config = (1<<ADTS2)|(0<<ADTS1)|(0<<ADTS0)
.cseg

AD_config:
    cbi DDRC, input_pin_C
    cbi PORTC, input_pin_C

    ldi r16, ADMUX_config
    sts ADMUX, r16
    
    ldi r16, ADCSRA_config
    sts ADCSRA, r16
   
    ldi r16, ADCSRB_config
    sts ADCSRB, r16
ret

AD_read:
    cli

    lds r16, ADCSRA
    ori r16, (1<<ADSC)
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
    
    sei
ret

ADC_isr:
    sbrs ad_read_flag, 0
    lds ADL, ADCL
    sbrs ad_read_flag, 0
    lds ADH, ADCH
    
    ldi ad_read_flag, 0xff
reti