class Robert {
  XML xml;
  XML[] children;
  int opacity = 0;
  int fadeDirection;
  int startRobertCount;
  boolean showRobert = false;
  String stringQuote = "";
  int state = 0;
  final fruit_machine main;

  // =====================
  // CONTROL PANEL
  int fadeSpeed = 10;
  int robertIntervalIn = 4000;
  int robertIntervalOut = 8000;
  String robertQuote = "Peter Green, 48 Laws of Power";
  // =====================


  Robert(PApplet m) {
    main = (fruit_machine) m;
    textAlign(CENTER, CENTER);

    xml = loadXML("robert.xml");
    children = xml.getChildren("law");
  }

  void update() {
    switch( state ) {
    case 0:
      // Nothing
      break;
    case 1:
      // Timer IN
      if (millis() - startRobertCount > robertIntervalIn) {
        state = 2;
        fadeDirection = 1 * fadeSpeed;
        startRobertCount = millis();
      }
      break;
    case 2:
      // FADE
      fade();
      break;
    case 3:
      // Timer OUT
      if (millis() - startRobertCount > robertIntervalOut) {
        state = 2;
        fadeDirection = -1 * fadeSpeed;
      }
      break;
    }


    fill(0, 0, 0, opacity);
    rect(0, 0, width, height);
    fill(255, 255, 255, opacity);
    textSize(44);
    text(stringQuote, 0, 0, width, height);
    textSize(24);
    text("Robert Greene, 48 Laws of Power", 200, 200, width, 800);
  }

  void fadeIn() {
    state = 1;
    startRobertCount = millis();

    int randomQuote = (int) random(children.length);
    stringQuote = children[randomQuote].getContent();
  }

  void fade() {
    opacity += fadeDirection;
    if (opacity > 175) {
      state = 3;
    } else if (opacity < 0) {
      state = 0;
      main.resumeFruitMachine();
    }
  }
}


//XML xml;

//void setup() {
//  xml = loadXML("mammals.xml");
//  XML[] children = xml.getChildren("animal");

//  for (int i = 0; i < children.length; i++) {
//    int id = children[i].getInt("id");
//    String coloring = children[i].getString("species");
//    String name = children[i].getContent();
//    println(id + ", " + coloring + ", " + name);
//  }
//}