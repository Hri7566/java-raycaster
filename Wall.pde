class Wall {
  PVector pos;
  PVector pos2;
  Wall (float x, float y, float x2, float y2) {
    this.pos = new PVector(x, y);
    this.pos2 = new PVector(x2, y2);
  }
  
  void show() {
    stroke(255);
    line(pos.x,pos.y,pos2.x,pos2.y);
  }
}
