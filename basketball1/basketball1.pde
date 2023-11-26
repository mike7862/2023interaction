PImage imgRack;
int buttonX = 200;
int buttonY = 200;
int buttonWidth = 100;
int buttonHeight = 50;

boolean gameStarted = false;
void setup() {
  size(500,500);
  textSize(50);
  imgRack = loadImage("3.jpg");
}

void draw() {
  background(200);

  if (gameStarted) {
    // 在遊戲畫面顯示的內容
    background(255);
    image(imgRack, 125, 0);
    if(flying){
      x += vx; //反過來說, 沒有 game over 就會動
        y += vy;
        vy += 0.98;
      }
      else{
      x = mouseX;
      y = mouseY;
      if(mousePressed){
        fill(255); ellipse(posX, posY, 20, 20);
        line(posX, posY, x, y);
      }
    }
    fill(#FFA652); ellipse(x, y, 20, 20);
  
  } else {
    // 檢查滑鼠是否在按鈕範圍內
    if (mouseX > buttonX && mouseX < buttonX + buttonWidth &&
        mouseY > buttonY && mouseY < buttonY + buttonHeight) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }

    // 畫按鈕
    rect(buttonX, buttonY, buttonWidth, buttonHeight);

    // 顯示按鈕文字
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Start Game", buttonX + buttonWidth / 2, buttonY + buttonHeight / 2);
  }
}
boolean flying = false;
float x, y, vx, vy;
float posX = -100, posY = -100;
void mousePressed() {
  x = posX = mouseX;
  y = posY = mouseY;
  flying = false; //不飛行
  // 檢查滑鼠是否在按鈕範圍內
  if (!gameStarted && mouseX > buttonX && mouseX < buttonX + buttonWidth &&
      mouseY > buttonY && mouseY < buttonY + buttonHeight) {
    // 開始遊戲
    gameStarted = true;
  }
}
void mouseReleased(){
  vx = posX-mouseX;
  vy = posY-mouseY;
  flying = true; //飛行 
}
