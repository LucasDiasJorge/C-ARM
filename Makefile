# Define the cross-compiler
CC = arm-linux-gnueabihf-gcc
CFLAGS = -Wall

# Source and Build Directories
SRCDIR = src
BUILDDIR = build

# Target Binary
TARGET = $(BUILDDIR)/hello_arm

# Files
SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(SRC:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)

# Build rules
all: $(TARGET)

$(TARGET): $(OBJ)
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean the build directory
clean:
	rm -rf $(BUILDDIR)/*
