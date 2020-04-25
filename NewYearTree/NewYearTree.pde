int nums = 4;
PImage[] img = new PImage[nums];
int board = 30;
void setup() {
  fullScreen();
  background(0);
  img[0] = loadImage("flash1.png");
  img[1] = loadImage("flash1.png");
  img[2] = loadImage("flash1.png");
  img[3] = loadImage("flash1.png");
  img[0].resize(10,10);
  img[1].resize(20,20);
  img[2].resize(40,40);
  img[3].resize(60,60);
}

float condition(float x, float Ax, float Ay, float Bx, float By) {
  return (By-Ay)*(x-Ax)/(Bx-Ax) + Ay;
}

int N = 500;
int count = 0;
int mini_count = 0;

//left (x,y), right(x,y), center(x,y), radius
float[] tr1 = {-200, -150, 200, -150, 0, -500,  375}; //верхний ярус
float[] tr2 = {-250, 50, 250, 50, 0, -275, 475}; //средний ярус
float[] tr3 = {-325, 275, 325, 275, 0, -75, 575}; //нижний ярус

void draw() {
  translate(width/2, height/2);
  for (int i = 0; i < N; i++) {
    float x = random(-width/2 + board, width/2 - board);
    float y = random(-height/2 + board, height/2 - board);
    float num = random(0, nums - 1);
    mini_count = 0;
    if ((y > condition(x,tr1[0],tr1[1],tr1[4],tr1[5])) && (y > condition(x,tr1[2],tr1[3],tr1[4],tr1[5])) && (pow(x,2) + pow(y-tr1[5],2) <= pow((tr1[6]),2))) {
      //shape(s[int(num)], x, y, size, size);
      image(img[int(num)], x, y);
      mini_count++;
    }
    if ((y > condition(x,tr2[0],tr2[1],tr2[4],tr2[5])) && (y > condition(x,tr2[2],tr2[3],tr2[4],tr2[5])) && (pow(x,2) + pow(y-tr2[5],2) <= pow((tr2[6]),2))) {
      image(img[int(num)], x, y);
      mini_count++;
    }
    if ((y > condition(x,tr3[0],tr3[1],tr3[4],tr3[5])) && (y > condition(x,tr3[2],tr3[3],tr3[4],tr3[5])) && (pow(x,2) + pow(y-tr3[5],2) <= pow((tr3[6]),2))) {
      image(img[int(num)], x, y);
      mini_count++;
    }
    if (count >= N * 3) {
      count = 0;
      clear();
    }
    else {
      count += mini_count;
    }
  }
}
