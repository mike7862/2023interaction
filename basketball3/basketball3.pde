PImage imgRack;
int buttonX = 200, buttonW=10;
int buttonY = 200, buttonR=10;
int buttonWidth1 = 100, buttonWidth2 = 50;
int buttonHeight1 = 50, buttonHeight2 = 30;

boolean gameStarted = false;
void setup() {
  size(500,500);
  textSize(50);
  imgRack = loadImage("3.jpg");
}
boolean showMenu = false;
boolean overButton = (mouseX > buttonW && mouseX < buttonW + buttonWidth2 &&
        mouseY > buttonR && mouseY < buttonR + buttonHeight2);
void draw() {
  background(200);
  if (gameStarted) {
    // 在遊戲畫面顯示的內容
    background(255);
    image(imgRack, 125, 0);
    if (mouseX > buttonW && mouseX < buttonW + buttonWidth2 &&
        mouseY > buttonR && mouseY < buttonR + buttonHeight2) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }
    rect(buttonW, buttonR, buttonWidth2, buttonHeight2);
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Stop", buttonW + buttonWidth2 / 2, buttonR + buttonHeight2 / 2);
    if(showMenu){
      fill(200);
      rect(50, 90, 300, 100);
      fill(0);
      textSize(16);
      textAlign(LEFT, CENTER);
      text("Continue", 60, 110);
      text("Home", 60, 140);
    }
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
    if (mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&
        mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }

    // 畫按鈕
    rect(buttonX, buttonY, buttonWidth1, buttonHeight1);

    // 顯示按鈕文字
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Start Game", buttonX + buttonWidth1 / 2, buttonY + buttonHeight1 / 2);
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
  if (!gameStarted && mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&
      mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
    // 開始遊戲
    gameStarted = true;
  }
  boolean overButton = (mouseX > buttonW && mouseX < buttonW + buttonWidth2 &&
        mouseY > buttonR && mouseY < buttonR + buttonHeight2); {

      if (overButton) {
      // 在選單中點擊時處理相應的邏輯
      // 這裡留空，以待進一步擴展
      showMenu = true;
    } else {
    // 點擊了其他地方，隱藏選單
    showMenu = false;
    }
  }
}

void mouseReleased(){
  vx = posX-mouseX;
  vy = posY-mouseY;
  flying = true; //飛行 
}
void mouseMoved() {
  // 滑鼠移動時檢查是否離開了按鈕和選單的區域，如果是，隱藏選單
  if (!showMenu && (mouseY < buttonR + buttonHeight2 || mouseY > buttonR || mouseX < buttonW + buttonWidth2 || mouseX > buttonW)) {
    showMenu = false;
  }
}
