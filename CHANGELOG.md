# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- AI opponent implementation
- Move undo functionality
- Sound effects via buzzer
- Animation for falling pieces
- Game statistics tracking

## [1.0.0] - 2025-11-25

### Added
- Initial public release
- Complete Connect 4 game implementation
- GLCD display driver
- 4x4 keypad input handler
- Two-player gameplay
- Win detection (horizontal, vertical, diagonal)
- Turn indicator system
- Comprehensive documentation:
  - README.md with project overview
  - ARCHITECTURE.md with code structure details
  - HARDWARE.md with wiring guide
  - QUICKSTART.md for rapid setup
  - CONTRIBUTING.md for collaboration
  - PUBLISHING.md for GitHub deployment
- MIT License
- .gitignore for MPLAB X projects

### Technical Details
- Target: PIC18F87K22 microcontroller
- Language: PIC18 Assembly
- Display: 128x64 GLCD with dual controller
- Input: 7-key selection via matrix keypad
- Memory: ~50 bytes RAM for game state

---

## Version History Template

Use this template for future updates:

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- New features

### Changed
- Changes in existing functionality

### Deprecated
- Soon-to-be removed features

### Removed
- Removed features

### Fixed
- Bug fixes

### Security
- Security vulnerability fixes
```

---

## Version Numbering Guide

- **Major (X.0.0)**: Incompatible hardware or major code changes
- **Minor (1.X.0)**: New features, backward compatible
- **Patch (1.0.X)**: Bug fixes, backward compatible

---

[Unreleased]: https://github.com/YOUR_USERNAME/connect4_glcd/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/YOUR_USERNAME/connect4_glcd/releases/tag/v1.0.0
