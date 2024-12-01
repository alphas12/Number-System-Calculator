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
    .asciz "\nSelect operation:\n1. Addition (+)\n2. Subtraction (-)\n3. Multiplication (*)\nChoice: "
invalid_input:
    .asciz "\nInvalid input for chosen number system! Try again.\n"
result_msg:
    .asciz "\nResults:\n"
chosen_base_msg:
    .asciz "Result in chosen base: "
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
    .asciz "\nInvalid operation! Please choose 1-3: "

// Text section
.section __TEXT,__text
_start:
select_system:
    // Display welcome message and get number system
    adrp x0, welcome_msg@PAGE
    add x0, x0, welcome_msg@PAGEOFF
    bl print_string

    // Read base choice
    bl read_input
    sub x19, x0, #48        // Store base in x19 (1-5)

    // Validate base choice
    cmp x19, #1
    b.lt invalid_system
    cmp x19, #5
    b.gt invalid_system
    
    // Check for exit option
    cmp x19, #5
    b.eq exit_program
    b get_first_number

invalid_system:
    adrp x0, invalid_selection_msg@PAGE
    add x0, x0, invalid_selection_msg@PAGEOFF
    bl print_string
    b select_system

get_first_number:
    // Display input message for first number
    adrp x0, input_msg1@PAGE
    add x0, x0, input_msg1@PAGEOFF
    bl print_string

    // Read first number
    bl read_string
    mov x20, x0             // Store input string pointer in x20
    mov x21, x1             // Store length in x21

    // Validate input based on chosen base
    mov x0, x20             // Input string
    mov x1, x21             // Length
    mov x2, x19             // Base choice
    bl validate_input
    cmp x0, #0
    b.eq invalid_first      // If invalid, try again

    // Convert first input to decimal
    mov x0, x20             // Input string
    mov x1, x21             // Length
    mov x2, x19             // Base choice
    bl str_to_int
    mov x22, x0             // Store first number in x22

invalid_first:
    adrp x0, invalid_input@PAGE
    add x0, x0, invalid_input@PAGEOFF
    bl print_string
    b get_first_number      // Retry input for the first number

select_operation:
    // Display operation message
    adrp x0, operation_msg@PAGE
    add x0, x0, operation_msg@PAGEOFF
    bl print_string

    // Read operation choice
    bl read_input
    sub x23, x0, #48        // Store operation in x23

    // Validate operation choice
    cmp x23, #1
    b.lt invalid_operation
    cmp x23, #4
    b.gt invalid_operation
    b get_second_number

invalid_operation:
    adrp x0, invalid_operation_msg@PAGE
    add x0, x0, invalid_operation_msg@PAGEOFF
    bl print_string
    b select_operation

get_second_number:
    // Display input message for second number
    adrp x0, input_msg2@PAGE
    add x0, x0, input_msg2@PAGEOFF
    bl print_string

    // Read second number
    bl read_string
    mov x20, x0             // Reuse x20 for second number
    mov x21, x1             // Reuse x21 for length

    // Validate second input
    mov x0, x20             // Input string
    mov x1, x21             // Length
    mov x2, x19             // Base choice
    bl validate_input
    cmp x0, #0
    b.eq invalid_second     // If invalid, try again

    // Convert second input to decimal
    mov x0, x20             // Input string
    mov x1, x21             // Length
    mov x2, x19             // Base choice
    bl str_to_int
    mov x24, x0             // Store second number in x24

    // Perform operation based on choice in x23
    cmp x23, #1
    b.eq do_addition
    cmp x23, #2
    b.eq do_subtraction
    cmp x23, #3
    b.eq do_multiplication

invalid_second:
    adrp x0, invalid_input@PAGE
    add x0, x0, invalid_input@PAGEOFF
    bl print_string
    b get_second_number     // Retry input for the second number

do_addition:
    add x25, x22, x24
    b show_result

do_subtraction:
    sub x25, x22, x24
    b show_result

 do_multiplication:
    mul x25, x22, x24
    b show_result


show_result:

    // Show in hexadecimal
    adrp x0, hex_msg@PAGE
    add x0, x0, hex_msg@PAGEOFF
    bl print_string
    mov x0, x25
    mov x1, #16
    bl int_to_str
    bl print_string_with_len

    // Show in octal
    adrp x0, oct_msg@PAGE
    add x0, x0, oct_msg@PAGEOFF
    bl print_string
    mov x0, x25
    mov x1, #8
    bl int_to_str
    bl print_string_with_len

    // Display result message
    adrp x0, result_msg@PAGE
    add x0, x0, result_msg@PAGEOFF
    bl print_string

    // Show result in chosen base first
    adrp x0, chosen_base_msg@PAGE
    add x0, x0, chosen_base_msg@PAGEOFF
    bl print_string
    mov x0, x25             // Result to convert
    mov x2, x19             // Original base choice
    bl get_base             // Convert choice to actual base
    mov x1, x0              // Base for conversion
    mov x0, x25             // Result to convert
    bl int_to_str
    bl print_string_with_len

  // Show in decimal
    adrp x0, dec_msg@PAGE
    add x0, x0, dec_msg@PAGEOFF
    bl print_string
    mov x0, x25
    mov x1, #10
    bl int_to_str
    bl print_string_with_len

  //Show in binary
    adrp x0, bin_msg@PAGE
    add x0, x0, bin_msg@PAGEOFF
    bl print_string
    mov x0, x25
    mov x1, #2
    bl int_to_str
    bl print_string_with_len


exit_program:
    mov x0, #0              // Exit code 0
    mov x16, #1             // Exit syscall
    svc #0x80              // Make the system call
