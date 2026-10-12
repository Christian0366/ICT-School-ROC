int[] getallen = new int[7];

void setup() {
  // Vul de array met 7 getallen
  for (int i = 0; i < getallen.length; i++) {
    getallen[i] = i + 1;
  }

  // Print de array in de console
  println("Array:");
  for (int i = 0; i < getallen.length; i++) {
    println(getallen[i]);
  }
}
