int[] getallen = new int[10];

void setup() {
  // Vul de array met waarden
  for (int i = 0; i < getallen.length; i++) {
    getallen[i] = i + 1;
  }

  // Wijzig alle waarden in de array
  for (int i = 0; i < getallen.length; i++) {
    getallen[i] = getallen[i] * 2;
  }

  // Print de array in de console
  println("Aangepaste array:");
  for (int i = 0; i < getallen.length; i++) {
    println(getallen[i]);
  }
}
