PImage img ;
void setup(){
  size(600,600);
  img = loadImage("p2.jpg");
}

void draw(){
  image(img, mouseX, mouseY, 300, 300);
}
