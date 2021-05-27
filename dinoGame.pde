import gifAnimation.*;
Gif dinoBoi;
cactus[] Cactus;
int speed = 5;
int x = 0;
float dinoY = 0;
float velocity = -3.5;
float gravity = 0.08;
float time = 0;
int score = 0;
boolean gameover = false;
boolean jump = false;

void setup() {
  size(750, 300);
  dinoBoi = new Gif(this, "unnamed.gif");
  dinoBoi.play();
  
  Cactus = new cactus[3];
  Cactus[0] = new cactus(800, 200, speed);
  Cactus[1] = new cactus(1100, 220, speed);
  Cactus[2] = new cactus(1400, 210, speed);
  
}

void draw() {
  if(!gameover){
    stroke(32, 33, 36);
    background(32, 33, 36);
    fill(255,0,0); //
    //rect(63, 207 + dinoY, 35, 55); //hit box
    image(dinoBoi, 50, 200 + dinoY, 75, 75);
    fill(32, 33, 36);
    rect(90, 250 + dinoY, 30, 15);
    rect(50, 250 + dinoY, 20, 15);
    strokeWeight(2);
    stroke(255, 255, 255);
    line(0, 252, 750, 252);
    
    fill(255);
    Cactus[0].drawCactus();
    Cactus[1].drawCactus();
    Cactus[2].drawCactus();
    
    if(keyPressed){
      jump = true;
    }
    if(jump){
      dinoY = velocity*time + (gravity*time*time)/2;
      time += 2;
    }
    if(dinoY > 0){
      time = 0;
      jump = false;
    }
    
    if(Cactus[0].xpos == 50){
      score += 1;
    }
    if(Cactus[1].xpos == 50){
      score += 1;
    }
    if(Cactus[2].xpos == 50){
      score += 1;
    }
    
    textSize(25);
    text("Score: " + score, 15, 30);
  
    if(Cactus[0].overlap(63, 207 + dinoY, 35, 50) && !(Cactus[0].overlap(90, 250 + dinoY, 30, 15) || Cactus[0].overlap(50, 250 + dinoY, 20, 15))){
      gameover = true;
    }
    if(Cactus[1].overlap(63, 207 + dinoY, 35, 50) && !(Cactus[0].overlap(90, 250 + dinoY, 30, 15) || Cactus[0].overlap(50, 250 + dinoY, 20, 15))){
      gameover = true;
    }
    if(Cactus[2].overlap(63, 207 + dinoY, 35, 50) && !(Cactus[0].overlap(90, 250 + dinoY, 30, 15) || Cactus[0].overlap(50, 250 + dinoY, 20, 15))){
      gameover = true;
    }
  }
  else{
    textSize(40);
    textAlign(CENTER);
    text("G A M E  O V E R", 375, 100);
    textAlign(LEFT);
    if(keyPressed){
      if(key == 'a'){
        x = 0;
        dinoY = 0;
        time = 0;
        score = 0;
        gameover = false;
        jump = false;
        Cactus[0] = new cactus(800, 200, speed);
        Cactus[1] = new cactus(1100, 220, speed);
        Cactus[2] = new cactus(1400, 210, speed);
      }
    }
  }
}
