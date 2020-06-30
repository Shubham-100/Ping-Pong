class Game
{
  float rad,Ballx,Bally,Speedx,Speedy,Mspeedy;
  float Lpadx,Lpady,Rpadx,Rpady,w,h,Mpadx,Mpady;
  Game()
  {
    rad = 20;
    Ballx = width/2;
    Bally = height/2;
    Mpadx = width/2;
    Mpady = height/2;
    Speedx = random(5,8);
    Speedy = 0.4*Speedx;
    Mspeedy = 5;
    Lpadx = 0;
    Rpadx = width;
    Lpady = Rpady = height/2;
    w = 60;
    h = 2*w;
  }
  
  void paddle()
  {
    fill(255,0,0);
    rect(Lpadx,Lpady,w,h);
    fill(0,0,255);
    rect(Rpadx,Rpady,w,h);
    fill(#07F7F1);
    rect(Mpadx,Mpady,w/2,h);
  }
  
  void restrictPaddle()
  {
    if(Lpady - h/2  <= 0)
      Lpady = h/2;
    
    else if(Lpady + h/2 >= height)
      Lpady = height - h/2;
      
    else if(Rpady - h/2  <= 0)
      Rpady = h/2;
    
    else if(Rpady + h/2 >= height)
      Rpady = height - h/2;  
       
  }
 
 void Ball()
 {
   noStroke();
   fill(#C91BDE);
   ellipse(Ballx,Bally,2*rad,2*rad);
 }
 
 void isOut()
 {
   if(Ballx + rad > width ) 
   {
     collided.play();
     collided.rewind();
     if(Speedx > 0)
     Speedx *= -1;
     
     if(++scoreL == 10)
     {
       gameRunning = false;
       winner = "RED";
     }
   }
   
   else if(Ballx - rad < 0)
   { 
     collided.play();
     collided.rewind();
     if(Speedx < 0)
     Speedx *= -1;
     
     if(++scoreR == 10)
      {
        gameRunning = false;
        winner = "BLUE";
      }
   }
   
   else if(Bally + rad > height || Bally - rad < 0)
   {
     Speedy *= -1;
   }  
 }
 
 void isCollidedPaddle()
 {
   if(Ballx + rad > width - w/2 && Bally + rad  > Rpady - h/2  && Bally - rad < Rpady + h/2)
   {
     Speedx = random(7,9);
     Speedy = 0.4*Speedx;
     point.play();
     point.rewind();
     Speedx *= -1;  
   }
   
   else if(Ballx - rad < w/2  &&  Bally  + rad > Lpady - h/2  && Bally - rad < Lpady + h/2)
   { 
     point.play();
     point.rewind();
     Speedx *= -1; 
   }

   else if(Ballx + rad > Mpadx - w/2 && Ballx - rad < Mpadx + w/2 && Bally + rad > Mpady - h/2 && Bally - rad < Mpady + h/2)
   {
     Speedx = random(6,8);
     Speedy = 0.4*Speedx;
     Speedx *= -1; 
   }
   
 }
 
 void midPaddlemovement()
 {    
     if(Mpady - h/2 < 0 || Mpady + h/2 > height)
     Mspeedy *= -1;
 }
 
 void scores()
 { 
   textSize(32);
   fill(255,0,0);
   text(" "+scoreL,width/2 - 88,50);
   fill(0,0,255);
   text(" "+scoreR,width/2 + 50,50);
 }
 
}; 