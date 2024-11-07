To cross-compile a C project for an ARM target, you’ll need a cross-compiler (such as `arm-linux-gnueabihf-gcc` for ARM 32-bit hard-float) and a basic C project structure. Here’s an example of a simple C project set up for cross-compiling to ARM architecture.

### Prerequisites
1. Install the ARM cross-compiler toolchain, for example, on Debian-based systems:
   ```bash
   sudo apt-get install gcc-arm-linux-gnueabihf
   ```

2. Verify the installation:
   ```bash
   arm-linux-gnueabihf-gcc --version
   ```

### Project Structure

Create a directory structure for your project:
```plaintext
C-ARM/
├── src
│   └── main.c
├── build
└── Makefile
```

### `main.c` (Your Source Code)

Create `main.c` inside the `src` directory:
```c
#include <stdio.h>

int main() {
    printf("Hello from ARM cross-compiled code!\n");
    return 0;
}
```

### Makefile (Cross-Compiling Setup)

Create a `Makefile` in the root project directory:
```makefile
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
```

### Building the Project

To cross-compile the code, simply run:
```bash
make
```

This will create an ARM executable `hello_arm` in the `build` directory. 

### Running on ARM Device

Transfer the compiled `hello_arm` binary to your ARM device (e.g., Raspberry Pi or Orange Pi) via `scp` or a USB drive. Then, log into your ARM device and run:
```bash
./hello_arm
```

If everything worked correctly, you should see:
```plaintext
Hello from ARM cross-compiled code!
```

This simple setup demonstrates how to structure a C project for cross-compilation targeting ARM, complete with a Makefile for building the executable.