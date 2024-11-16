.cseg
.org 0x00                
    jmp init          

.org 0x06
    jmp switch_isr  ; PCI2 interrupt service routine
.org 0x034

#include "LCD_control.asm"

init:
;stack_init
    ldi r20, high(RAMEND)
    sts SPH, r20
    ldi r20, low(RAMEND)
    sts SPL, r20

    call LCD_init

main:
    ldi row, 0
    ldi column, 0
    ldi r20, 0
main_loop:
    cpse select, r20
    call LCD_select

    cpse row_change, r20
    call LCD_row_change

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