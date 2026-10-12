boolean gevonden;
String[] namen = {"jan", "jimmy", "liu", "finn", "sven"};

void setup() {
  gevonden = false;

  for (String naam : namen) {
    if (naam.equals("jan")) {
      gevonden = true;
      break;
    }
  }

  println(gevonden);
}
