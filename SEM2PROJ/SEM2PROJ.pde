Arrow[] arrows = new Arrow[10000];
Player player;
Enemy[] enemy = new Enemy[30];
int arrowsFired = 0;
boolean enemyAct = true;
int enemiesDestroyed = 0;
int enemiesRequired = 0;
  public int destroyedEnemies2;

public void setup() {
  size(800, 1000);
  player = new Player(400, 350);
  spawnEnemy();
}

public void draw() {
  background(0, 0, 0);

 
   fill(255,255,255);
   textAlign(CENTER);
  
int playerHp = player.playerHP;

  if (player.pActive == true){  
    player.show();
    player.levelUp();
    player.move();
  textAlign(RIGHT);  
  textSize(20);
  text("HP:", 700, 100);
  text(playerHp,720,100);
  text("LVL:", 700, 120);
  text(player.playerLevel,720,120);
  text("EXP", 700, 140);
  text(player.exp,720,140);
}
if(destroyedEnemies2 > 25){
  textAlign(CENTER);
  textSize(40);
  text("You win! Congrats!", 400, 400);  
  enemyAct = false;  
}
  
  if (player.pActive == false){
  textAlign(CENTER);
  textSize(40);
  text("You died!", 400, 400);  
  enemyAct = false;  
  }
  if(player.pos.x >=801){
    player.vel.x = -15;
  }
    if(player.pos.x <=-01){
    player.vel.x = 15;
  }
    if(player.pos.y >=1000){
    player.vel.y = -15;
  }
    if(player.pos.y <=-01){
    player.vel.y = 15;
  }
  print(destroyedEnemies2);
  
  for (int i = 0; i < enemy.length; i++) {
    if (enemy[i].eActive == true) {
      enemy[i].show();
      enemy[i].move();
      enemy[i].collides(player);
        if(enemy[i].pos.x >=751){
    enemy[i].vel.x = -enemy[i].vel.y;
  }
    if(enemy[i].pos.x <=-51){
    enemy[i].vel.x = -enemy[i].vel.y;
  }
    if(enemy[i].pos.y >=950){
    enemy[i].vel.y = -enemy[i].vel.y;
  }
    if(enemy[i].pos.y <=-51){
    enemy[i].vel.y = -enemy[i].vel.y;
  }
/*  
      if(enemy[i].pos.x > 800){
        enemy[i].eActive = false;
        enemiesDestroyed++;
    }
        if(enemy[i].pos.x < 0){
        enemy[i].eActive = false;
        enemiesDestroyed++;
      }
        if(enemy[i].pos.y > 800){
        enemy[i].eActive = false;
        enemiesDestroyed++;
    }
        if(enemy[i].pos.y < 0){
        enemy[i].eActive = false;
        enemiesDestroyed++;    
    }
 */
}
 
  
   
   if(enemyAct == false){
    enemy[i].eActive = false;
   }
   if(enemy[i].eActive==false){
     enemiesDestroyed = enemiesDestroyed + 1;

   enemy[i].pos.x = 3000;  
 }

  for (int x = 0; x < arrows.length; x++){
  if (arrows[x] != null){
    arrows[x].collides(enemy[i]); 
  }
 }
}

  
for (int e = 0; e < arrows.length; e++) {
  if (arrows[e] != null && arrows[e].active) {
    arrows[e].show();
    arrows[e].move();
  }
}
}


public void keyPressed() {
  if (key == 'a') {
    player.vel.x = -player.SPEED;
  } else if (key == 'd') {
    player.vel.x = player.SPEED;
  } else if (key == 'w') {
    player.vel.y = -player.SPEED;
  } else if (key == 's') {
    player.vel.y = player.SPEED;
  } else if (keyCode == LEFT) {
    player.vel.x = -player.SPEED;
  } else if (keyCode == RIGHT) {
    player.vel.x = player.SPEED;
  } else if (keyCode == UP) {
    player.vel.y = -player.SPEED;
  } else if (keyCode == DOWN) {
    player.vel.y = player.SPEED;
  }
    else if (keyCode == ' '){
    fireArrow();
    }
}
public void keyReleased() {
  if (key == 'a') player.vel.x = 0;
  if (key == 'd') player.vel.x = 0;
  if (key == 'w') player.vel.y = 0;
  if (key == 's') player.vel.y = 0;
  if (keyCode == LEFT) player.vel.x = 0;
  if (keyCode == RIGHT) player.vel.x = 0;
  if (keyCode == UP) player.vel.y = 0;
  if (keyCode == DOWN) player.vel.y = 0;
}



public void fireArrow() {
  Arrow arrow = new Arrow(new PVector(player.pos.x+23, player.pos.y - 20));
  arrows[arrowsFired] = arrow;
  arrowsFired++;
  }
public void spawnEnemy() {
  for (int i = 0; i < enemy.length; i++) {
    int n = (int)random(800);
    int m = (int)random(800);
    enemy[i] = new Enemy(n, m);
  }
}
