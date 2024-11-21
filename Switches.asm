.def switch_toggled = r23
.cseg

switch_config:
    lds r16, PORTB
    lds r17, DDRB
    
    ori r16, 0b0000_0111       ; pull-ups
    andi r17, 0b1111_1000      ; inputs
    
    sts PORTB, r16
    sts DDRB, r17

;PINB interrupts for switches

    ; PCI for PORTB
    ldi r16, (1 << PCIE0) 
    sts PCICR , r16

    ldi r16, (1 << PCINT0) | (1 << PCINT1) | (1 << PCINT2) 
    sts PCMSK0, r16

ret

switch_isr:
    in r18, PINB         

    ; catches only the first source
    sbrc r18, 7
    reti

; Check each pin
    sbrs r18, 0          
    ori switch_toggled, 0b1000_0001

    sbrs r18, 1          
    ori switch_toggled, 0b1000_0010

    sbrs r18, 2          
    ori switch_toggled, 0b1000_0100

reti





