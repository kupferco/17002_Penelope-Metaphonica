import processing.sound.*;
SoundFile[] shortSound = new SoundFile[16];
SoundFile[] longSound = new SoundFile[51];
int startLongSoundCount;
boolean playLongSound = false;
int longSoundInterval = 2000;

void soundSetup() {
  for (int s=0; s < shortSound.length; s++) {
    shortSound[s] = new SoundFile(this, "sounds/short/sound_" + s + ".mp3");
  }
  for (int s=0; s < longSound.length; s++) {
    longSound[s] = new SoundFile(this, "sounds/long/sound_" + s + ".mp3");
  }
}

void soundDraw() {
  if ( millis() - startLongSoundCount > longSoundInterval && playLongSound ) {
    int chooseSound = (int) random(longSound.length);
    longSound[chooseSound].play();
    playLongSound = false;
  }
}

class SoundControl {

  SoundControl() {
  }

  void shortSound() {
    int chooseSound = (int) random(shortSound.length);
    shortSound[chooseSound].play();
  }

  void longSound() {
    startLongSoundCount = millis();
    playLongSound = true;
  }
}