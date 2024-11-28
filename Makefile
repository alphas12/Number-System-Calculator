# Source files
SOURCE = src/converter.s

# Tools
AS = as
LD = ld

# Flags
LDFLAGS = -lSystem -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -e _start -arch arm64

# Target
TARGET = converter

# Default target
all: $(TARGET)

# Link the object file to create the executable
$(TARGET): $(TARGET).o
	$(LD) $(LDFLAGS) -o $@ $<

# Compile the assembly file
$(TARGET).o: $(SOURCE)
	$(AS) -o $@ $<

# Clean up
clean:
	rm -f $(TARGET) $(TARGET).o

# Run the program
run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run
