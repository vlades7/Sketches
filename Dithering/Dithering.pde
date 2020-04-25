PImage img;
void setup() {
  //img = loadImage("cat.jpg");
  //size(720, 640);
  img = loadImage("box.jpg");
  size(1200, 375);
  //img.filter(GRAY);
  image(img, 0, 0);
}
int index(int x,int y) {
  return x + y * img.width;
}

void draw() {
  img.loadPixels();
  for (int x = 1; x < img.width - 1; x++) {
    for (int y = 0; y < img.height - 1; y++) {
      color oldpix = img.pixels[index(x,y)];
      int num_colors = 1;
      float oldR = red(oldpix);
      float oldG = green(oldpix);
      float oldB = blue(oldpix);
      
      float newR = round(num_colors * oldR/255.0) * (255/num_colors);
      float newG = round(num_colors * oldG/255.0) * (255/num_colors);
      float newB = round(num_colors * oldB/255.0) * (255/num_colors);
      color newpix = color(newR, newG, newB);
      img.pixels[index(x,y)] = newpix;
      
      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;
      
      int ind = index(x + 1, y); //(x + 1, y)
      color c = img.pixels[ind];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      img.pixels[ind] = color(r, g, b);
      
      ind = index(x - 1, y + 1); //(x - 1, y + 1)
      c = img.pixels[ind];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      img.pixels[ind] = color(r, g, b);
      
      ind = index(x, y + 1); //(x, y + 1)
      c = img.pixels[ind];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      img.pixels[ind] = color(r, g, b);
      
      ind = index(x + 1, y + 1); //(x + 1, y + 1)
      c = img.pixels[ind];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;
      img.pixels[ind] = color(r, g, b);
    }
  }
  img.updatePixels();
  image(img, img.width, 0);
}
