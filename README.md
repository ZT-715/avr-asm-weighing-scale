### README for AVR Microcontroller-Based Load Cell System

#### Project Overview
This project demonstrates a microcontroller-based digital weighing system using an **ATMEGA328P**, developed entirely in **AVR-ASM**. The system features:
- Custom-designed PCBs: the ATMEGA328p devboard.
- A 20x4 LCD with 3 configured buttons to show information in kilograms, pounds, and use the tare function.
- High gain amplifier with noise filtes to maximize A/D range and precision, allowind weight measure down to 5 kg with a 30 Kg weight cell, all on the same 7.5V power source of the devboard.

![alt text](https://github.com/ZT-715/avr_asm_weighing_scale/blob/main/Boards.png?raw=true)


#### Key Features
1. **Microcontroller and Programming:**
   - Developed using AVRASM2 assembler within MPLab IDE.
   - Programmed with USB-ASP and custom-designed serial programming connector.
2. **Load Cell Signal Amplification:**
   - Differential output signal amplified with adjustable gain up to 3000 for
     scale adjustment.
   - Offset compensation to overcome amp. op. dead zone around 1V from GND.
4. **ADC Integration:**
   - Full range of 10-bit ADC of the ATMEGA328P.
   - Conversion synchronized with Timer 1 for consistent 1 LCD update per
     second.
   - Filtering implemented as by manufacturer instructions on AVcc to reduce noise.
5. **Weight Calibration and Display:**
   - Linear calibration using tare and gain adjustments.
   - Precise weight display through precomputed lookup tables for kilograms and pounds.

#### System Design Highlights
- All assembly routines segregated into independent files like timer, ADC, and display control routines.
- 2 Custom-designed PCBs, an ATMEGA328P devboard and a instrumental amplifier with noise filtering.
- Even with TARE, the sistem shows "OVRW" indicator for overload scenarios.

![alt text](https://github.com/ZT-715/avr_asm_weighing_scale/blob/main/Final_test.jpg?raw=true)


#### Results and Next Steps
The system accurately measures weights within the defined range and switches between units seamlessly. Future improvements include integrating all components into a single PCB, replacing the LCD with a smaller display, and designing a housing for the system.

#### References
1. [Microchip AVR Microcontroller Hardware Design Considerations](https://ww1.microchip.com/downloads/en/Appnotes/AN2519-AVR-Microcontroller-Hardware-Design-Considerations-00002519B.pdf)
2. [ATMEGA328P Datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf)
3. [AVR Instruction Set Manual](https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-InstructionSet-Manual-DS40002198.pdf)
4. [Load Cell Basics](https://en.wikipedia.org/wiki/Load_cell)
