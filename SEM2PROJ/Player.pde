public class Player {
  public PVector pos, vel, size;
  public boolean pActive = true;
  public final int SIZE = 50;
  public int playerHP = 3;
  private final int SPEED = 20;
  public int playerLevel =  1;
  public int exp = 0;
  public int levelUpThreshold = 50;

  public Player(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
  }
//show
  public void show() {
    fill(178, 190, 181);
    square(pos.x, pos.y, SIZE);
  }

  public void move() {
    pos.add(vel);
  }
  public void levelUp(){
if(exp >= levelUpThreshold){
  playerLevel++;
  playerHP = 3 + playerLevel;
}
}
}
