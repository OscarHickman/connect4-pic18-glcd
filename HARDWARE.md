# Hardware Wiring Guide

## Component Connections

### GLCD (Graphical LCD)

| GLCD Pin | PIC18F87K22 Pin | Function |
|----------|-----------------|----------|
| DB0-DB7  | RD0-RD7        | Data Bus (8-bit) |
| CS1      | RB0            | Chip Select 1 (Left half) |
| CS2      | RB1            | Chip Select 2 (Right half) |
| RST      | RB5            | Reset (Active High) |
| R/W      | TBD            | Read/Write control |
| D/I      | TBD            | Data/Instruction select |
| E        | TBD            | Enable signal |
| VDD      | +5V            | Power supply |
| VSS      | GND            | Ground |

### 4x4 Matrix Keypad

| Keypad | PIC18F87K22 Pin | Function |
|--------|-----------------|----------|
| Row 0  | RE0            | Keypad Row 0 (Keys 1,2,3,A) |
| Row 1  | RE1            | Keypad Row 1 (Keys 4,5,6,B) |
| Row 2  | RE2            | Keypad Row 2 (Keys 7,8,9,C) |
| Row 3  | RE3            | Keypad Row 3 (Keys *,0,#,D) |
| Col 0  | RE4            | Keypad Column 0 |
| Col 1  | RE5            | Keypad Column 1 |
| Col 2  | RE6            | Keypad Column 2 |
| Col 3  | RE7            | Keypad Column 3 |

#### Keypad Layout

```
┌───┬───┬───┬───┐
│ 1 │ 2 │ 3 │ A │
├───┼───┼───┼───┤
│ 4 │ 5 │ 6 │ B │
├───┼───┼───┼───┤
│ 7 │ 8 │ 9 │ C │
├───┼───┼───┼───┤
│ * │ 0 │ # │ D │
└───┴───┴───┴───┘
```

**Game Usage**: Keys 1-7 select columns in Connect 4

## Power Supply

- **Voltage**: 5V DC
- **Current**: ~200mA (typical)
- **Decoupling**: 100nF capacitor near VDD pins

## Oscillator Configuration

- **Type**: HS (High Speed) Crystal Oscillator
- **Frequency**: 4-16 MHz (with PLL x4 enabled)
- **Pins**: OSC1/OSC2

## Programming Interface

- **ICSP Pins**: PGC, PGD, MCLR, VDD, VSS
- **Programmer**: PICkit 3/4 or compatible

## Notes

- Enable internal pull-ups for keypad (PADCFG1 register)
- GLCD requires proper timing delays for reliable operation
- Ensure all ground connections are common
- Add decoupling capacitors close to IC power pins

## Schematic

For a complete schematic diagram, refer to your hardware design files or contact the project maintainer.
