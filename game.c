#include <stdlib.h>
#include "game.h"
#include "myLib.h"
#include "swish.h"
#include "sound.h"
#include "clang.h"
#include "quack.h"

//Variables
PLAYER player;
ENEMY enemies[ENEMYCOUNT];
ENERGYWAVE enemyWaves[ENEMYCOUNT];
ENERGYWAVE playerEnergyWave;
int playerDefeated;
int target;
int enemiesDefeated;
int demonMode;

enum {WAIT, VULNERABLE, APPROACH, RETREAT, CATTACK, RATTACK, DEFENSE, DYING};

//Initializes the game.
void initGame() {
    demonMode = 0;
    playerDefeated = 0;
    enemiesDefeated = 0;
    target = 0;
    initPlayer();
    initEnemies();
    initEnergyWave();
    initEnemyEnergyWaves();
}
//Updates the game.
void updateGame() {
	updatePlayer();
	for (int i = 0; i < ENEMYCOUNT; i++) {
		updateEnemies(&enemies[i]);
	}
    for (int i = 0; i < ENEMYCOUNT; i++) {
        updateEnemyEnergyWaves(&enemyWaves[i]);
    }
	updateEnergyWave();
    updateTargetPointer();
}
//Draws the game.
void drawGame() {
	drawPlayer();
	drawEnemies();
	drawEnergyWave();
    drawEnemyEnergyWaves();
	drawTargetPointer();
	DMANow(3, &shadowOAM, OAM, (128 * 4) | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT);
}
//Initializes the player.
void initPlayer() {
	player.height = 32;
	player.width = 32;
	player.row = 110;
    player.col = SCREENWIDTH / 2 - (player.width / 2);
	player.attacking = 0;
    player.state = WAIT;
    player.closeAttackTime = 25;
    player.rangeAttackTime = 100;
	player.timer = 0;
    player.aniStateR = 0;
    player.aniStateC = 0;
}
//Initialize the enemy's energy waves.
void initEnemyEnergyWaves() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        enemyWaves[i].row = 0;
        enemyWaves[i].col = 0;
        enemyWaves[i].height = 32;
        enemyWaves[i].width = 32;
        enemyWaves[i].active = 0;
        enemyWaves[i].rdel = 1;
        enemyWaves[i].cdel = 1;
        enemyWaves[i].targetRow = player.row;
        enemyWaves[i].targetCol = player.col;
    }
}

//Updates the player.
void updatePlayer() {
    switch (player.state) {
        case WAIT:
            playerWait();
            break;
        case CATTACK:
            playerCloseAttack();
            break;
        case RATTACK:
            playerRangedAttack();
            break;
        case DYING:
            playerDying();
            break;
    }
}
void playerWait() {
    player.timer++;
    if (player.timer % 5 == 0) {
        if (player.aniStateR == 3) {
            player.aniStateR = 0;
        } else {
            player.aniStateR += 1;
        }
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        player.timer = 0;
        player.aniStateC = 6;
        player.aniStateR = 1;
        player.state = RATTACK;
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        playSoundB(swish, SWISHLEN, SWISHFREQ, 0);
        player.timer = 0;
        player.aniStateC = 1;
        player.aniStateR = 1;
        player.state = CATTACK;
    }
}

