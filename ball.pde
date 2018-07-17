class ball{
  PVector pos;
  PVector vel;
  PVector acc;
 ToneInstrument instrument = new ToneInstrument( 0.1, 0.1 );
  
  ball(float x, float y){
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,G);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    for(line l : lines){
      if(abs(this.pos.y - convert(this.pos.x, l)) < this.vel.y && this.pos.x > l.p1.x && this.pos.x < l.p2.x){
        acc.set(0,0);
        pos.y = convert(this.pos.x, l) - vel.y;
        vel.y = -vel.y * 0.9;
        vel.x = (l.p1.y - l.p2.y) / (l.p1.x - l.p2.x) * 10;
        instrument.setFreq(pos.x);
        instrument.sineOsc.setAmplitude(map(vel.mag(),0,10,0,1));
        instrument.noteOn(0.001);
      }else{
        acc.set(0,G);
      }
    }
  }
  
  float convert(float x, line l){
    return ((l.p2.y - l.p1.y)/(l.p2.x - l.p1.x)) * (x - l.p1.x) + l.p1.y;
  }
  
  void display(){
    strokeWeight(10);
    stroke(255,0,0);
    point(pos.x, pos.y);
  }
}