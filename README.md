### AVR Microcontroller-Based Load Cell System

#### Project Overview and Highlights
This project demonstrates a microcontroller-based digital weighing system using an **ATMEGA328P**, developed entirely in **AVR-ASM**. The system features two custom-designed PCBs:
- ATMEGA328p devboard: 20x4 LCD, 3 buttons to show information in kilograms, pounds, and use the tare function, A/D AVcc filter, and an ICSP (In-Circuit Serial Programming).
- High-gain instrumental amplifier: allows weight measurement down to 5 kg ± 5g with a 30 Kg weight cell on the same 7.5V power source as the devboard, with noise filters to maximize A/D range and precision.
- All assembly routines are structured into independent files like timer, ADC, and display control routines.
- Even with TARE, the system shows "OVRW" indicator for overload scenarios.

![alt text](https://github.com/ZT-715/avr_asm_weighing_scale/blob/main/Boards.png?raw=true)


#### Key Features
1. **Microcontroller and Programming:**
   - Developed using AVRASM2 assembler within MPLab IDE.
   - Programmed with USB-ASP and serial programming connector.
2. **Weight Calibration and Display:**
   - Linear calibration using the TARE button on the devboard and gain adjustments on the amplifier.
   - Precise weight display through precomputed lookup tables for kilograms and pounds.
3. **ADC Integration:**
   - 80%  range of 10-bit ADC of the ATMEGA328P (1-5 volts).
   - Conversion synchronized with Timer 1 for consistent 1 LCD update per
     second.
   - Filtering implemented as per manufacturer instructions on AVcc to reduce noise.
4. **Load Cell Signal Amplification:**
   - Differential output signal amplified with adjustable gain up to 3000 for
     scale adjustment.
   - Offset compensation to overcome amp. op. dead zone around 1V from GND.


#### Results and Next Steps
![alt text](https://github.com/ZT-715/avr_asm_weighing_scale/blob/main/Final_test.jpg?raw=true)

The system accurately measures weights within the defined range and seamlessly switches between lbs and kgs.
Future improvements include integrating all components into a single PCB, replacing the LCD with a smaller display, and designing a housing for the system. The system may also be battery-powered with efficient use of the ATMEGA328P's sleep states.

#### References
1. [Microchip AVR Microcontroller Hardware Design Considerations](https://ww1.microchip.com/downloads/en/Appnotes/AN2519-AVR-Microcontroller-Hardware-Design-Considerations-00002519B.pdf)
2. [ATMEGA328P Datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf)
3. [AVR Instruction Set Manual](https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-InstructionSet-Manual-DS40002198.pdf)
4. [Load Cell Basics](https://en.wikipedia.org/wiki/Load_cell)
