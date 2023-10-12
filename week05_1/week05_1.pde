void setup(){
  size(400,400,P3D); //Processind 的 3D 功能
}
void draw(){
  background(#FFFFF2);
  pushMatrix();//備分矩陣
    translate(mouseX, mouseY);//移動
    box(100);//3D的盒子、方塊
  popMatrix();//還原矩陣
}
