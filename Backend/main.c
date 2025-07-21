/*
 * Copyright (c) 2025 Kian Acaster. All rights reserved.
 *
 * This software is licensed under the MIT License.
 * See LICENSE for more information.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_NOTE_LENGTH 1024
#define NOTES_FILE "../notes/notes.txt"

void open_notes() {
    FILE *file = fopen(NOTES_FILE, "r");
    if (file == NULL) {
        perror("Error opening notes.txt");
        return;
    }
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
    fclose(file);
}

void add_note(const char *note) {
    FILE *file = fopen(NOTES_FILE, "a");
    if (file == NULL) {
        perror("Failed to open notes.txt");
        exit(EXIT_FAILURE);
    }
    fprintf(file, "%s\n", note);
    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return 1;
    }

    if (strcmp(argv[1], "/open") == 0) {
        open_notes();
    } else {
        add_note(argv[1]);
    }

    return 0;
}
