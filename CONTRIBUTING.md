# Contributing to Connect 4 GLCD

Thank you for your interest in contributing to this project! This document provides guidelines for contributing.

## How to Contribute

### Reporting Issues

- Use the GitHub issue tracker
- Describe the issue clearly with steps to reproduce
- Include hardware setup details if relevant
- Mention the MPLAB X version used

### Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Make your changes
4. Test thoroughly on actual hardware if possible
5. Commit with clear messages (`git commit -am 'Add new feature'`)
6. Push to your branch (`git push origin feature/improvement`)
7. Create a Pull Request

### Code Style

- Follow existing assembly code formatting
- Use meaningful labels and comments
- Document register usage in function headers
- Keep functions focused and modular
- Add comments explaining complex logic

### Testing

- Test on PIC18F87K22 hardware when possible
- Verify all game scenarios:
  - Column fill detection
  - Win conditions (horizontal, vertical, diagonal)
  - Turn switching
  - Display updates
- Check edge cases (full board, invalid inputs)

### Documentation

- Update README.md for new features
- Add inline comments for complex algorithms
- Document pin changes or hardware modifications
- Include wiring diagrams if adding new peripherals

## Development Setup

1. Install MPLAB X IDE
2. Install MPASM assembler
3. Set up PICkit programmer
4. Clone the repository
5. Open project in MPLAB X

## Questions?

Feel free to open an issue for questions or discussions about the project.

Thank you for contributing! 🎮