void playerCloseAttack() {
    player.timer++;
    if (player.aniStateR == 1) {
        if (player.timer == 2 * player.closeAttackTime / 5) {
            player.aniStateR += 1;
            player.attacking = 1;
        }
    }
    if (player.aniStateR == 2) {
        if (player.timer == 4 * player.closeAttackTime / 5) {
            player.aniStateR += 1;
            player.attacking = 0;
        }
    }
    if (player.aniStateR == 3) {
        if (player.timer == player.closeAttackTime) {
            player.aniStateR = 0;
            player.aniStateC = 0;
            player.state = WAIT;
            player.timer = 0;
        }
    }
}
void playerRangedAttack() {
    player.timer++;
    if (player.aniStateR == 1) {
        if (player.aniStateC == 6) {
            if (player.timer == 2 * player.rangeAttackTime / 10) {
                player.aniStateC += 1;
            }
        }
        if (player.aniStateC == 7) {
            if (player.timer == 7 * player.rangeAttackTime / 10) {
                playSoundB(swish, SWISHLEN, SWISHFREQ, 0);
                player.aniStateR += 2;
                player.aniStateC = 6;
                fireEnergyWave();
            }
        }
    } else if (player.aniStateR == 3) {
        if (player.timer == 8 * player.rangeAttackTime / 10) {
            player.aniStateR += 2;
            player.attacking = 1;
        }
    } else if (player.aniStateR == 5) {
        if (player.timer == 9 * player.rangeAttackTime / 10) {
            player.aniStateR += 1;
        }
    } else if (player.aniStateR == 6) {
        if (player.timer == player.rangeAttackTime) {
            player.attacking = 0;
            player.aniStateR = 0;
            player.aniStateC = 0;
            player.state = WAIT;
            player.timer = 0;
        }
    }
}
void playerDying() {
    player.timer++;
    if (player.timer % 10 == 0) {
        player.aniStateR += 1;
        if (player.aniStateR > 6) {
            playerDefeated = 1;
        }
    }
}

//Draws the player.
void drawPlayer() {
    if (player.state != RATTACK) {
        shadowOAM[0].attr0 = player.row | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
        if (target < 2) {
            shadowOAM[0].attr1 = (player.col - 32) | ATTR1_LARGE | ATTR1_HFLIP;
        } else {
            shadowOAM[0].attr1 = player.col | ATTR1_LARGE;
        }
        shadowOAM[0].attr2 = ATTR2_TILEID(player.aniStateR * 4, player.aniStateC * 8) | ATTR2_PALROW(4 * demonMode);
    } else {
        if (player.aniStateR == 1) {
            shadowOAM[0].attr0 = (player.row - 32)| ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
            if (target < 2) {
                shadowOAM[0].attr1 = player.col | ATTR1_LARGE | ATTR1_HFLIP;
            } else {
                shadowOAM[0].attr1 = player.col | ATTR1_LARGE;
            }    
        } else if (player.aniStateR == 3) {
            shadowOAM[0].attr0 = (player.row - 32)| ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
            if (target < 2) {
                shadowOAM[0].attr1 = (player.col - 32) | ATTR1_LARGE | ATTR1_HFLIP;
            } else {
                shadowOAM[0].attr1 = player.col | ATTR1_LARGE;
            }                
        } else if (player.aniStateR > 3) {
            shadowOAM[0].attr0 = player.row | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
            if (target < 2) {
                shadowOAM[0].attr1 = (player.col - 32) | ATTR1_LARGE | ATTR1_HFLIP;
            } else {
                shadowOAM[0].attr1 = player.col | ATTR1_LARGE;
            }
        }
        shadowOAM[0].attr2 = ATTR2_TILEID(player.aniStateR * 4, player.aniStateC * 4) | ATTR2_PALROW(4 * demonMode);    
    }
}

