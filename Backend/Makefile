CC = gcc
CFLAGS = -Wall -Wextra -std=c11
TARGET = quicknote

.PHONY: all clean

all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(TARGET)
