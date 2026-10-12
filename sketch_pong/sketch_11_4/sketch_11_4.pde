int[] getallen = new int[10];

void setup(){
  for(int i = 0; i < getallen.length; i++){
    getallen[i] = 10+i*12;
  }
    
  for(int i = 0; i < getallen.length; i++){ 
    println(getallen[i]);
  }
  
}
