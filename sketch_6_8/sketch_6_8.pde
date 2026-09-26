float cijfer = 9;
boolean diploma = false;
boolean cumlaude = true;

if(cijfer > 8){
  diploma = true;
}

if(cijfer >= 5.5){
  diploma = true;
}

if(diploma && cumlaude){
  println("Gefeliciteerd");
}
