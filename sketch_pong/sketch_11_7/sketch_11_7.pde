int[] getallen = { 5, 8, 9, 5, 3, 5, 2, 1, 5, 7, 4, 5 };

void setup() {
  println("Getal 5 komt " + telHoeVaakGetalVoorkomt(5) + " keer voor.");
  println("Getal 3 komt " + telHoeVaakGetalVoorkomt(3) + " keer voor.");
  println("Getal 9 komt " + telHoeVaakGetalVoorkomt(9) + " keer voor.");
}

int telHoeVaakGetalVoorkomt(int getal) {
  int teller = 0;

  for (int i = 0; i < getallen.length; i++) {
    if (getallen[i] == getal) {
      teller++;
    }
  }

  return teller;
}
