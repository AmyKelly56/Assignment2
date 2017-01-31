class Customer extends Actions
{
  boolean collected = false;
  boolean startGame = true;
  boolean customer_destination = false;
  
  Customer()
  {
    position = new PVector(random(4, 994), random (4, 560));
  }
  
  void draw()
  {
    fill(#FAF5DC);
    ellipse(position.x + 18, position.y -20, 40, 20);
    fill(#EA6826);
    ellipse(position.x, position.y, 12, 14);
    fill(255);
    ellipse(position.x, position.y, 10, 10);
    fill(#FAF5DC);
    rect(position.x, position.y + 10, 8, 10);
    rect (position.x, position.y + 10, 8, 10);
    rect (position.x+5, position.y + 9, 3, 8);
    rect (position.x-5, position.y + 4, 3, 8);
    fill(#da5f1e);
    rect (position.x+2, position.y + 19, 4, 8);
    rect (position.x-2, position.y + 19, 4, 8);
    fill(0);
    textFont(f1, 10);
    text("TAXI!", position.x+5, position.y - 15, 30); 
  }
  
  void crash()
  {
    if (taxi.position.x > position.x - 20 
    && taxi.position.y < position.y + 38 
    && taxi.position.x < position.x + 23 
    && taxi.position.y > position.y - 21)
    
    {
      collected = true;
      
      if (customer_destination == true)
      {
        customer_destination = false;
        
      }
      else
      {
        customer_destination = true;
      }
    }
  }
}

    
    
  