float angle = 0;

void setup() {
  size(400, 300);
  background(0); 

  //rectMode(CENTER);
}

void draw() {
  //background(0);
  fill(0,5);
  rect(0,0,width,height);

  for (int i= 0 ; i <= width+30 ; i+=30) {
    for (int j=0; j <= height; j+=30){

    draw_rect(i, j, angle + i + j);
    }
  }

  angle += 0.05;
}

void draw_rect(float xpos, float ypos, float rotation) {
  pushMatrix();
  fill(100,100,255,2);
  stroke(255,100,100,5);
  strokeWeight(2);
  translate(xpos, ypos);
  rotate(rotation);
  rect(0, 0, 35, 35);  
  popMatrix();
}

