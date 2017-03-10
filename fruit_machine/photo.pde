
class Photo {
  PImage photo;
  float targetXpos;
  float targetYpos;
  float rotation;
  float xpos;
  float ypos;
  float speed;
  float easing;
  boolean haulting = false;

  int imageHeight = height/3;

  Photo(int stripID, int photoID, float s) {
    photo = loadImage("loonies/_" + photoID + "_" + stripID + ".jpg");
    //photo = loadImage("lumi_" + stripID + "_" + photoID + ".jpg");
    //int photoPos = photoID; 
    //if ( photoID >= 2 ) {
    //  photoPos = 2;
    //}
    //xpos = (width * photoPos);
    ypos = imageHeight * stripID;
    targetXpos = 0;
    targetYpos = ypos;
    speed = s;
    easing = 0.1;
  }

  void initPos(int pos) {
    xpos = (width * pos);
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

    image(photo, 0, 0, width, imageHeight);

    popMatrix();
  }

  void move() {
    if ( haulting ) {
      if (dist(xpos, ypos, targetXpos, targetYpos) > 1) { // only move if the destination has not been reached
        xpos = (1-easing) * xpos + (easing) * targetXpos;
      }
    } else {
      xpos -= speed;
    }
  }

  void hault(int haultPos) {
    haulting = true;
    targetXpos = -width + (width * haultPos);
  }

  void resume(int resumePos) {
    haulting = false;
    initPos(resumePos);    
    
    //int photoPos = resumePos; 
    //if ( resumePos >= 2 ) {
    //  photoPos = 2;
    //}
    //xpos = (width * photoPos);
  }

  void clear() {
    xpos = width * 2;
  }
}