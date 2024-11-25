# Number System Calculator in ARM64 Assembly

A versatile calculator program written in ARM64 Assembly language for Apple Silicon processors (M1/M2). This calculator supports multiple number systems and basic arithmetic operations.

## Features

- Supports multiple number systems:
  - Decimal (Base 10)
  - Binary (Base 2)
  - Hexadecimal (Base 16)
  - Octal (Base 8)

- Basic arithmetic operations:
  - Addition (+)
  - Subtraction (-)
  - Multiplication (*)
  - Division (/)

- Input validation for all number systems
- Results displayed in all supported number systems
- Case-insensitive hexadecimal input (both 'a'-'f' and 'A'-'F' accepted)
- Division by zero error handling
- Clean exit option

## Requirements

- macOS with Apple Silicon processor (M1/M2)
- Xcode Command Line Tools

## Installation

1. Install Xcode Command Line Tools if not already installed:
```bash
xcode-select --install
```

2. Clone or download this repository

## Building and Running

### Using Make (Recommended)

1. To build and run in one command:
```bash
make run
```

2. To only build:
```bash
make
```

3. To clean compiled files:
```bash
make clean
```

### Manual Compilation

If you prefer not to use Make, you can compile manually:

1. Assemble the source:
```bash
as -o converter.o converter.s
```

2. Link the object file:
```bash
ld -o converter converter.o -lSystem -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -e _start -arch arm64
```

3. Run the program:
```bash
./converter
```

## Usage Instructions

1. Select a number system (1-5):
   - 1: Decimal (0-9)
   - 2: Binary (0-1)
   - 3: Hexadecimal (0-9, A-F)
   - 4: Octal (0-7)
   - 5: Exit

2. Enter your first number in the chosen number system

3. Select an operation (1-4):
   - 1: Addition (+)
   - 2: Subtraction (-)
   - 3: Multiplication (*)
   - 4: Division (/)

4. Enter your second number in the chosen number system

5. View results in all number systems:
   - Decimal
   - Binary
   - Hexadecimal
   - Octal

## Example Usage

```
Number System Calculator
1. Decimal
2. Binary
3. Hexadecimal
4. Octal
5. Exit

Select number system (1-5): 3
Enter first number: A
Select operation (1-4): 1
Enter second number: F

Results:
Result in chosen base: 19
Decimal: 25
Binary: 11001
Hexadecimal: 19
Octal: 31
```

## Error Handling

- Invalid number system selection: Prompts for valid input (1-5)
- Invalid operation selection: Prompts for valid input (1-4)
- Invalid digits for chosen base: Shows error and asks for input again
- Division by zero: Shows error message and returns to start
- Invalid hexadecimal digits: Only accepts 0-9 and A-F (case insensitive)

## Technical Details

- Written in ARM64 assembly for Apple Silicon processors
- Uses macOS system calls
- Optimized for M1/M2 architecture
- Modular design with separate functions for:
  - Input validation
  - Number system conversion
  - Arithmetic operations
  - Result display
