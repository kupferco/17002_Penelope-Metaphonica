
class Photo {
  PImage photo;
  float targetXpos;
  float targetYpos;
  float rotation;
  float xpos;
  float ypos;
  float easing;

  Photo(float targetXposTemp, float targetYposTemp, float rotationTemp) {
    photo = loadPhotos[photos.size()];
    xpos = width/2;
    ypos = -130;
    targetXpos = targetXposTemp;
    targetYpos = targetYposTemp;
    rotation = rotationTemp;
    easing = 0.1;
  }

  void display() {
    rectMode(CENTER);
    imageMode(CENTER);
    noStroke();

    pushMatrix();

    translate(width/2, height/2);
    rotate(radians(rotation));
    translate(-width/2, -height/2);

    translate(xpos, ypos);

    fill(0, 0, 0, 50);
    rect(4, 4, 330, 250);
    fill(255, 0, 0);
    rect(0, 0, 330, 250);
    image(photo, 0, 0, 320, 240);

    popMatrix();
  }

  void move() {
    if (dist(xpos, ypos, targetXpos, targetYpos) > 1) { // only move if the destination has not been reached
      xpos = (1-easing) * xpos + (easing) * targetXpos;
      ypos = (1-easing) * ypos + (easing) * targetYpos;
    }
  }
}