import ddf.minim.*;
import ddf.minim.ugens.*;
 
Minim minim;
AudioOutput out;


float G = 0.5;
ArrayList<ball> balls = new ArrayList();
ArrayList<line> lines = new ArrayList();
void setup(){
  minim = new Minim( this );
  out = minim.getLineOut( Minim.MONO, 2048 );
  size(800,800);
  //fullScreen();
  //pixelDensity(displayDensity());
  //balls.add(new ball(width/2, 100));
  //lines.add(new line(100,300,200, 350));
  //lines.add(new line(300,350,400, 300));
  //lines.add(new line(50,600,400, 750));
  //lines.add(new line(200,500,800, 400));
}

void draw(){
  background(0);
   for(line l : lines){
    l.display();
  }
  ArrayList<ball> trashBalls = new ArrayList();
  for(ball b : balls){
    b.update();
    b.display();
    if(b.pos.x > width || b.pos.x < 0 || b.pos.y > height) trashBalls.add(b);
  }
  balls.removeAll(trashBalls);
  trashBalls.clear();
 
}

boolean makenewline = false;
void mousePressed(){
  if(keyPressed) {
    lines.add(new line(mouseX, mouseY, mouseX, mouseY)); 
    makenewline = true;
  }
  else balls.add(new ball(mouseX,mouseY));
}

void mouseDragged(){
  if(makenewline)  lines.get(lines.size()-1).p2 = new PVector(mouseX, mouseY);
}

void mouseReleased() {
  if(makenewline) {
    lines.get(lines.size()-1).p2 = new PVector(mouseX, mouseY);
    makenewline = false;
  }
}

void keyPressed(){
if(key == 'd') {
  lines.clear();
  balls.clear();
  makenewline = false;
}
}