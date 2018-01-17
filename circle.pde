class Circle {
  float x;
  float y;
  color c;
  float own;
  boolean selected = false;
  boolean pselected = false;
  float orx = x;
  float ory = y;
  int num;
  boolean noTouch = false;
  Circle(float xe, float ye, int nume) {
    x = xe;
    y = ye;
    num = nume;
    own = random(-100, 100);
  }
  void show() {
    noStroke();
    fill(lerpColor(color(255, 0, 0), color(0, 0, 255), own/200+0.5));
    ellipse(x, y, height/8, height/8);
    move();
  }
  float touchOver() {
    if (touches.length > 0) {
      float dist = dist(x, y, touches[0].x, touches[0].y);
      if (dist < height/2 + sqrt(touches[0].area*(displayDensity*160)/PI)) {
        return dist;
      } else {
        return width*5;
      }
    } else {
      return width*5;
    }
  }
  void move() {
    if ((noTouch && touches.length == 0) || !noTouch) {
      noTouch = false;
      if (touchOver() < height/16) {
        if (pselected == false && selected()) {
          selected = false;
        } else {
          selected = true;
          if (pselected == false) {
            orx = x;
            ory = y;
          }
        }
      } else {
        selected = false;
      }
      if (selected == true && positionOK(touches[0].x, touches[0].y, num)) {
        fill(0, 50);
        if (bturn == true) {
          ellipse(orx, ory, height/8+(height/4*(own/200+0.5)), height/8+(height/4*(own/200+0.5)));
        } else {
          ellipse(orx, ory, height/8+(height/4*((own*-1)/200+0.5)), height/8+(height/4*((own*-1)/200+0.5)));
        }
        x = touches[0].x;
        y = touches[0].y;
      } else {
        selected = false;
      }
      if (selected == false && pselected == true) {
        newTurn();
        noTouch = true;
      }
      pselected = selected;
    }
  }
}