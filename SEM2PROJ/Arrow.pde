public class Arrow {
  private PVector pos, vel, size;
  private boolean active = true;
 
  public Arrow(PVector pos) {
   this.pos = pos; 
   vel = new PVector(0,-30);
    size = new PVector(8,15);
  }
  public void show(){
    noStroke();
    fill (#808080);
    rect (pos.x,pos.y,size.x,size.y);
  }
  public void move() {
   pos.add(vel); 
    
  }
  public void collides(Enemy e){
  if (this.pos.x >= e.pos.x
  && this.pos.x <= e.pos.x + e.SIZE
  && this.pos.y >= e.pos.y
  && this.pos.y <= e.pos.y + e.SIZE){
   e.eHp--; 
   if(e.eHp == 0){
    e.eActive = false;
   player.exp = player.exp + 10;
      destroyedEnemies2 = destroyedEnemies2 +1;
 }
   
    active = false;
    
  }
    
    
    
  }
}
