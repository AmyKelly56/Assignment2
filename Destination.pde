class Destination extends Customer
{
  Destination()
  {
    position = new PVector(random(4, 994), random(4, 560));
  }
  
  void draw()
  {
    strokeWeight(0);
    fill(random(255), random(255), random(255));
    ellipse(position.x, position.y, 50, 50);
    strokeWeight(1);
  }
  
  void crash()
  {
    if (taxi.position.x > position.x - 20 
    && taxi.position.y < position.y + 38 
    && taxi.position.x < position.x + 23 
    && taxi.position.y > position.y - 21)
    
    {
      collected = true;
      
      if (customer_destination ==true)
      {
        customer_destination = false;
        customers.customer_destination = false;
      }
      else
      {
        customer_destination = true;
        customers.customer_destination = true;
      }
    }
  } 
}