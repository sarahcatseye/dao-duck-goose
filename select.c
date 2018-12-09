#include <stdlib.h>
#include "select.h"
#include "myLib.h"
#include "clang.h"
#include "sound.h"
#include "game.h"

int select; 

void initSelect() {
    select = 0;
}

void updateStart() {
    if (BUTTON_PRESSED(BUTTON_RIGHT) && select == 0) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        select += 1;
    }
    if (BUTTON_PRESSED(BUTTON_LEFT) && select == 1) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
    	select -= 1;
    }
}

void drawStart() {
    shadowOAM[0].attr0 = 144 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[0].attr1 = (63 + select * 70) | ATTR1_MEDIUM;
	shadowOAM[0].attr2 = ATTR2_TILEID(20, 16) | ATTR2_PALROW(0);
	DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
}

void updatePause() {
    if (BUTTON_PRESSED(BUTTON_DOWN) && select < 2) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        select += 1;
    }
    if (BUTTON_PRESSED(BUTTON_UP) && select > 0) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        select -= 1;        
    }
}

void drawPause() {
    shadowOAM[0].attr0 = (48 + select * 11) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[0].attr1 = 45 | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(20, 20) | ATTR2_PALROW(0);
    DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
}