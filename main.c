//How to Play:
//Press A to send out a ranged attack and B to send out a close attack.
//When the enemy is resting by their sword, they are vulnerable to an attack.
//To defend from an attack or energy wave, you must press A or B to attack
//and face the direction of the attack.
//The player loses when the enemy attack finishes, or they're hit by an energy wave.
//Finished:
//Enemies now have the most difficult to implement needed states. There are differences between the states
//and how long enemies spend on the states depending on the enemy's type.
//The player's attack is also dependent on the direction the player is facing.
//All background art and necessary sprite art has been finally drawn. The main musical pieces are in place, and the sound effects
//for non-game states are finished.
//Lose state now displays score.
//Must Add:
//1. A way for the target pointer to adapt to the dwindling number of enemies.
// Currently, the target pointer hovers even over inactive enemies.
//2. A defense state for the enemies, so that they can pause and react to attacks.
//3. Differences in the close attack and range attack times. The ranged attack should take 
// longer to prepare and be less effective for defending.
//4. Tweaks in the each of the enemy type's times to give them better gamefeel and differentiation.
//5. Demon state (cheat)
//6. Including extra animation frames in the game.
//7. More sound effects in the game state.
//8. Adding shadows???
//Bugs:
//1. Sometimes, the close attack will not kill an enemy colliding with the player and with the player
//facing the enemy.

#include <stdlib.h>
#include "myLib.h"
#include "sound.h"
#include "text.h"
//BG Header Files
#include "startbg.h"
#include "instructionsbg0.h"
#include "instructionsbg1.h"
#include "instructionsbg2.h"
#include "instructionsbg3.h"
#include "instructionsbg4.h"
#include "gamebg0.h"
#include "gamebg1.h"
#include "pausebg0.h"
#include "pausebg1.h"
#include "pausebg2.h"
#include "losebg0.h"
#include "losebg1.h"

//State Header Files
#include "game.h"
#include "select.h"

//Spritesheet Header File
#include "spritesheet.h"

//Music Header Files
#include "VacationWasteland.h"
#include "MegaHyperUltrastorm.h"
#include "SpringBreak.h"
#include "clang.h"
#include "quack.h"
#include "swish.h"

//Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions1();
void instructions1();
void goToInstructions2();
void instructions2();
void goToInstructions3();
void instructions3();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();

//ShadowOAM
OBJ_ATTR shadowOAM[128];

//Seed
int seed;

// States
enum {START, INSTRUCTIONS1, INSTRUCTIONS2, INSTRUCTIONS3, GAME, PAUSE, LOSE};
int state;

//Button Variables
unsigned short buttons;
unsigned short oldButtons;

//Offset
unsigned short hOff;
unsigned short vOff;

