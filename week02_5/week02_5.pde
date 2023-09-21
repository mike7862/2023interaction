PImage img, imgBox ;
void setup(){
  size(600,600);
  img = loadImage("p5.jpg");
  imgBox = loadImage("Box.png");
}

void draw(){
  imageMode(CENTER);
  if(mousePressed){
    image(imgBox, mouseX, mouseY);
  }else{
  image(img, 300, 300, 200, 200);
  }
}
