Circle circle;
float noise_v;
float colorAdj;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  
  circle = new Circle(8, new PVector(width / 2, height / 2), 300);
  colorAdj = 0;
}

void draw()
{
  background(255);
  translate(width / 2, height / 2, -1000);
  rotateX(radians(-60));

  if(frameCount % 15 == 1)
  {
    if(frameCount % 30 == 1)
    {
     circle.update(0);
     colorAdj += 5;
    }
    else
    {
      float h = random(0, 1024);
      circle.update(h);
    }
  }
    
  circle.display();

  /*
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}