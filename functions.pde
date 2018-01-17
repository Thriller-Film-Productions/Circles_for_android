PVector createVector(float x, float y) {
  return new PVector(x, y);
}


void setupPositions() {
  positions[0] = createVector(0, 0);
  positions[1] = createVector(0.25, 0.25);
  positions[2] = createVector(-0.25, 0.25);
  positions[3] = createVector(-0.25, -0.25);
  positions[4] = createVector(0.25, -0.25);
  positions[5] = createVector(0.5, 0);
  positions[6] = createVector(0, 0.5);
  positions[7] = createVector(-0.5, 0);
  positions[8] = createVector(0, -0.5);
  positions[9] = createVector(0.85, 0);
  positions[10] = createVector(0, 0.85);
  positions[11] = createVector(-0.85, 0);
  positions[12] = createVector(0, -0.85);
  positions[13] = createVector(0.6, 0.6);
  positions[14] = createVector(-0.6, 0.6);
  positions[15] = createVector(-0.6, -0.6);
  positions[16] = createVector(0.6, -0.6);
  for (int i = 0; i < positions.length; i++) {
    positions[i].mult(height / 2);
    positions[i].x += width / 2;
    positions[i].y += height / 2;
  }
}

boolean selected() {
  boolean ret = false;
  for (int i = 0; i < 17; i++) {
    ret = circles[i].selected;
    if (ret == true) {
      break;
    }
  }
  return ret;
}

boolean positionOK(float x, float y, int number) {
  boolean retVal = false;
  if (dist(width/2, height/2, x, y) <= abs(height/16-height/2)) {
    if (!overlapping(x, y, number)) {
      if (bturn) {
        if (dist(x, y, circles[number].orx, circles[number].ory) < height/8*(circles[number].own/200+0.5)) {
          retVal = true;
        }
      } else {
        if (dist(x, y, circles[number].orx, circles[number].ory) < height/8*((circles[number].own*-1)/200+0.5)) {
          retVal = true;
        }
      }
    }
  }
  return retVal;
}

void newTurn() {
  if (bturn) {
    bturn = false;
    lineR+=15;
  } else {
    bturn = true;
    lineR+=15;
  }
}

boolean overlapping(float x, float y, int num) {
  boolean result = false;
  for (int i = 0; i < 17; i++) {
    if (i != num && height/4 <= dist(x, y, circles[i].x, circles[i].y)) {
      result = true;
    } else {
      result = false;
      break;
    }
  }
  return result;
}