//Updates the enemies.
void updateEnemies(ENEMY *e) {
    if (e->active) {
        if (demonMode) {
            if (collision(e->row, e->col, e->height, e->width,
            playerEnergyWave.row, playerEnergyWave.col, playerEnergyWave.height, playerEnergyWave.width) && playerEnergyWave.active) {
                if (e->state != DYING) {
                    e->state = DYING;
                    e->timer = 0;
                    e->aniStateR = 4;
                    e->aniStateC = 1;
                    playerEnergyWave.active = 0;
                }
            }
        }
        switch(e->state) {
            case WAIT:
                enemyWait(e);
                break;
            case APPROACH:
                enemyApproach(e);
                break;
            case RETREAT:
                enemyRetreat(e);
                break;
            case VULNERABLE:
                enemyVulnerable(e);
                break;
            case CATTACK:
                enemyCloseAttack(e);
                break;
            case RATTACK:
                enemyRangedAttack(e);
                break;
            case DYING:
                enemyDying(e);
                break;
        }
    }
}
//Initializes the enemies.
void initEnemies() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].row = 80 + 45 * (i % 2);
        enemies[i].col = 10 + (200 - 16) * (i / 2);
        enemies[i].originalRow = enemies[i].row;
        enemies[i].originalCol = enemies[i].col;
        enemies[i].height = 32;
        enemies[i].width = 32;
        enemies[i].aniStateC = 0;
        enemies[i].aniStateR = 0;
        enemies[i].timer = 0;
        enemies[i].index = i;
        enemies[i].rdel = 1;
        enemies[i].cdel = 1;
        enemies[i].attacking = 0;
        enemies[i].waitTime = rand() % 300;
        enemies[i].active = 1;
        enemies[i].state = WAIT;
        enemies[i].type = rand() % 3;
        enemies[i].close = 0;
        if (enemies[i].type == 0) {
            enemies[i].vulnerableTime = 175;
            enemies[i].closeAttackTime = 100;
        } else if (enemies[i].type == 1) {
            enemies[i].vulnerableTime = 300;
            enemies[i].closeAttackTime = 50;
        } else {
            enemies[i].vulnerableTime = 250;
            enemies[i].closeAttackTime = 75;
            enemies[i].rangeAttackTime = 100;
        }
    }
}
//Enemy waits until it hits its wait time, then picks a state to transition to.
void enemyWait(ENEMY *e) {
    e->timer++;
    if (e->timer % 5 == 0) {
        if (e->aniStateR == 3) {
            e->aniStateR = 0;
        } else {
            e->aniStateR += 1;
        }
    }
    if (e->timer >= e->waitTime) {
        e->timer = 0;
        int othersAttacking = 0;
        //temp to test vulnerable state's reaction to far away wave
        e->aniStateR = 4;
        e->aniStateC = 0;
        e->state = VULNERABLE;
        for (int i = 0; i < ENEMYCOUNT; i++) {
            if (enemies[i].state == APPROACH || enemies[i].state == RATTACK || enemies[i].state == CATTACK) {
                othersAttacking = 1;
                break;
            }
        }
        if (othersAttacking) {
            e->aniStateR = 4;
            e->aniStateC = 0;
            e->state = VULNERABLE;
        } else {
            int pickPhase = rand() % 3;
            if (e->type == 0) {
                if (pickPhase >= 1) {
                   e->aniStateR = 4;
                   e->aniStateC = 0;
                   e->state = VULNERABLE;
                } else {
                    e->aniStateR = 2;
                    e->aniStateC = 2;
                    e->state = APPROACH;
                }
            } else if (e->type == 1) {
                if (pickPhase >= 1) {
                    e->aniStateR = 2;
                    e->aniStateC = 2;
                    e->state = APPROACH;
                } else {
                    e->aniStateR = 4;
                    e->aniStateC = 0;
                    e->state = VULNERABLE;
                }
            } else {
                if (pickPhase == 0) {
                    e->aniStateR = 2;
                    e->aniStateC = 2;
                    e->state = APPROACH;
                } else if (pickPhase == 1) {
                    e->aniStateR = 4;
                    e->aniStateC = 0;
                    e->state = VULNERABLE;
                } else {
                    e->aniStateC = 6;
                    e->aniStateR = 1;
                    e->state = RATTACK;
                }
            }
        }
    }
}

