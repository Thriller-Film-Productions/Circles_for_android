boolean bturn = false;
float lineR = 180;
Circle[] circles = new Circle[17];
PVector[] positions = new PVector[17];
  
public void setup() {
  setupPositions();
  fullScreen(0);
  for (int i = 0; i < 17; i++) {
    circles[i] = new Circle(positions[i].x, positions[i].y, i);
  }
  smooth();
}

public void draw() {
  if (bturn) {
    background(120, 120, 255);
  } else {
    background(255, 120, 120);
  }
  ellipseMode(CENTER);
  noStroke();
  fill(235);
  ellipse(width/2, height/2, height, height);
  stroke(51);
  strokeWeight(2);
  line(width/2, height/2, sin(radians(lineR))*(height/2)+(width/2), cos(radians(lineR))*(height/2)+(height/2));
  for (int i = 0; i < circles.length; i++) {
    circles[i].show();
  }
}