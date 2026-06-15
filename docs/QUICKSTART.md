# Quick Start Guide

Get up and running with Connect 4 GLCD in minutes!

## 🚦 Prerequisites Checklist

- [ ] PIC18F87K22 microcontroller
- [ ] Graphical LCD (128x64, dual controller)
- [ ] 4x4 Matrix keypad
- [ ] MPLAB X IDE installed
- [ ] MPASM assembler installed
- [ ] PICkit 3/4 programmer
- [ ] 5V power supply
- [ ] Breadboard and jumper wires

## ⚡ Quick Setup (5 Steps)

### 1. Hardware Assembly

Connect your components according to the pin configuration:

**GLCD** → Port B (control) + Port D (data)
**Keypad** → Port E (rows 0-3, cols 4-7)

> 📖 See [HARDWARE.md](HARDWARE.md) for detailed wiring

### 2. Open Project

```bash
# Clone or download this repository
cd connect4_glcd

# Open in MPLAB X IDE
# File → Open Project → Select connect4_glcd folder
```

### 3. Configure Programmer

1. Connect PICkit to ICSP pins
2. In MPLAB X: Run → Set Project Configuration → Select your programmer
3. Verify device: PIC18F87K22

### 4. Build & Program

```
1. Click "Clean and Build" (🔨 icon)
2. Click "Make and Program Device" (⬇️ icon)
3. Wait for "Programming complete" message
```

### 5. Play!

1. Power on the board
2. Game grid appears on GLCD
3. Press keys 1-7 to drop pieces
4. First to 4 in a row wins!

## 🎮 Game Controls

| Key | Function |
|-----|----------|
| 1   | Drop piece in column 1 (leftmost) |
| 2   | Drop piece in column 2 |
| 3   | Drop piece in column 3 |
| 4   | Drop piece in column 4 |
| 5   | Drop piece in column 5 |
| 6   | Drop piece in column 6 |
| 7   | Drop piece in column 7 (rightmost) |

> **Note**: Other keypad buttons (0, 8, 9, *, #, A-D) are not used in basic gameplay

## 🐛 Troubleshooting

### Display shows nothing
- ✓ Check GLCD power connections (VDD/VSS)
- ✓ Verify CS1, CS2, RST connections to Port B
- ✓ Check data bus (Port D) wiring
- ✓ Adjust contrast potentiometer on GLCD

### Keypad not responding
- ✓ Enable internal pull-ups (code does this automatically)
- ✓ Verify Port E connections
- ✓ Check keypad for shorts or damage
- ✓ Test with multimeter in continuity mode

### Programming fails
- ✓ Check PICkit connections (PGC, PGD, MCLR, VDD, VSS)
- ✓ Verify correct device selected (PIC18F87K22)
- ✓ Try reducing programming speed in MPLAB X
- ✓ Ensure microcontroller is powered

### Game behaves erratically
- ✓ Check for loose wiring
- ✓ Add decoupling capacitors (100nF near VDD pins)
- ✓ Verify oscillator frequency setting
- ✓ Ensure common ground for all components

## 📚 Learn More

- **Architecture Details**: See [ARCHITECTURE.md](ARCHITECTURE.md)
- **Hardware Specs**: See [HARDWARE.md](HARDWARE.md)
- **Full Documentation**: See [README.md](../README.md)

## 🆘 Still Having Issues?

1. Check the [Issues](https://github.com/YOUR_USERNAME/connect4_glcd/issues) page
2. Create a new issue with:
   - Hardware configuration
   - Error messages
   - Steps to reproduce
   - Photos of setup (if helpful)

## 🎉 Success?

If everything works, consider:
- ⭐ Starring this repository
- 📝 Sharing your build on social media
- 🤝 Contributing improvements

---

**Enjoy your game! May the best player win! 🏆**
