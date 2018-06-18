int[][] sandPiles;
final int MAX_VAL = 3;

int getCol(int value){
  int col;
     switch(value){
       case 4:
         col = color(148,138,207);
         break;
       case 3:
         col = color(197,207,138);
         break;
       case 2:
         col = color(138,207,171);
         break;
       case 1:
         col = color(177,144,212);
         break;
       case 0:
         col = color(144,195,212);
         break;
       default:
         col = color(0);
         break;
     }
     return col;
}
void setup(){
  size(720, 720);
  frameRate(3000);
  sandPiles = new int[width][height];
  sandPiles[width/2][height/2] = 1000000;
}

void render(){
 loadPixels();
 for (int y = 0; y < height; y++){
   for (int x = 0; x < width; x++){
     int value = sandPiles[x][y];
     pixels[x+y*width] = getCol(value);
   }
 }
 updatePixels(); 
}

void topple(){
  for (int y = 0; y < height; y++){
    for (int x = 0; x < width; x++){
       int value = sandPiles[x][y];
       if (value > MAX_VAL){
         int giveAway = floor(value/4);
         sandPiles[x][y] = value - giveAway * 4;
         if (x-1 >= 0)
           sandPiles[x-1][y] += giveAway;
         if (x+1 < width)
           sandPiles[x+1][y] += giveAway;
         if (y-1 >= 0)
           sandPiles[x][y-1] += giveAway;
         if (y+1 < height)
           sandPiles[x][y+1] += giveAway;;
       }
    }
  }
}

void draw(){
 render();
 topple();
}
