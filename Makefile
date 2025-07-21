# QuickNoteX Top-Level Makefile
# Automates building, installing, and cleaning the project.

.PHONY: all install clean

# Define installation directories
PREFIX ?= /usr/local
BIN_DIR = $(PREFIX)/bin
SHARE_DIR = $(PREFIX)/share/quicknotex
ROFI_THEMES_DIR = $(PREFIX)/share/rofi/themes

all: build_backend

build_backend:
	$(MAKE) -C src/backend

install:
	@echo "Installing QuickNoteX to $(PREFIX)"
	# Create necessary directories
	mkdir -p $(BIN_DIR)
	mkdir -p $(SHARE_DIR)
	mkdir -p $(ROFI_THEMES_DIR)

	# Install backend executable
	cp src/backend/quicknote $(BIN_DIR)/

	# Install launcher script
	cp src/launcher/launch_quicknotex.sh $(BIN_DIR)/quicknotex-launcher
	chmod +x $(BIN_DIR)/quicknotex-launcher

	# Install default notes file (if it exists)
	if [ -f notes.txt ]; then \
		cp notes.txt $(SHARE_DIR)/notes.txt; \
	fi

	# Install rofi themes
	cp config/rofi_themes/*.rasi $(ROFI_THEMES_DIR)/

	@echo "Installation complete."

clean:
	@echo "Cleaning QuickNoteX build artifacts..."
	$(MAKE) -C src/backend clean
	@echo "Clean complete."

