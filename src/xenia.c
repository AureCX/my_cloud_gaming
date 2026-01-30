#include <stdio.h>
#include <dirent.h>
#include "platform.h"

int open_save_xenia(void) {

    DIR* dir = opendir(XENIA_FP);

    if (dir == NULL) {
        dprintf(2, "Error opening the save folder, please check if the folder exists or if you have entered the right folder path.\n");
        return -1;
    }
    return 0;
}
