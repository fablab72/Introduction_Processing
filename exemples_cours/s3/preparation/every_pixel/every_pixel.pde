
PImage img;       // The source image

int columns, rows;   // Number of columns and rows in our system

int [] colors;
int [] xcoords;
int [] ycoords;

void setup() {
  size(400, 300,P3D);
  colorMode(HSB);
  
  img = loadImage("ville.jpg");  // Load the image
  
  
  columns = img.width;  // Calculate # of columns
  rows = img.height;  // Calculate # of rows
  img.loadPixels();
  
  colors = new int[img.pixels.length];
  xcoords = new int[img.pixels.length];
  ycoords = new int[img.pixels.length];
  
  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
     
      int loc = i + j*img.width;  // Pixel array location
      color c = img.pixels[loc]; // color of the pixel
      colors[loc] = c;
      xcoords[loc] = i;
      ycoords[loc] =j;     
    }
  }

  println(img.pixels.length);


 
}

void draw() {
  background(0);
  float push1 = map (mouseX, 0, width, 0, 1);
  float push2 = map (mouseY, 0, height, 0, 1);
  // Begin loop for columns
  pushStyle();
  noStroke();
  rectMode(CENTER);

  for (int i =0 ; i< colors.length; i++) {


    if (hue(colors[i])>140 && hue(colors[i])<255) {      
      float z_blue = (push1*brightness(colors[i]) - 60.0);
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(xcoords[i] + 50, ycoords[i] + 50, z_blue);
      fill(colors[i], 204);
      rect(0, 0, 1, 1);
      popMatrix();
    }

    if (hue(colors[i])>0 && hue(colors[i])<25 && brightness(colors[i])<200) {      
      float z_red = (push2*brightness(colors[i]) - 60.0);
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(xcoords[i] + 50, ycoords[i] + 50, z_red);
      fill(colors[i], 204);
      rect(0, 0, 1, 1);
      popMatrix();
    }

    else {
      pushMatrix();
      translate(xcoords[i] + 50, ycoords[i] + 50, -60);
      fill(colors[i], 204);
      rect(0, 0, 1, 1);
      popMatrix();
    }
  }

  popStyle();
}


void keyPressed() {
  if (key == 's') {
    saveFrame("image-"+hour()+minute()+second()+".png");
  }
}