void enemyVulnerable(ENEMY *e) {
    e->timer++;
    if (e->timer % 10 == 0) {
        if (e->aniStateR == 4) {
            e->aniStateR = 5;
        } else {
            e->aniStateR = 4;
        }
    }
    if (collision(e->row, e->col, e->height, e->width,
        playerEnergyWave.row, playerEnergyWave.col, playerEnergyWave.height, playerEnergyWave.width)) {
        if (playerEnergyWave.active) {
            playSoundB(quack, QUACKLEN, QUACKFREQ, 0);
            e->state = DYING;
            e->timer = 0;
            e->aniStateR = 4;
            e->aniStateC = 1;
            playerEnergyWave.active = 0;
        }
    }
    if (player.attacking && e->close) {
        if ((e->index < 2 && target < 2)
            || (e->index >= 2 && target >= 2)) {
            playSoundB(quack, QUACKLEN, QUACKFREQ, 0);
            playerEnergyWave.active = 0;
            e->state = DYING;
            e->timer = 0;
            e->aniStateR = 4;
            e->aniStateC = 1;
        }
    }
    if (e->timer == e->vulnerableTime) {
        if (e->row != e-> originalRow) {
            e->state = RETREAT;
            e->aniStateR = 2;
            e->aniStateC = 2;
        } else {
            e->state = WAIT;
            e->timer = 0;
            e->waitTime = rand() % 300;
            e->aniStateC = 0;
            e->aniStateR = 0;
        }
    }
}
//Enemy approaches the player.
void enemyApproach(ENEMY *e) {
    if (collision(e->row, e->col, e->height, e->width, player.row, player.col - 10, player.height, player.width + 20)) {
        e->close = 1;
        e->state = CATTACK;
        e->aniStateC = 1;
        e->aniStateR = 1;
    } else {
        if (player.row < e->row) {
            e->row -= e->rdel;
        } else if (player.row > e->row) {
            e->row += e->rdel;
        }
        if (player.col < e->col) {
            e->col -= e->cdel; 
        } else if (player.col > e->col) {
            e->col += e->cdel;
        }
    }
}
//Enemy attacks the player from a short distance.
void enemyCloseAttack(ENEMY *e) {
    e->timer++;
    e->close = 1;
    if (e->aniStateR == 1) {
        if (player.attacking) {
            if ((target < 2 && e->index < 2) || (target >= 2 && e->index >= 2)) {
                playerEnergyWave.active = 0;
                e->aniStateR = 3;
                playSoundB(clang, CLANGLEN, CLANGFREQ, 0);
            }
        }
        if (e->timer == 2 * e->closeAttackTime / 5) {
            playSoundB(quack, QUACKLEN, QUACKFREQ, 0);
            e->aniStateR += 1;
            e->attacking = 1;
            player.state = DYING;
            player.timer = 0;
            player.aniStateR = 4;
            player.aniStateC = 1;
        }
    }
    if (e->aniStateR == 2) {
        //quack too long
        //playSoundB(quack, QUACKLEN, QUACKFREQ, 0);
        if (e->timer == 4 * e->closeAttackTime / 5) {
            e->aniStateR += 1;
            e->attacking = 0;
        }
    }
    if (e->aniStateR == 3) {
        if (e->timer == e->closeAttackTime) {
            e->aniStateR = 4;
            e->aniStateC = 0;
            e->state = VULNERABLE;
            e->timer = 0;
        }
    }
}

//Enemy retreats back to their original position.
void enemyRetreat(ENEMY *e) {
    e->close = 0;
    if (e->row == e->originalRow && e->col == e->originalCol) {
        e->state = WAIT;
        e->timer = 0;
        e->waitTime = rand() % 300;
        e->aniStateC = 0;
        e->aniStateR = 0;
    } else {
        if (e->originalRow < e->row) {
            e->row -= e->rdel;
        } else if (e->originalRow > e->row) {
            e->row += e->rdel;
        }
        if (e->originalCol < e->col) {
            e->col -= e->cdel; 
        } else if (e->originalCol > e->col) {
            e->col += e->cdel;
        }
    }
}

