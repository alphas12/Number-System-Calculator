.global _start
.align 2

// Data section
.section __DATA,__data
welcome_msg:
    .asciz "\nNumber System Calculator\n1. Decimal\n2. Binary\n3. Hexadecimal\n4. Octal\n5. Exit\n\nSelect number system (1-5): "
input_msg1:
    .asciz "\nEnter first number: "
input_msg2:
    .asciz "\nEnter second number: "
operation_msg:
    .asciz "\nSelect operation:\n1. Addition (+)\n2. Subtraction (-)\n3. Multiplication (*)\n4. Division (/)\nChoice: "
invalid_input:
    .asciz "\nInvalid input for chosen number system! Try again.\n"
result_msg:
    .asciz "\nResults:\n"
chosen_base_msg:
    .asciz "Result in chosen base: "
div_zero_msg:
    .asciz "\nError: Division by zero!\n"
dec_msg:
    .asciz "\nDecimal: "
bin_msg:
    .asciz "\nBinary: "
hex_msg:
    .asciz "\nHexadecimal: "
oct_msg:
    .asciz "\nOctal: "
newline:
    .asciz "\n"
buffer:
    .space 32
result:
    .space 64
debug_base:
    .asciz "\nDebug - Base: "
debug_char:
    .asciz "\nDebug - Char: "
invalid_selection_msg:
    .asciz "\nInvalid selection! Please choose 1-5: "
invalid_operation_msg:
    .asciz "\nInvalid operation! Please choose 1-4: "


