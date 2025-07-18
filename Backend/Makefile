# Copyright (c) 2025 Kian Acaster. All rights reserved.
#
# This software is licensed under the MIT License.
# See LICENSE for more information.

CC = gcc
CFLAGS = -Wall -Wextra -std=c11
TARGET = quicknote

.PHONY: all clean

all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(TARGET)