//Fires an energy wave.
void enemyRangedAttack(ENEMY *e) {
    e->timer++;
    if (e->aniStateR == 1) {
        if (e->aniStateC == 6) {
            if (e->timer == 2 * e->rangeAttackTime / 10) {
                e->aniStateC += 1;
            }
        }
        if (e->aniStateC == 7) {
            if (e->timer == 7 * e->rangeAttackTime / 10) {
                playSoundB(swish, SWISHLEN, SWISHFREQ, 0);
                e->aniStateR += 2;
                e->aniStateC = 6;
                fireEnemyEnergyWave(e);
            }
        }
    } else if (e->aniStateR == 3) {
        if (e->timer == 8 * e->rangeAttackTime / 10) {
            e->aniStateR += 2;
            e->attacking = 1;
        }
    } else if (e->aniStateR == 5) {
        if (e->timer == 9 * e->rangeAttackTime / 10) {
            e->aniStateR += 1;
        }
    } else if (e->aniStateR == 6) {
        if (e->timer == e->rangeAttackTime) {
            e->attacking = 0;
            e->aniStateR = 0;
            e->aniStateC = 0;
            e->state = WAIT;
            e->timer = 0;
            e->waitTime = rand() % 300;
        }
    }
}

void enemyDying(ENEMY *e) {
    e->timer++;
    if (e->timer % 10 == 0) {
        e->aniStateR += 1;
        if (e->aniStateR > 6) {
            e->active = 0;
            e->aniStateR = 6;
            enemiesDefeated += 1;
            if (enemiesDefeated != 0 && enemiesDefeated % 4 == 0) {
                initEnemies();
            }
        }
    }
}

//Updates the target pointer.
void updateTargetPointer() {
    if (BUTTON_PRESSED(BUTTON_RIGHT) && target < 2) {
        target += 2;
    } 
    if (BUTTON_PRESSED(BUTTON_LEFT) && target > 1) {
    	target -= 2;
    }
    if (BUTTON_PRESSED(BUTTON_UP) && target % 2 == 1) {
        target -= 1;
    }
    if (BUTTON_PRESSED(BUTTON_DOWN) && target % 2 == 0) {
        target += 1;
    }
}

