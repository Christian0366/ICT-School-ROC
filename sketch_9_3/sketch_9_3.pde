float mijnGetal;

void setup() {
  mijnGetal = mijnMethode(8, 7);

  if (mijnGetal <= 10) {
    println(mijnGetal);
  }
}

void draw() {
}

float mijnMethode(int getal, int getaltwee) {
  return (getal + getaltwee) / 2.0;
}
