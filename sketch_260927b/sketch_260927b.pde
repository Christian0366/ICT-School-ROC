int[] getallen = {5, 2, 5, 7, 2, 5, 9, 2, 4, 5};

void setup() {
  println("Getallen in de array:");
  for (int getal : getallen) {
    println(getal);
  }

  println("Aantal keer dat 5 voorkomt: " + telHoeVaakGetalVoorkomt(5));
  println("Aantal keer dat 2 voorkomt: " + telHoeVaakGetalVoorkomt(2));
}

int telHoeVaakGetalVoorkomt(int getal) {
  int aantal = 0;

  for (int waarde : getallen) {
    if (waarde == getal) {
      aantal++;
    }
  }

  return aantal;
}
