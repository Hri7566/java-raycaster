class Particle {
  PVector pos;
  ArrayList<Ray> rays;
  float heading;
  int angle = 45;
  Particle () {
    this.pos = new PVector(sceneW/2, sceneH/2);
    this.rays = new ArrayList<Ray>();
    this.heading = 0;
    for (int a = -this.angle/2; a < this.angle/2; a += 1) {
      Ray newray = new Ray(this.pos.x, this.pos.y, radians(a));
      rays.add(newray);
    }
  }
  
  void rotate (float angle) {
    this.heading += angle;
    int index = 0;
    int i = -(this.angle/2);
    for (Ray ray : rays) {
      if (i < this.angle/2) {
        rays.get(index).setAngle(radians(i) + this.heading);
        index++;
        i += 1;
      }
    }
  }
  
  void move (float amt) {
    PVector vel = PVector.fromAngle(this.heading);
    vel.setMag(amt);
    this.pos.add(vel);
  }
  
  PVector pt;
  
  void update (float x, float y) {
    this.pos.set(x, y);
  }
  

  
  float scene[] = new float[this.angle];
  float[] look (ArrayList<Wall> walls) {
    int i = 0;
    for (Ray ray : this.rays) {
      float record = 1000000000;
      PVector closest = null;
      for (Wall wall : walls) {
        pt = ray.cast(wall);
        if (pt != null) {
          float d = dist(this.pos.x, this.pos.y, pt.x, pt.y);
          //println(d);
          float a = ray.dir.heading() - this.heading;
          d *= cos(a);
          //println(d);
          if (d < record) {
            record = d;
            closest = pt;
          }
        }
      }
      if (closest != null) {
        stroke(255, 100);
      }
      
      scene[i] = record;
      i++;
    }
    return scene;
  }
  
  void show () {
    fill(255);
    //ellipse(pos.x, pos.y, 16, 16);
    for (Ray ray : this.rays) {
      ray.pos.x = this.pos.x;
      ray.pos.y = this.pos.y;
      ray.show();
    }
  }
}
