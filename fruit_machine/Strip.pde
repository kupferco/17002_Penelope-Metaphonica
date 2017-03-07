
class Strip {
  float counter = -1;
  int stripID;
  int total;
  float speed;
  IntList stripCounter = new IntList();
  ArrayList photos = new ArrayList();
  boolean haulting = false;

  Strip(int id, int totalLoonies, float s) {
    stripID = id;
    total = totalLoonies;
    speed = s;

    for ( int t=0; t < total; t++ )
    {
      stripCounter.append(t);
    }    

    for ( int t=0; t < total; t++ )
    {
      photos.add(new Photo(id, t, speed));
    }
  }

  void update() {
    counter++;
    if (counter >= (width/speed) && !haulting) {
      stripCounter.append(stripCounter.get(0));
      Photo photo = (Photo) photos.get(stripCounter.get(0));
      photo.clear();
      stripCounter.remove(0);
      counter=0;
    }

    for ( int s=0; s < 3; s++ )
    {
      Photo photo = (Photo) photos.get(stripCounter.get(s));
      photo.update();
    }
  }

  void hault() {
    haulting = true;
    for ( int s=0; s < 3; s++ )
    {
      Photo photo = (Photo) photos.get(stripCounter.get(s));
      photo.hault(s);
    }
  }

  void resume() {
    counter = -1;
    haulting = false;
    stripCounter.append(stripCounter.get(0));
    Photo photo = (Photo) photos.get(stripCounter.get(0));
    photo.clear();
    stripCounter.remove(0);
    for ( int s=0; s < photos.size(); s++ )
    {
      Photo photo2 = (Photo) photos.get(stripCounter.get(s));
      photo2.resume(s);
    }
  }
}