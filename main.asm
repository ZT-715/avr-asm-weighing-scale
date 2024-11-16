.cseg
.org 0x00                
    jmp init          

.org 0x06
    jmp switch_isr  ; PCI2 interrupt service routine
.org 0x034

#include "AD_config.asm"
#include "LCD_control.asm"

init:
;stack_init
    ldi r20, high(RAMEND)
    sts SPH, r20
    ldi r20, low(RAMEND)
    sts SPL, r20

    call LCD_init
    call AD_config

main:
    ldi row, 0
    ldi column, 0
    ldi r20, 0

main_loop:
    cpse select, r20
    call LCD_select

    cpse row_change, r20
    call LCD_row_change

    call AD_read
    
    ldi r16, 0xFF
    cp r16, ADL
    breq write_AD1
    brlt write_AD2

    write_AD1:
        ldi r16, 'A'
        call write_AD
        jmp nx
    write_AD2:
        ldi r16, 'B'
        call write_AD
        jmp nx
    nx:

    mov r16, row
    ldi r17, 8
    call LCD_position_cursor

    sei
    rcall delay_5ms
    cli

    wait_release:
        in r16, PINB
        andi r16, 0b0000_0111
        cpi r16, 0b0000_0111
        brne wait_release

rjmp main_loop

write_AD:
    push r16
    ldi r16, 0
    ldi r17, 7
    call LCD_position_cursor

    pop r16
    call LCD_char

    ret