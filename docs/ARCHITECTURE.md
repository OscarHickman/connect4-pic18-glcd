# Assembly Code Architecture

## Module Overview

### Main.asm - Program Entry and Control Flow

**Purpose**: Main program initialization and game loop

**Key Functions**:
- `start`: Entry point, calls initialization
- `Initialisation`: Resets all game state variables
- `Connect4loop`: Main game loop

**Global Variables**:
- `go`: Player turn flag (0x00 or 0x01)
- `active_go`: Active player for win detection (0x02 or 0x03)
- `fill_1` through `fill_7`: Column fill counters (0-6)
- `fsr`: Temporary calculation register

**Loop Structure**:
```
start → Initialisation → glcd_grid
  ↓
Connect4loop:
  1. turn (switch player)
  2. Keypad_test (get input)
  3. move (execute move)
  4. won (check winner)
  5. Keypad_reset (clear input)
  ↓
  goto Connect4loop
```

---

### GLCD.asm - Display Driver

**Purpose**: Low-level GLCD control and drawing functions

**Key Functions**:
- `glcd_start_left`: Initialize left half of display
- `glcd_start_right`: Initialize right half of display
- `c_w`: Send command byte to GLCD
- `d_w`: Send data byte to GLCD
- `glcd_grid`: Draw Connect 4 game grid

**GLCD Addressing**:
- X address (page): 0xB8 - 0xBF (8 pages)
- Y address (column): 0x40 - 0x7F (64 columns per half)

**Communication Protocol**:
1. Select chip (CS1 or CS2)
2. Send command/data selection signal
3. Write byte to Port D
4. Pulse enable signal
5. Delay for processing

---

### Keypad.asm - Input Handler

**Purpose**: Matrix keypad scanning and input processing

**Key Functions**:
- `Keypad_test`: Scan keypad and return pressed key
- `Keypad_reset`: Clear keypad state
- `game_reset`: Reset entire game (calls start)

**Scanning Algorithm**:
1. Configure port E for output on rows (0-3)
2. Set rows high, read columns (4-7)
3. Identify which column is low
4. Configure port E for output on columns
5. Set columns high, read rows
6. Identify which row is low
7. Determine key from row-column intersection

**Output**: `key_out` contains column number (1-7)

---

### Moves.asm - Game Logic

**Purpose**: Handle piece placement and board state

**Key Data Structures**:

**Digital Board Array** (42 bytes):
```
squares0 (7 bytes) - Row 0 (bottom)
squares1 (7 bytes) - Row 1
squares2 (7 bytes) - Row 2
squares3 (7 bytes) - Row 3
squares4 (7 bytes) - Row 4
squares5 (7 bytes) - Row 5 (top)
```

Each byte: 0x00 (empty), 0x02 (player 1), 0x03 (player 2)

**Key Functions**:
- `move`: Main move handler, routes to column-specific code
- `fill_square`: Draw piece on GLCD at specified position
- `digital_write`: Update digital board array
- `digital_read`: Read from digital board array
- `init_digital_grid`: Clear all 42 squares to 0x00

**Move Process**:
1. Check `key_out` to determine column
2. Check column fill counter (`fill_1` - `fill_7`)
3. Calculate GLCD coordinates based on row/column
4. Call `fill_square` to draw piece
5. Increment column fill counter
6. Update digital board via `digital_write`
7. Record `last_mov_row` and `last_mov_col`

---

### Turns.asm - Player Management

**Purpose**: Alternate between players and update turn indicators

**Key Functions**:
- `turn`: Switch active player and update display indicators

**Visual Indicators**:
- Two boxes on GLCD (one for each player)
- Filled box = active player
- Empty box = waiting player

**Turn Logic**:
1. Check `go` variable (0x00 or 0x01)
2. Fill appropriate indicator box on GLCD
3. Empty opponent's indicator box
4. Toggle `go` to other player

---

### Winner.asm - Win Condition Detection

**Purpose**: Check all possible win conditions after each move

**Algorithm**: Searches from last placed piece in 8 directions

