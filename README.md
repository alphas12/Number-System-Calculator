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

The project can be built manually without using a Makefile. Here are the steps:

1. Assemble the source:
```bash
as -o converter.o src/converter.s
```

2. Link the object file:
```bash
ld -o converter converter.o -lSystem -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -e _start -arch arm64
```

3. Run the program:
```bash
./converter
```

## Project Structure

```
.
├── src/
│   └── converter.s    # Main assembly source code
├── LICENSE           # MIT License
└── README.md         # This file
```

## Usage

1. Select a number system (1-5):
   - 1: Decimal
   - 2: Binary
   - 3: Hexadecimal
   - 4: Octal
   - 5: Exit

2. Enter your numbers and select an operation (1-4):
   - 1: Addition
   - 2: Subtraction
   - 3: Multiplication
   - 4: Division

3. View the result in all supported number systems

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Acknowledgments

- Built for ARM64 architecture
- Optimized for macOS on Apple Silicon
- Uses native system calls for I/O operations
