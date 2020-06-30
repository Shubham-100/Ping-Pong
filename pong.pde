import ddf.minim.*;
Minim minim;
AudioPlayer point,collided;
boolean gameRunning = true;
PImage bg,gameover,start;
int scoreL = 0,scoreR = 0;
String winner;
Game g;

void setup()
{
  size(800,600);
  g = new Game();
  bg = loadImage("bg.png");
  gameover = loadImage("over.jpg");
  minim = new Minim(this);
  point = minim.loadFile("point.wav");
  collided = minim.loadFile("collided.wav");
  rectMode(CENTER);
}

void draw()
{
  if(gameRunning)
  {
   image(bg,0,0);
   g.Ballx += g.Speedx;
   g.Bally += g.Speedy;
   g.Mpady += g.Mspeedy;
   g.midPaddlemovement();
   g.restrictPaddle();
   g.paddle();
   g.Ball();
   g.isOut();
   g.isCollidedPaddle();
   g.scores();
  }
  
  else
  {
    image(gameover,0,0);
    
    if(winner == "RED")
    fill(255,0,0);
    
    else 
    fill(0,0,255);
    
    text(winner+"  WINS",width/2,height/2 - 100);
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("Mouse Press To Start!!",width/2,100);    
    
    if(mousePressed)
    { 
      gameRunning = true;
      g = new Game();
      scoreL = scoreR = 0;
    }  
  }
}

void keyPressed()
{
  switch(key)
  {
    case 'w':g.Lpady -= 25;
             break;
             
    case 's':g.Lpady += 25;
             break; 
             
    default: break;         
  }
  
  switch(keyCode)
  {
    case UP:g.Rpady -= 25;
            break;
            
    case DOWN:g.Rpady += 25;
              break;
              
    default : break;          
  }
  
}