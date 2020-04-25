void setup() {
  size(800, 800);
  //fullScreen();
  background(0);
}
void sector_ellipse(float x0, float y0, float xr, float yr, int A, float shift, int width, color myColor) {
  //сектор эллипса
  /*x0, y0 - координаты цетра
  xr, yr - радиусы по осям OX и OY
  A - угол
  shift - смещение в градусах от OX по часовой
  width - толщина линии
  myColor - цвет*/ 
  //сделай перегрузку функций в классе
  noStroke();
  float angle = shift;
  while (angle <= A + shift) {
    float x = x0 + xr * cos(PI/180 * angle);
    float y = y0 + yr * sin(PI/180 * angle);
    fill(myColor);
    ellipse(x, y, width, width);
    angle+=0.15;
  }
}

void sector_ellipse_h(float x0, float y0, float xr, float yr, int A, float shift, int width, color myColor) {
  //сектор эллипса, хорды от крайних точек к центру
  /*x0, y0 - координаты цетра
  xr, yr - радиусы по осям OX и OY
  A - угол
  shift - смещение в градусах от OX по часовой
  width - толщина линии
  myColor - цвет*/ 
  //сделай перегрузку функций в классе
  float angle = shift;
  while (angle <= A + shift) {
    float x = x0 + xr * cos(PI/180 * angle);
    float y = y0 + yr * sin(PI/180 * angle);
    if (angle == shift) {
      strokeWeight(width);
      stroke(myColor);
      line(x0, y0, x, y);
    }
    noStroke();
    fill(myColor);
    ellipse(x, y, width, width);
    angle+=0.15;
  }
  stroke(myColor);
  float xn = x0 + xr * cos(PI/180 * (A + shift));
  float yn = y0 + yr * sin(PI/180 * (A + shift));
  line(x0, y0, xn, yn);
  strokeWeight(1);
}
  
void sector_circle(float x0, float y0, float R, int A, float shift, int width, color myColor) {
  //сектор круга
  /*x0, y0 - координаты цетра
  R - радиус
  A - угол
  shift - смещение в градусах от OX по часовой
  width - толщина линии
  myColor - цвет*/ 
  //сделай перегрузку функций в классе
  noStroke();
  float angle = shift;
  while (angle <= A + shift) {
    float x = x0 + R * cos(PI/180 * angle);
    float y = y0 + R * sin(PI/180 * angle);
    fill(myColor);
    ellipse(x, y, width, width);
    angle+=0.15;
  }
}

void sector_circle_h(float x0, float y0, float R, int A, float shift, int width, color myColor) {
  //сектор круга, хорды от крайних точек к центру
  /*x0, y0 - координаты цетра
  R - радиус
  A - угол
  shift - смещение в градусах от OX по часовой
  width - толщина линии
  myColor - цвет*/ 
  //сделай перегрузку функций в классе
  float angle = shift;
  while (angle <= A + shift) {
    float x = x0 + R * cos(PI/180 * angle);
    float y = y0 + R * sin(PI/180 * angle);
    if (angle == shift) {
      strokeWeight(width);
      stroke(myColor);
      line(x0, y0, x, y);
    }
    noStroke();
    fill(myColor);
    ellipse(x, y, width, width);
    angle+=0.15;
  }
  stroke(myColor);
  float xn = x0 + R * cos(PI/180 * (A + shift));
  float yn = y0 + R * sin(PI/180 * (A + shift));
  line(x0, y0, xn, yn);
  strokeWeight(1);
}

void draw() {
  color a = color(255, 255, 0);
  sector_circle_h(400, 200, 150, 100, 40, 2, a);
  sector_circle_h(400, 250, 170, 110, 35, 2, a);
  sector_ellipse_h(400, 300, 190, 190, 120, 30, 2, a);
  sector_ellipse_h(400, 350, 210, 210, 130, 25, 2, a);
  noLoop();
}
