int cijfer1 = 6;
int cijfer2 = 4;

void setup(){
  berekenGemiddelde(cijfer1, 6);
  berekenGemiddelde(cijfer2, 5);
}

void draw(){

}

void berekenGemiddelde(int cijfer1, int cijfer2){
  int gemiddelde = cijfer1 + cijfer2 / 2;
  println("cijfers " + cijfer1 + " " + cijfer2 + " " + gemiddelde);
}
