//Structs
//Player struct
typedef struct {
	int row;
	int col;
	int height;
    int width;
    int state;
    int attacking;
    int closeAttackTime;
    int rangeAttackTime;
    int timer;
    int aniStateR;
    int aniStateC;
} PLAYER;
//Enemy struct
typedef struct {
    int row;
    int col;
    int originalRow;
    int originalCol;
    int height;
    int width;
    int type;
    int index;
    int rdel;
    int cdel;
    int state;
    int prevState;
    int aniStateR;
    int aniStateC;
    int timer;
    int waitTime;
    int vulnerableTime;
    int closeAttackTime;
    int rangeAttackTime;
    int attacking;
    int close;
    int active;
} ENEMY;
//Energy Wave Struct
typedef struct {
    int row;
    int col;
    int side;
    int height;
    int width;
    int active;
    int rdel;
    int cdel;
    int flipped;
    int targetRow;
    int targetCol;
} ENERGYWAVE;

//Define macros
#define ENEMYCOUNT 4
//Variables
extern PLAYER player;
extern ENEMY enemies[ENEMYCOUNT];
extern ENERGYWAVE enemyWaves[ENEMYCOUNT];
extern ENERGYWAVE playerEnergyWave;
extern int playerDefeated;
extern int enemiesDefeated;
extern int target;
extern int demonMode;

//Prototypes
void initGame();
void updateGame();
void drawGame();
//Player function prototypes
void initPlayer();
void updatePlayer();
void playerWait();
void playerCloseAttack();
void playerRangedAttack();
void playerDying();
void drawPlayer();
//Enemy function prototypes
void initEnemies();
void updateEnemies(ENEMY *);
void drawEnemies();
void enemyWait(ENEMY *);
void enemyVulnerable(ENEMY *);
void enemyApproach(ENEMY *);
void enemyRetreat(ENEMY *);
void enemyCloseAttack(ENEMY *);
void enemyRangedAttack(ENEMY *);
void enemyDying(ENEMY *);
//void enemyDefense(ENEMY *);
//Target pointer function prototypes
void updateTargetPointer();
void drawTargetPointer();
//Energy wave function prototypes
void fireEnergyWave();
void initEnergyWave();
void updateEnergyWave();
void drawEnergyWave();
//Enemy energy wave function prototypes
void initEnemyEnergyWaves();
void fireEnemyEnergyWave(ENEMY *);
void updateEnemyEnergyWaves(ENERGYWAVE *);
void drawEnemyEnergyWaves();