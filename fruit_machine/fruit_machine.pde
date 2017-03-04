
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

ArrayList photos = new ArrayList();
String[] loadFilenames;
PImage[] loadPhotos;
int counter, fileCount;
boolean autoPlay = true; // by default autoplay is OFF

void setup() {
  size(800, 600, OPENGL);
  //size(displayWidth, displayHeight, OPENGL); // full screen mode
  //fullScreen();
  smooth();
  loadPhotos = new PImage[10000]; // maximum of 10.000 images
  loadFilenames();
  loadPhotos(); // all existing images are loaded in setup
  fileCount = loadFilenames.length;
}

void draw() {
  background(255);
  //checkNew(); // checks for new images in the data directory every draw cycle
  if (autoPlay) {
    autoPlay();
  }
  for (int i = 0; i < photos.size(); i++) {
    Photo s = (Photo) photos.get(i);
    s.update();
  }
  //if (photos.size() == fileCount) {photos.clear();} // reset slideshow when it reaches the last slide
}

void loadFilenames() {
  java.io.File folder = new java.io.File(dataPath("")); // reads files from data folder
  java.io.FilenameFilter imgFilter = new java.io.FilenameFilter() {
    public boolean accept(File dir, String name) {
      println(name);
      return name.toLowerCase().endsWith(".jpg") || name.toLowerCase().endsWith(".png");
    }
  };
  loadFilenames = folder.list(imgFilter);
}

void loadPhotos() {
  for (int i = fileCount; i < loadFilenames.length; i++) { // only load new images
    loadPhotos[i] = loadImage(loadFilenames[i]);
    println("Photo added: " + loadFilenames[i]); // print added image message to console
  }
}

void checkNew() {
  loadFilenames();
  if (loadFilenames.length > fileCount) {
    loadPhotos(); 
    fileCount = loadFilenames.length;
  } // only call loadPhotos if there are new images
}

void autoPlay() {
  counter++;
  if (counter >= 160 && photos.size() < loadFilenames.length) {
    photos.add(new Photo()); 
    counter=0;
  }
}

void keyPressed() {
  if (key == 'z') {
    if (autoPlay) {
      autoPlay = false;
    } else {
      autoPlay = true;
    }
  }
  //if (key == ' ') {
  //  if (photos.size() < loadFilenames.length) {
  //    photos.add(new Photo(random(80, width-80), random(60, height-60)));
  //  }
  //}
  if (key == 'x') {
    if (photos.size() > 0) {
      photos.remove(photos.size()-1);
    }
  }
  if (key == 'c') {
    photos.clear();
  }
}