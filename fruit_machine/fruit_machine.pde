
//***************************************************************//
// Dynamic Image Slideshow
// by amnonP5 <http://amnonp5.wordpress.com>
// 
// space = Add slide
//     z = Turn ON / OFF the autoplay function
//     x = Delete last slide
//     c = Clear all slides
// 
// Comment IN / OUT: print added image message to console
// Comment IN / OUT: auto-reset slideshowat last slide
//
// https://processing.org/discourse/beta/num_1274874020.html
// 
//***************************************************************//

import processing.opengl.*;

ArrayList strips = new ArrayList();
boolean clickLock = false;
SoundControl sound;
Robert robert;



// =====================
// CONTROL PANEL
int totalStrips = 3;
// Minimum 4
int totalLoonies = 13;
// =====================


void setup() {
  size(1024, 768, P2D);
  //size(displayWidth, displayHeight, OPENGL); // full screen mode
  //fullScreen();
  smooth();
  strips.add(new Strip(0, totalLoonies, 40));
  strips.add(new Strip(1, totalLoonies, 35));
  strips.add(new Strip(2, totalLoonies, 37));

  soundSetup();
  sound = new SoundControl();

  robert = new Robert(this);
}

void draw() {
  background(255);
  for ( int s=0; s < totalStrips; s++ )
  {
    Strip strip = (Strip) strips.get(s);
    strip.update();
  }

  soundDraw();
  robert.update();
}

int haultCount = -1;
void mousePressed() {
  if ( clickLock ) {
    // Nothing
  } else {
    Strip s = (Strip) strips.get(++haultCount);
    s.hault();
    sound.shortSound();
    if ( haultCount == 2 ) {
      clickLock = true;
      sound.longSound();
      robert.fadeIn();
      haultCount = -1;
    }
  }
}

void resumeFruitMachine() {
  // Called by timer in Robert
  for ( int s=0; s < totalStrips; s++ )
  {
    Strip strip = (Strip) strips.get(s);
    strip.resume();
  }
  clickLock = false;
}

void keyPressed() {
  //if (key == 'z') {
  //  if (autoPlay) {
  //    autoPlay = false;
  //  } else {
  //    autoPlay = true;
  //  }
  //}
  //if (key == ' ') {
  //  if (photos.size() < loadFilenames.length) {
  //    photos.add(new Photo(random(80, width-80), random(60, height-60)));
  //  }
  //}
  //if (key == 'x') {
  //  if (photos.size() > 0) {
  //    photos.remove(photos.size()-1);
  //  }
  //}
  //if (key == 'c') {
  //  photos.clear();
  //}
}








//String[] loadFilenames;
//PImage[] loadPhotos;
//int counter, fileCount;
//boolean autoPlay = true; // by default autoplay is OFF

////void loadFilenames() {
////  java.io.File folder = new java.io.File(dataPath("")); // reads files from data folder
////  java.io.FilenameFilter imgFilter = new java.io.FilenameFilter() {
////    public boolean accept(File dir, String name) {
////      println(name);
////      return name.toLowerCase().endsWith(".jpg") || name.toLowerCase().endsWith(".png");
////    }
////  };
////  loadFilenames = folder.list(imgFilter);
////}

//void loadPhotos() {
//  for (int i = fileCount; i < loadFilenames.length; i++) { // only load new images
//    loadPhotos[i] = loadImage(loadFilenames[i]);
//    println("Photo added: " + loadFilenames[i]); // print added image message to console
//  }
//}

//void checkNew() {
//  loadFilenames();
//  if (loadFilenames.length > fileCount) {
//    loadPhotos(); 
//    fileCount = loadFilenames.length;
//  } // only call loadPhotos if there are new images
//}