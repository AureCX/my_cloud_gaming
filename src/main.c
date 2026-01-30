#include <stdio.h>
#include "platform.h"

int main(void)
{
    if (open_save_xenia() == 0)
        puts("CloudSaves skeleton OK");
    return 0;
}
