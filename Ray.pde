class Ray {
  PVector pos;
  PVector dir;
  Ray (float x, float y, float angle) {
    this.pos = new PVector(x, y); 
    this.dir = PVector.fromAngle(angle);
  }
  
  void setDir (PVector pos, float angle) {
    this.pos = pos;
    this.dir = PVector.fromAngle(angle);
  }
  
  void setAngle (float angle) {
    this.dir = PVector.fromAngle(angle);
  }
  
  PVector pvec;
  
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;
  float x4;
  float y4;
  
  float den;
  float t;
  float u;
  
  PVector cast(Wall wall) {
    x1 = wall.pos.x;
    y1 = wall.pos.y;
    x2 = wall.pos2.x;
    y2 = wall.pos2.y;
    
    x3 = this.pos.x;
    y3 = this.pos.y;
    x4 = this.pos.x + this.dir.x;
    y4 = this.pos.y + this.dir.y;
    
    den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    if (den == 0.0f) {
      return null;
    }
    
    t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
    u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
    
    if (t > 0.0f && t < 1.0f && u > 0.0f) {
      return pvec = new PVector((x1 + t * (x2 - x1)), (y1 + t * (y2 - y1)));
    } else {
      return null;
    }
  }
  
  void show() {
    if (this.pos != null) {
      stroke(255);
      pushMatrix();
      translate(this.pos.x, this.pos.y);
      //line(0, 0, this.dir.x * 20, this.dir.y * 20);
      popMatrix();
    }
  }
}
