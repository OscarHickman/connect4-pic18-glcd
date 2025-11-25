# Connect 4 GLCD - Assembly Implementation

A hardware implementation of the classic Connect 4 game written in PIC18F87K22 assembly language, featuring a graphical LCD (GLCD) display and keypad input.

## 🎮 Overview

This project implements a fully functional Connect 4 game on a PIC18F87K22 microcontroller with a graphical LCD display. Two players can compete against each other using a keypad to select columns and drop their pieces into the 7x6 game grid.

## 🔧 Hardware Requirements

- **Microcontroller**: PIC18F87K22
- **Display**: Graphical LCD (GLCD) with dual controller (left/right half)
- **Input**: 4x4 Matrix Keypad
- **Clock**: HS oscillator (4 MHz - 16 MHz) with PLL x4
- **Power**: Standard 5V supply

### Pin Configuration

- **Port B**: GLCD control signals (RB0: CS1, RB1: CS2, RB5: RST)
- **Port D**: GLCD data bus
- **Port E**: Keypad interface (rows 0-3, columns 4-7)
- **Port J**: Additional I/O

## 📁 Project Structure

```
connect4_glcd/
├── Main.asm              # Main program loop and initialization
├── config.asm            # PIC18F87K22 configuration bits
├── GLCD.asm              # GLCD driver and display functions
├── Keypad.asm            # Keypad scanning and input handling
├── Moves.asm             # Game move logic and board updates
├── Turns.asm             # Player turn management
├── Winner.asm            # Win condition detection algorithms
├── LCD.asm               # LCD helper functions
├── LED.asm               # LED control (if applicable)
├── UART.asm              # Serial communication (if applicable)
├── External Memory.asm   # External memory management
└── Other.asm             # Utility functions
```

## 🎯 How It Works

### Game Flow

1. **Initialization** (`Main.asm`)
   - Clears all game variables
   - Initializes column fill counters (fill_1 through fill_7)
   - Sets up the digital grid representation
   - Displays initial game grid on GLCD

2. **Main Game Loop** (`Connect4loop`)
   ```
   turn → Keypad_test → move → won → Keypad_reset → repeat
   ```

### Core Components

#### 1. Display Driver (`GLCD.asm`)
- Controls a dual-controller GLCD (left and right halves)
- Functions:
  - `glcd_start_left`: Initialize left half of display
  - `glcd_start_right`: Initialize right half of display
  - `c_w`: Send command to GLCD
  - `d_w`: Send data to GLCD
  - `glcd_grid`: Draw the Connect 4 game grid

#### 2. Input Handling (`Keypad.asm`)
- Scans a 4x4 matrix keypad
- Maps keys 1-7 to the seven game columns
- Debouncing and input validation
- `Keypad_test`: Reads column selection from player
- `Keypad_reset`: Clears keypad state

#### 3. Game Logic (`Moves.asm`)
- Manages the game board state
- Two representations:
  - **Physical**: Updates GLCD display
  - **Digital**: 42-byte array (squares0-squares5) tracking pieces
- Column tracking: Maintains fill level for each of 7 columns
- Piece placement:
  - Validates column isn't full
  - Drops piece to lowest available row
  - Updates both visual and digital representations

#### 4. Turn Management (`Turns.asm`)
- Alternates between two players
- Visual indicators:
  - Player 1: "Naughts" indicator box
  - Player 2: "Crosses" indicator box
- `go` variable: 0x00 for player 1, 0x01 for player 2
- `active_go`: 0x02 for player 1, 0x03 for player 2 (used in detection)

#### 5. Win Detection (`Winner.asm`)
- Checks all win conditions after each move:
  - **Horizontal**: 4 in a row
  - **Vertical**: 4 in a column
  - **Diagonal**: 4 in ascending/descending diagonals
- Algorithm:
  - Starts from last placed piece
  - Searches in 8 directions
  - Counts consecutive matching pieces
  - Displays winner screen when condition met

### Memory Organization

#### Access RAM Variables (`acs0` section)
- `go`: Current player turn flag
- `active_go`: Active player identifier for win detection
- `fill_1` to `fill_7`: Number of pieces in each column (0-6)
- `squares0` to `squares5`: Digital representation of 42 game squares
  - 0x00: Empty
  - 0x02: Player 1 piece
  - 0x03: Player 2 piece
- `key_out`: Selected column from keypad (1-7)
- `target_row`, `target_col`: Current position for operations
- `last_mov_row`, `last_mov_col`: Position of last placed piece

### Display Coordinates

The GLCD uses X (page) and Y (column) addressing:
- X address: 0xB8 to 0xBF (8 pages)
- Y address: 0x40 to 0x7F (64 columns per half)
- Grid spacing calculated for 7 columns × 6 rows

## 🚀 Building and Programming

### Prerequisites

- MPLAB X IDE
- MPASM Assembler
- PICkit 3/4 or compatible programmer

### Build Steps

1. Open project in MPLAB X IDE
2. Set PIC18F87K22 as target device
3. Build project (Production → Build)
4. Program device using programmer

### Configuration

The `config.asm` file contains all configuration bits:
- **Oscillator**: HS with PLL (4x multiplier)
- **Watchdog**: Disabled in software
- **Code Protection**: Disabled
- **Extended Instruction Set**: Disabled

## 🎲 Playing the Game

1. Power on the system
2. Game grid appears on GLCD
3. Player 1's turn indicator lights up
4. Press keys 1-7 on keypad to select column
5. Piece drops to lowest available position
6. Turn switches to Player 2
7. Continue until a player gets 4 in a row or board fills
8. Winner screen displays the winning player

## 🔍 Technical Details

### GLCD Communication Protocol

- **Control Pins**:
  - CS1/CS2: Chip select for left/right half
  - RST: Reset signal (active high)
  - R/W: Read/Write control
  - D/I: Data/Instruction select
  
- **Data Transfer**:
  - 8-bit parallel data on Port D
  - Command/Data differentiation via control pins
  - Timing delays ensure proper operation

### Keypad Matrix Scanning

- **Technique**: Row-column scanning
- **Process**:
  1. Set columns high, read rows
  2. Set rows high, read columns
  3. Determine pressed key from intersection
- **Pull-up resistors**: Enabled via PADCFG1 register

## 📝 Notes

- Game supports 2 players only (no AI opponent)
- No undo functionality
- Board reset requires system restart or game reset function
- Maximum 42 moves per game (7 columns × 6 rows)

## 🛠️ Potential Enhancements

- Add LCD status messages
- Implement UART for score tracking
- Add sound effects via buzzer
- Create game reset button without power cycle
- Implement difficulty levels with AI opponent

## 📄 License

This project is open source. Feel free to use, modify, and distribute.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## 👨‍💻 Author

Created as an embedded systems project demonstrating low-level hardware control and game logic implementation in assembly language.

---