int main() {

    initialize();
    //State Machine
	while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTIONS1:
                instructions1();
                break;
            case INSTRUCTIONS2:
                instructions2();
                break;
            case INSTRUCTIONS3:
                instructions3();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }
	}
	return 0;
}
//Loads the sprite tiles and sets the registers.
void initialize() {
    DMANow(3, spritesheetPal, SPRITEPALETTE, (spritesheetPalLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &spritesheetTiles, &CHARBLOCK[4], (spritesheetTilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    hideSprites();
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | SPRITE_ENABLE;
    DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
    hOff = 0;
    vOff = 0;
    setupSounds();
    setupInterrupts();
    stopSound();
    playSoundA(VacationWasteland, VACATIONWASTELANDLEN,VACATIONWASTELANDFREQ, 1);
    playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
    goToStart();
}

//Loads the start background, tiles, and map. Initializes the seed and sets the state to start.
void goToStart() {
    DMANow(3, startbgPal, PALETTE, (startbgPalLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &startbgTiles, &CHARBLOCK[1], (startbgTilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &startbgMap, &SCREENBLOCK[30], (startbgMapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    seed = 0;
    initSelect();
    state = START;
}

//Updates the seed and the select variable. If A is pressed, enters a new state.
//and then goes to the instructions state.
void start() {
    waitForVBlank();
    seed++;
    updateStart();
    drawStart();
    //Go to game or instructions
    if (BUTTON_PRESSED(BUTTON_A)) {
        hideSprites();
        DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
        if (select == 0) {
            srand(seed);
            stopSound();
            playSoundA(MegaHyperUltrastorm, MEGAHYPERULTRASTORMLEN, MEGAHYPERULTRASTORMFREQ, 1);
            initGame();
            goToGame();
        } else {
            hOff = 0;
            vOff = 0;
            REG_BG1HOFF = hOff;
            REG_BG1VOFF = vOff;
            playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
            goToInstructions1();
        }
    }
}

//Loads the game background, tiles, and map. Sets the state to game.
void goToGame() {
    DMANow(3, gamebg0Pal, PALETTE, (gamebg0PalLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &gamebg0Tiles, &CHARBLOCK[0], (gamebg0TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &gamebg0Map, &SCREENBLOCK[31], (gamebg0MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &gamebg1Tiles, &CHARBLOCK[1], (gamebg1TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &gamebg1Map, &SCREENBLOCK[30], (gamebg1MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    hOff = 0;
    vOff = 0;
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
    state = GAME;
}

//Runs the game.
void game() {
    waitForVBlank();
    updateGame();
    drawGame();
    hOff--;
    REG_BG1HOFF = hOff;
    if (BUTTON_PRESSED(BUTTON_START)) {
        hideSprites();
        DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        goToPause();
    }
    if (playerDefeated == 1) {
        hideSprites();
        stopSound();
        playSoundA(SpringBreak, SPRINGBREAKLEN, SPRINGBREAKFREQ, 1);
        DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
        goToLose();
    }
}
//Loads the instructions background, tiles, and map. Sets the state to instructions.
void goToInstructions1() {
    DMANow(3, instructionsbg0Pal, PALETTE, (instructionsbg0PalLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &instructionsbg0Tiles, &CHARBLOCK[0], (instructionsbg0TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &instructionsbg0Map, &SCREENBLOCK[31], (instructionsbg0MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &instructionsbg2Tiles, &CHARBLOCK[1], (instructionsbg2TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &instructionsbg2Map, &SCREENBLOCK[30], (instructionsbg2MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    state = INSTRUCTIONS1;
}
//Runs the instructions.
void instructions1() {
    waitForVBlank();
    hOff--;
    vOff--;
    REG_BG1HOFF = hOff/4;
    REG_BG1VOFF = vOff/4;
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        goToInstructions2();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        goToStart();
    }
}

void goToInstructions2() {
    DMANow(3, &instructionsbg3Tiles, &CHARBLOCK[1], (instructionsbg3TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &instructionsbg3Map, &SCREENBLOCK[30], (instructionsbg3MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    state = INSTRUCTIONS2;
}

void instructions2() {
    waitForVBlank();
    hOff--;
    vOff--;
    REG_BG1HOFF = hOff/4;
    REG_BG1VOFF = vOff/4;
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        goToInstructions1();
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        goToInstructions3();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        goToStart();
    }
}

void goToInstructions3() {
    DMANow(3, &instructionsbg4Tiles, &CHARBLOCK[1], (instructionsbg4TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &instructionsbg4Map, &SCREENBLOCK[30], (instructionsbg4MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    state = INSTRUCTIONS3;
}
void instructions3() {
    waitForVBlank();
    hOff--;
    vOff--;
    REG_BG1HOFF = hOff/4;
    REG_BG1VOFF = vOff/4;
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        goToInstructions2();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        goToStart();
    }
}
//Loads the pause background, tiles, and map. Sets the state to pause.
void goToPause() {
    DMANow(3, pausebg0Pal, PALETTE, (pausebg0PalLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &pausebg0Tiles, &CHARBLOCK[0], (pausebg0TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &pausebg0Map, &SCREENBLOCK[31], (pausebg0MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    if (demonMode == 0) {
        DMANow(3, &pausebg1Tiles, &CHARBLOCK[1], (pausebg1TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
        DMANow(3, &pausebg1Map, &SCREENBLOCK[30], (pausebg1MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    } else {
        DMANow(3, &pausebg2Tiles, &CHARBLOCK[1], (pausebg2TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
        DMANow(3, &pausebg2Map, &SCREENBLOCK[30], (pausebg2MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    }
    hOff = 0;
    vOff = 0;
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
    initSelect();
    state = PAUSE;
}
//Runs the pause state.
void pause() {
    waitForVBlank();
    hOff--;
    vOff--;
    REG_BG1HOFF = hOff/2;
    REG_BG1VOFF = vOff/2;
    updatePause();
    drawPause();
    if (BUTTON_PRESSED(BUTTON_A)) {
        if (select == 0) {
            hideSprites();
            goToGame();
        } else if (select == 1) {
            hideSprites();
            playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
            playSoundA(VacationWasteland, VACATIONWASTELANDLEN,VACATIONWASTELANDFREQ, 1);
            goToStart();
        } else if (select == 2) {
            playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
            if (demonMode == 0) {
                DMANow(3, &pausebg2Tiles, &CHARBLOCK[1], (pausebg2TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
                DMANow(3, &pausebg2Map, &SCREENBLOCK[30], (pausebg2MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
                demonMode = 1;
            } else {
                DMANow(3, &pausebg1Tiles, &CHARBLOCK[1], (pausebg1TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
                DMANow(3, &pausebg1Map, &SCREENBLOCK[30], (pausebg1MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
                demonMode = 0;
            }
        }
    }
}
//Loads the lose background, tiles, and map. Sets the state to lose.
void goToLose() {
    DMANow(3, losebg0Pal, PALETTE, (losebg0PalLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &losebg0Tiles, &CHARBLOCK[0], (losebg0TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &losebg0Map, &SCREENBLOCK[31], (losebg0MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &losebg1Tiles, &CHARBLOCK[1], (losebg1TilesLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    DMANow(3, &losebg1Map, &SCREENBLOCK[30], (losebg1MapLen / 2) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    int hundreds = enemiesDefeated / 100;
    int tens = (enemiesDefeated - (hundreds * 100)) / 10;
    int ones = enemiesDefeated - (hundreds * 100) - (tens * 10);
    int digits[3] = {hundreds, tens, ones};
    for (int i = 0; i < 3; i++) {
        shadowOAM[i].attr0 = 79 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[i].attr1 = (52 + i * 50) | ATTR1_MEDIUM;
        if (digits[i] < 2) {
            shadowOAM[i].attr2 = ATTR2_TILEID(24, digits[i] * 4) | ATTR2_PALROW(0);
        } else {
            shadowOAM[i].attr2 = ATTR2_TILEID(28, (digits[i] - 2) * 4) | ATTR2_PALROW(0);
        }
    }
    DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
    hOff = 0;
    vOff = 0;
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
    state = LOSE;
}
//Runs the lose state.
void lose() {
    waitForVBlank();
    hOff--;
    vOff--;
    REG_BG1HOFF = hOff/4;
    REG_BG1VOFF = vOff/4;
    if (BUTTON_PRESSED(BUTTON_START)) {
        hideSprites();
        stopSound();
        DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
        playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
        playSoundA(VacationWasteland, VACATIONWASTELANDLEN,VACATIONWASTELANDFREQ, 1);
        goToStart();
    }
}