//Draws the enemies.
void drawEnemies() {
	for (int i = 0; i < (ENEMYCOUNT); i++) {
        int oamIndex = 0;
        switch(i) {
            case 0:
                oamIndex = 2 + 2;
                break;
            case 1:
                oamIndex = 0 + 2;
                break;
            case 2:
                oamIndex = 3 + 2;
                break;
            case 3:
                oamIndex = 1 + 2;
                break;
        }
		if (enemies[i].active) {
            if (enemies[i].state == VULNERABLE) {
                shadowOAM[oamIndex].attr0 = enemies[i].row | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
                if (i > 1) {
                    shadowOAM[oamIndex].attr1 = enemies[i].col | ATTR1_MEDIUM | ATTR1_HFLIP;
                } else {
                    shadowOAM[oamIndex].attr1 = enemies[i].col | ATTR1_MEDIUM;
                }
                shadowOAM[oamIndex].attr2 = ATTR2_TILEID(enemies[i].aniStateR * 4, enemies[i].aniStateC * 8) | ATTR2_PALROW(enemies[i].type + 1);
            } else if (enemies[i].state == RATTACK) {
                if (enemies[i].aniStateR == 1) {
                    shadowOAM[oamIndex].attr0 = (enemies[i].row - 32)| ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
                    if (i > 1) {
                        shadowOAM[oamIndex].attr1 = enemies[i].col | ATTR1_LARGE | ATTR1_HFLIP;
                    } else {
                        shadowOAM[oamIndex].attr1 = enemies[i].col | ATTR1_LARGE;
                    }    
                } else if (enemies[i].aniStateR == 3) {
                    shadowOAM[oamIndex].attr0 = (enemies[i].row - 32)| ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
                    if (i > 1) {
                        shadowOAM[oamIndex].attr1 = (enemies[i].col - 32) | ATTR1_LARGE | ATTR1_HFLIP;
                    } else {
                        shadowOAM[oamIndex].attr1 = enemies[i].col | ATTR1_LARGE;
                    }                
                } else if (enemies[i].aniStateR > 3) {
                    shadowOAM[oamIndex].attr0 = enemies[i].row | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
                    if (i > 1) {
                        shadowOAM[oamIndex].attr1 = (enemies[i].col - 32) | ATTR1_LARGE | ATTR1_HFLIP;
                    } else {
                        shadowOAM[oamIndex].attr1 = enemies[i].col | ATTR1_LARGE;
                    }
                }
                shadowOAM[oamIndex].attr2 = ATTR2_TILEID(enemies[i].aniStateR * 4, enemies[i].aniStateC * 4) | ATTR2_PALROW(enemies[i].type + 1);
            } else {
                shadowOAM[oamIndex].attr0 = enemies[i].row | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
                if (i > 1) {
                    shadowOAM[oamIndex].attr1 = (enemies[i].col - 32) | ATTR1_LARGE | ATTR1_HFLIP;
                } else {
                    shadowOAM[oamIndex].attr1 = (enemies[i].col) | ATTR1_LARGE;
                }
                shadowOAM[oamIndex].attr2 = ATTR2_TILEID(enemies[i].aniStateR * 4, enemies[i].aniStateC * 8) | ATTR2_PALROW(enemies[i].type + 1);
            }
		} else {
			shadowOAM[oamIndex].attr0 = enemies[i].row | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
            if (i > 1) {
                shadowOAM[oamIndex].attr1 = (enemies[i].col - 32) | ATTR1_LARGE | ATTR1_HFLIP;
            } else {
                shadowOAM[oamIndex].attr1 = (enemies[i].col) | ATTR1_LARGE;
            }
            shadowOAM[oamIndex].attr2 = ATTR2_TILEID(enemies[i].aniStateR * 4, enemies[i].aniStateC * 8) | ATTR2_PALROW(enemies[i].type + 1);
		}
	}
}
//Draws the target pointer.
void drawTargetPointer() {
    shadowOAM[1].attr0 = (enemies[target].row - 16) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    if (enemies[target].state != DYING) {
        shadowOAM[1].attr1 = (enemies[target].col + 8) | ATTR1_SMALL;        
    } else {
        if (target > 1) {
            shadowOAM[1].attr1 = (enemies[target].col - 16) | ATTR1_SMALL;
        } else {
            shadowOAM[1].attr1 = (enemies[target].col + 24) | ATTR1_SMALL;
        }
    }
	shadowOAM[1].attr2 = ATTR2_TILEID(22, 16) | ATTR2_PALROW(0);
}

