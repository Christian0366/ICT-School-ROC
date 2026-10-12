// Opdracht 11.1
String[] alfabet = new String[26];

void setup() {
  // Vul de array met A t/m Z
  for (int i = 0; i < alfabet.length; i++) {
    alfabet[i] = str(char('A' + i));
  }

  println("Opdracht 11.1:");
  printArray(alfabet);
  println();

  // Opdracht 11.2
  int[] getallen = new int[7];

  for (int i = 0; i < getallen.length; i++) {
    getallen[i] = i + 1;
  }

  println("Opdracht 11.2:");
  printArray(getallen);
  println();

  // Opdracht 11.3
  int[] waardes = new int[10];

  for (int i = 0; i < waardes.length; i++) {
    waardes[i] = i * 5;   // aanpassen van alle waarden
  }

  println("Opdracht 11.3:");
  printArray(waardes);
  println();
}
