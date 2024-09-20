int size = 10;
float time = 0;
ArrayList<Scale> scales = new ArrayList<Scale>();

void setup() {
  size(450, 450);
  for (int j = 0; j < 450/(size*2); j++) { // change 450 based on screen size
    for (int i = 0; i < 450/(size*2)+1; i++) { // scuffed +1 for bottom row
      float distance = dist(0, 0, j*2*size, i*2*size);
      scales.add(new Scale(j*2*size, i*2*size-size, size, distance));
    }
  }
}

void draw() {
  time += 0.1;
  // display scales from list
  for (int i = 0; i < scales.size(); i++) {
    Scale sca = scales.get(i);
    sca.update();
  }
}

// so i know what im pointing at
/*void mouseClicked() {
  println(mouseX + ", " + mouseY);
}*/

// scale class
class Scale {
  float x, y, s, d; // x, y, size, type, color
  Scale (float xpos, float ypos, float totallyNotSize, float distance) {
    x = xpos;
    y = ypos;
    s = totallyNotSize;
    d = distance;
  }
  void update() {
    float wave = sin(time-(y+x*time*0.1)*0.05); // okay honestly i have no clue what i did but it looks cool
    float brightness = wave*128+128;
    
    stroke(0);
    fill(230-brightness,190-brightness,138-brightness);
    beginShape();
    vertex(x+s, y);
    vertex(x+s*2, y);
    vertex(x+s*2, y+s*2);
    vertex(x+s, y+s*2);
    vertex(x+s, y+s*3);
    vertex(x, y+s*3);
    vertex(x, y+s);
    vertex(x+s, y+s);
    vertex(x+s, y);
    endShape(CLOSE);
  }
}