//Initializes the energy wave.
void initEnergyWave() {
    playerEnergyWave.row = 0;
    playerEnergyWave.col = 0;
    playerEnergyWave.width = 32;
    playerEnergyWave.height = 32;
    playerEnergyWave.rdel = 1;
    playerEnergyWave.cdel = 1;
    playerEnergyWave.active = 0;
    playerEnergyWave.flipped = 0;
}
//Fires the energy wave.
void fireEnergyWave() {
    playerEnergyWave.row = player.row - 36;
    if (target > 1) {
        playerEnergyWave.flipped = 0;
    	playerEnergyWave.col = player.col + 23;
    } else {
        playerEnergyWave.flipped = 1;
    	playerEnergyWave.col = player.col- 23;
    }
    playerEnergyWave.targetRow = enemies[target].row;
    playerEnergyWave.targetCol = enemies[target].col;
    playerEnergyWave.active = 1;
}
//Updates the energy wave.
void updateEnergyWave() {
	if (playerEnergyWave.active) {
        if (playerEnergyWave.targetRow < playerEnergyWave.row) {
        	playerEnergyWave.row -= playerEnergyWave.rdel;
        } else if (playerEnergyWave.targetRow > playerEnergyWave.row) {
        	playerEnergyWave.row += playerEnergyWave.rdel;
        }
        if (playerEnergyWave.targetCol < playerEnergyWave.col) {
            playerEnergyWave.col -= playerEnergyWave.cdel; 
        } else if (playerEnergyWave.targetCol > playerEnergyWave.col) {
        	playerEnergyWave.col += playerEnergyWave.cdel;
        }
        if (playerEnergyWave.targetRow == playerEnergyWave.row 
            && playerEnergyWave.targetCol == playerEnergyWave.col) {
            playerEnergyWave.active = 0;
        }
	}
}
//Draws the energy wave.
void drawEnergyWave() {
    if (playerEnergyWave.active) {
    	shadowOAM[6].attr0 = playerEnergyWave.row | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
        if (playerEnergyWave.flipped) {
            shadowOAM[6].attr1 = playerEnergyWave.col | ATTR1_MEDIUM | ATTR1_HFLIP;
        } else {
            shadowOAM[6].attr1 = playerEnergyWave.col | ATTR1_MEDIUM;
        }
    	shadowOAM[6].attr2 = ATTR2_TILEID(16, 4) | ATTR2_PALROW(4 * demonMode);
    } else {
    	shadowOAM[6].attr0 = ATTR0_HIDE;
    }
}

void fireEnemyEnergyWave(ENEMY *e) {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        if (!enemyWaves[i].active) {
            enemyWaves[i].row = e->row - 36;
            if (e->index > 1) {
                enemyWaves[i].col = e->col - 23;
                enemyWaves[i].flipped = 1;
            } else {
                enemyWaves[i].flipped = 0;
                enemyWaves[i].col = e->col + 23;
            }
            enemyWaves[i].targetRow = player.row;
            enemyWaves[i].targetCol = player.col;
            enemyWaves[i].active = 1;
            break;
        }
    }
}
//Draws the enemy energy waves.
void drawEnemyEnergyWaves() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        if (enemyWaves[i].active) {
            shadowOAM[i + 7].attr0 = enemyWaves[i].row | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
            if (enemyWaves[i].flipped) {
                shadowOAM[i + 7].attr1 = enemyWaves[i].col | ATTR1_MEDIUM | ATTR1_HFLIP;
            } else {
                shadowOAM[i + 7].attr1 = enemyWaves[i].col | ATTR1_MEDIUM;
            }
            shadowOAM[i + 7].attr2 = ATTR2_TILEID(16, 4) | ATTR2_PALROW(3);
        } else {
            shadowOAM[i + 7].attr0 = ATTR0_HIDE;
        }
    }
}
//updates the enemy energy waves.
void updateEnemyEnergyWaves(ENERGYWAVE *e) {
    if (e->active) {
        if (e->targetRow < e->row) {
            e->row -= e->rdel;
        } else if (e->targetRow > e->row) {
            e->row += e->rdel;
        }
        if (e->targetCol < e->col) {
            e->col -= e->cdel; 
        } else if (e->targetCol > e->col) {
            e->col += e->cdel;
        }
        if (collision(e->row, e->col, e->height, e->width, player.row - 16, player.col - 16, player.height + 32, player.width + 32)) {
            if (player.attacking && ((e->flipped == 0 && target <= 1) || (e->flipped == 1 && target > 1))) {
                e->active = 0;
            } else if (collision(e->row, e->col, e->height, e->width, player.row, player.col, player.height, player.width)){
                e->active = 0;
                playSoundB(quack, QUACKLEN, QUACKFREQ, 0);
                player.state = DYING;
                player.timer = 0;
                player.aniStateR = 4;
                player.aniStateC = 1;
            }
        }
    }
}