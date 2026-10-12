int[] getallen = {5, 8, 9, 5, 3, 5, 2, 1, 5, 7, 4, 5};
int zoekWaarde = 5;

void setup() {
  size(200, 200);

  println("Array:");
  printArray(getallen);

  int aantal = 0;

  for (int i = 0; i < getallen.length; i++) {
    if (getallen[i] == zoekWaarde) {
      aantal++;
    }
  }

  println();
  println("Gezocht getal: " + zoekWaarde);
  println("Dit getal komt " + aantal + " keer voor in de array.");
}
