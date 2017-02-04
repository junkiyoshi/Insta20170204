class Circle
{
  float level;
  PVector center;
  float radius;
  float h;
  float target_h;
  ArrayList<Tower> towers;
  
  Circle child;
  
  Circle(float l, PVector c, float r)
  {
    level = l;
    center = c.copy();
    radius = r;
    h = 0;
    
    towers = new ArrayList<Tower>();
    for(int i = 0; i < 360; i += 5)
    {
       float point_x = radius * cos(radians(i));
       float point_z = radius * sin(radians(i));
       towers.add(new Tower(new PVector(point_x, height - 30, point_z), 30 - level * 1.2, 360 - i));
    }
    
    if(level > 1)
    {
      child = new Circle(level -1, center, radius + 80);
    }
  }
  
  void update(float h_)
  {
    target_h = h_;
    
    if(level > 1)
    {
      child.update(h_);
    }
  }
  
  void display()
  {
    for(int i = 0; i < 30 * level; i++)
    {
      if(h < target_h)
      {
        h += 1;
      }else if(h > target_h)
      {
        h -= 1;
      }
    }
    
    if(level > 1)
    {
      child.display();
    }
    
    for(Tower t : towers)
    {
      t.update(h);
      t.display();
    }
  }
}