class Tower
{
  PVector location;
  float h; // height
  float w; // width
  float d; // depth
  float angle;
  float direction;
  color bodyColor;
 
  Tower(PVector l, float size, float a)
  {
    location = l.copy();
    h = 0;
    w = size;
    d = size * 1.5;
    angle = a;
   }
    
  void update(float h_)
  {
    h = h_;
    bodyColor = color(((h / 1024 * 255) + colorAdj) % 255, 255, 255);
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y - h / 2, location.z);
    rotateY(radians(angle));
    fill(bodyColor);
    stroke(32);
    box(w, h, d);
    popMatrix();
  }
}