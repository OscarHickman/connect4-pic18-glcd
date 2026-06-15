# Connect 4 GLCD

A hardware implementation of the classic Connect 4 game written in PIC18F87K22 assembly language, featuring dual-controller graphical LCD (GLCD) output and keypad input.

## Hardware Requirements

* **Microcontroller**: PIC18F87K22
* **Display**: 128x64 Graphical LCD (dual-controller KS0108 or compatible)
* **Input**: 4x4 Matrix Keypad
* **Clock Source**: HS oscillator (4 MHz - 16 MHz) with PLL x4 enabled
* **Power**: Standard 5V supply

### Pin Configuration

* **Port B**: GLCD control signals (RB0: CS1, RB1: CS2, RB5: RST)
* **Port D**: GLCD 8-bit parallel data bus (D0-D7)
* **Port E**: Keypad interface (Rows 0-3 on RE0-RE3, Columns 4-7 on RE4-RE7)

---

## Project Structure

```
connect4_glcd/
├── Main.asm              # Program entry point, initialization, and main game loop
├── config.asm            # PIC18F87K22 configuration bits
├── GLCD.asm              # Low-level GLCD controller driver and grid rendering
├── Keypad.asm            # Keypad matrix scanning and input debouncing
├── Moves.asm             # Physical GLCD updates and digital board state logic
├── Turns.asm             # Player turn alternation and visual turn indicators
├── Winner.asm            # Win-condition detection search algorithms
├── LCD.asm               # Character LCD helper routines
├── LED.asm               # Auxiliary status LED control routines
├── UART.asm              # Hardware serial interface routines
├── External Memory.asm   # Routines for interfacing with external memory
└── Other.asm             # Delay loops and miscellaneous utilities
```

---

## Game Architecture

### Data Structures & State
* **`go`**: Turn flag (0x00 for Player 1 / Naughts, 0x01 for Player 2 / Crosses).
* **`active_go`**: Internal player identifier used for win condition analysis (0x02 or 0x03).
* **`fill_1` to `fill_7`**: Row count values tracking the height of pieces in columns 1 to 7.
* **`squares0` to `squares5`**: A digital representation of the 7x6 board (42 bytes total, 0x00 = empty, 0x02 = Player 1, 0x03 = Player 2).

### Logic Flow
1. **Reset / Initialization**: On power-up, registers and RAM are cleared, internal pull-ups are enabled, and the empty grid is drawn on the GLCD.
2. **Game Loop**:
   * Alternates player turns and highlights active player boxes on screen.
   * Polls the keypad via row-column scanning until a valid column choice (keys 1-7) is registered.
   * Verifies the target column is not full, resolves the landing row, and drops the piece.
   * Performs an 8-way directional win scan starting from the coordinate of the newly placed piece.
   * Displays the final winner screen if 4-in-a-row is detected, otherwise loops back to step 1.

---

## Building and Verification

### Building locally with gputils
Compile the assembly files and link the object outputs:

```bash
gpasm -p 18f87k22 -c "Main.asm"
gpasm -p 18f87k22 -c "config.asm"
gpasm -p 18f87k22 -c "GLCD.asm"
gpasm -p 18f87k22 -c "Keypad.asm"
gpasm -p 18f87k22 -c "Moves.asm"
gpasm -p 18f87k22 -c "Turns.asm"
gpasm -p 18f87k22 -c "Winner.asm"
gpasm -p 18f87k22 -c "LCD.asm"
gpasm -p 18f87k22 -c "LED.asm"
gpasm -p 18f87k22 -c "UART.asm"
gpasm -p 18f87k22 -c "External Memory.asm"
gpasm -p 18f87k22 -c "Other.asm"

gplink -p 18f87k22 -m -o connect4.hex \
  Main.o config.o GLCD.o Keypad.o Moves.o Turns.o Winner.o \
  LCD.o LED.o UART.o "External Memory.o" Other.o
```

---

## Planned Enhancements

* **AI Opponent**: Implementation of a single-player mode with basic heuristics.
* **Move Undo**: Support stack-based move history to allow backtracking.
* **Animations**: Add frame-by-frame piece-dropping animations on the GLCD.
* **Audio Feedback**: Integrate buzzer tones for turn swaps, valid drops, and victory states.
* **Soft Reset**: Implement a keypad shortcut to restart the game without power cycling.
* **Score tracking**: Save overall win/loss stats across restarts using external memory.

---

## License

This project is licensed under the MIT License. Contributions and pull requests are welcome.