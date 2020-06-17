ArrayList<Wall> walls;
Particle particle;
Boolean toggle = true;
float[] scene = new float[31];

float sceneW = 400;
float sceneH = 400;

void setup() {
  size(400, 400);
  walls = new ArrayList<Wall>();
  for (int i = 0; i < 5; i++) {
    float x1 = random(sceneW);
    float y1 = random(sceneH);
    float x2 = random(sceneW);
    float y2 = random(sceneH);
    walls.add(new Wall(x1, y1, x2, y2));
  }
  
  walls.add(new Wall(0, 0, sceneW, 0));
  walls.add(new Wall(sceneW, 0, sceneW, sceneH));
  walls.add(new Wall(sceneW, sceneH, 0, sceneH));
  walls.add(new Wall(0, sceneH, 0, 0));
  
  particle = new Particle();
}

PVector pt;

void draw() {
  background(0);
  //particle.update(mouseX, mouseY);

  //for (Wall wall : walls) {
  //  wall.show();
  //}
  particle.show();
  scene = particle.look(walls);
  //println(scene);
  float w = sceneW / scene.length;
  pushMatrix();
  for (int i = 0; i < scene.length; i++) {
    noStroke();
    float sq = scene[i] * scene[i];
    float wSq = sceneW * sceneW;
    float b = map(sq, 0, wSq, 255, 0);
    float h = map(scene[i], 0, sceneW, sceneH, 0);
    fill(b);
    rectMode(CENTER);
    rect(i * w + w/2, sceneH/2, w+1, h);
  }
  //particle.update(mouseX, mouseY);
  popMatrix();
}

void keyPressed() {
  if (key == 'a') {
    particle.rotate(-0.1);
  } else if (key == 'd') {
    particle.rotate(0.1);
  }
  if (key == 'w') {
    particle.move(5);
  } else if (key == 's') {
    particle.move(-5);
  }
}
