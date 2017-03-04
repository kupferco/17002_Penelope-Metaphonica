
class Photo {
  PImage photo;
  float targetXpos;
  float targetYpos;
  float rotation;
  float xpos;
  float ypos;
  float speed;
  float easing;

  Photo() {
    photo = loadPhotos[photos.size()];
    xpos = width;
    ypos = 100;
    targetXpos = -width;
    targetYpos = 100;
    speed = 5;
    easing = 0.1;
  }
  
  void update() {
    move();
    display();
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    translate(-width/2, -height/2);
    translate(xpos, ypos);

    image(photo, 0, 0, width, 120);

    popMatrix();
  }

  void move() {
    if (dist(xpos, ypos, targetXpos, targetYpos) > 1) { // only move if the destination has not been reached
      //xpos = (1-easing) * xpos + (easing) * targetXpos;
      xpos -= speed;
    }
  }
}