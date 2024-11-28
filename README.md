# Number System Calculator

![Build](https://github.com/alphas12/Number-System-Calculator/workflows/Build/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A versatile number system calculator written in ARM64 Assembly for macOS, supporting conversions and calculations between different number systems.

## Features

- Support for multiple number systems:
  - Decimal (Base 10)
  - Binary (Base 2)
  - Hexadecimal (Base 16)
  - Octal (Base 8)
- Basic arithmetic operations:
  - Addition
  - Subtraction
  - Multiplication
  - Division
- Input validation
- Real-time conversion between number systems

## Prerequisites

- macOS with Apple Silicon (M1/M2)
- Xcode Command Line Tools

To install Xcode Command Line Tools:
```bash
xcode-select --install
```

## Building

The project uses a Makefile for building. Here are the available commands:

```bash
# Build the calculator
make

# Build and run the calculator
make run

# Clean build files
make clean
```

## Project Structure

```
.
├── src/
│   └── converter.s    # Main assembly source code
├── Makefile          # Build configuration
├── LICENSE           # MIT License
└── README.md         # This file
```

## Usage

1. Build and run the calculator:
```bash
make run
```

2. Select a number system (1-5):
   - 1: Decimal
   - 2: Binary
   - 3: Hexadecimal
   - 4: Octal
   - 5: Exit

3. Enter your numbers and select an operation
4. View the result in all supported number systems

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built for ARM64 architecture
- Optimized for macOS on Apple Silicon
- Uses native system calls for I/O operations