**Win Directions**:
- **Horizontal**: Right (r), Left (l)
- **Vertical**: Up (u), Down (d)
- **Diagonal Ascending**: Top-right (tr), Bottom-left (bl)
- **Diagonal Descending**: Bottom-right (br), Top-left (tl)

**Detection Process**:

For each direction:
1. Set `target_row` and `target_col` to last move position
2. Move one step in direction
3. Call `digital_read` to check piece
4. Compare with `active_go`
5. If match, continue in same direction
6. Count consecutive matches
7. If 4 found, goto `winnerscreen`

**Example**: Bottom-right diagonal check
```
br1: Check 1 step bottom-right
br2: Check 2 steps bottom-right
br3: Check 3 steps bottom-right (if 3 match, win!)
br4: Check 1 step top-left (to find 4th in sequence)
```

**Optimization**: 
- Stops at first mismatch in each direction
- Uses bidirectional search (e.g., br + tl) to find 4 in a row

---

## Memory Map

### Access RAM (acs0 section)

```
Address   Variable       Size    Purpose
----------------------------------------------
0x00      go             1       Current player (0/1)
0x01      active_go      1       Player for win detect (2/3)
0x02      fill_1         1       Column 1 fill level
0x03      fill_2         1       Column 2 fill level
0x04      fill_3         1       Column 3 fill level
0x05      fill_4         1       Column 4 fill level
0x06      fill_5         1       Column 5 fill level
0x07      fill_6         1       Column 6 fill level
0x08      fill_7         1       Column 7 fill level
0x09      key_out        1       Keypad output (1-7)
...       squares0       7       Board row 0
...       squares1       7       Board row 1
...       squares2       7       Board row 2
...       squares3       7       Board row 3
...       squares4       7       Board row 4
...       squares5       7       Board row 5
...       target_row     1       Current target row
...       target_col     1       Current target column
...       last_mov_row   1       Last move row
...       last_mov_col   1       Last move column
```

---

## Code Flow Diagram

```
Power On
  ↓
start
  ↓
Initialisation
  - Clear all variables
  - Set active_go = 0x02
  - Init digital grid
  ↓
glcd_grid
  - Draw game board
  ↓
Connect4loop ←──────────┐
  ↓                     │
turn                    │
  - Update indicators   │
  ↓                     │
Keypad_test             │
  - Scan keypad         │
  - Set key_out         │
  ↓                     │
move                    │
  - Check column        │
  - Draw piece          │
  - Update digital      │
  ↓                     │
won                     │
  - Check all directions│
  - If win: winnerscreen│
  ↓                     │
Keypad_reset            │
  - Clear input         │
  ↓                     │
  ──────────────────────┘
```

---

## Timing Considerations

### GLCD Operations
- Command/data writes require ~1μs delay
- Display updates are not atomic (visible drawing)

### Keypad Scanning
- Debounce delay via `LCD_delay_x4us`
- Typical scan: ~10ms per complete cycle

### Game Loop
- Non-blocking (continuous polling)
- Response time: <50ms typical

---

## Registers and Ports Usage

| Port | Direction | Purpose |
|------|-----------|---------|
| TRISB | Output | GLCD control (CS1, CS2, RST) |
| TRISD | Output | GLCD data bus |
| TRISE | Bidirectional | Keypad rows/columns |
| TRISJ | Mixed | Additional I/O |

---

## Future Enhancements

### Possible Optimizations
1. **Smarter Win Detection**: Only check newly possible wins
2. **Display Buffering**: Update off-screen, then refresh
3. **Move Validation**: Prevent moves to full columns
4. **Undo Function**: Stack-based move history

### Feature Additions
1. **AI Opponent**: Minimax algorithm with alpha-beta pruning
2. **Game Statistics**: Track wins via UART/external memory
3. **Animations**: Piece drop animation
4. **Sound**: Buzzer for events

---

## Debugging Tips

1. **Display Issues**: Check CS1/CS2 selection in `glcd_start_*`
2. **Input Problems**: Verify PADCFG1 pull-up configuration
3. **Win Detection**: Add breakpoints in `won` function
4. **Memory Corruption**: Verify FSR pointer operations
5. **Timing Issues**: Increase delay values if unreliable

---

For specific implementation details, refer to inline comments in each .asm file.
