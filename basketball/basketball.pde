PImage imgRack;
int state = 0;
void setup(){
  size(500,500);
  textSize(50);
  imgRack = loadImage("rack.jpg");
}
boolean gameOver=false;
void keyPressed(){
  gameOver = true; // 在某個狀態下 game over, 要暫停
}
void draw(){
  if(state==0){
    background(255);
    fill(0); text("Start Game", 125, 200);
    x = 50;
  }else if(state==1){
    background(255);
    image(imgRack, 0, 0);
    if(flying){ //if( ! keyPressed ){
      if( ! gameOver ){
        x += vx; //反過來說, 沒有 game over 就會動
        y += vy;
        vy += 0.98;
      }
    }else{
      x = mouseX;
      y = mouseY;
      if(mousePressed){
        fill(255); ellipse(posX, posY, 20, 20);
        line(posX, posY, x, y);
      }
    }
    fill(#FFA652); ellipse(x, y, 20, 20);
  }
 }
boolean flying = false;
float x, y, vx, vy;
float posX = -100, posY = -100;
void mousePressed(){
  x = posX = mouseX;
  y = posY = mouseY;
  flying = false; //不飛行
  if(state==0) state=1;
}
void mouseReleased(){
  vx = posX-mouseX;
  vy = posY-mouseY;
  flying = true; //飛行 
}
