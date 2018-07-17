class wall{
  float x, y, w, h;
  
  wall(float px, float py, float pw, float ph){
    x = px;
    y = py;
    w = pw;
    h = ph;
  }
  
  void display(){
    noFill();
    strokeWeight(2);
    stroke(255);
    rect(x,y,w,h);
  }
  
}