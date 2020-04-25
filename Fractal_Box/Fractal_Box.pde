float a = 0;
float size = 200;
float count = 0;
ArrayList<Box> sponge;

void setup() {
  fullScreen(P3D);
  sponge = new ArrayList<Box>();
  Box b = new Box(0, 0, 0, size);
  sponge.add(b);
}
void mousePressed() {
  if (count < 3) {
    ArrayList<Box> next = new ArrayList<Box>();
    for (Box b : sponge) {
      ArrayList<Box> newBoxes = b.generate();
      next.addAll(newBoxes);
    }
    sponge = next;
    count++;
  }
}

void draw() {
  background(51);
  stroke(255);
  noFill();
  lights();
  translate(width/2, height/2);
  rotateX(-mouseY * PI/360);
  rotateY(-mouseX * PI/360);
  for (Box b : sponge) {
    b.show();
  }
  a += 0.01;
}
