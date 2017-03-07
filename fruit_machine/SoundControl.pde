import processing.sound.*;
SoundFile[] files = new SoundFile[10];
int startLongSoundCount;
boolean playLongSound = false;
int longSoundInterval = 3000;

void soundSetup() {
  // Load a soundfile from the /data folder of the sketch and play it back
  files[0] = new SoundFile(this, "short_sound.mp3");
  files[1] = new SoundFile(this, "long_sound.mp3");
}

void soundDraw() {
  if ( millis() - startLongSoundCount > longSoundInterval && playLongSound ) {
    files[1].play();
    playLongSound = false;
  }
}

class SoundControl {

  SoundControl() {
  }

  void shortSound() {
    files[0].play();
  }

  void longSound() {
    startLongSoundCount = millis();
    playLongSound = true;
  }
}