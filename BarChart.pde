class BarChart
{
  String destination;
  int drops;
  color c;
  
  BarChart(TableRow row)
  {
    this.destination = row.getString("destination");
    this.drops = row.getInt("drops");
    c = color(random(255), random(255), random(255));
  }
  
  void drawBar(float x)
  {
    fill(c);
    rect(x + 10, height/2 - 100, 30, -map(drops, 0, 9, 0, 100));
    textSize(20);
    pushMatrix();
    translate(x + 5, height/2 + 100);
    rotate(-HALF_PI);
    text(destination, 0, 0);
    popMatrix();
    text(drops, x, height/2 - 180 -(map(drops, 0, 9, 0, 100) -85));
  }
}

void createbarChart()
{
  for(TableRow row:PopularRoutes.rows())
  {
    BarChart b = new BarChart(row);
    bars.add(b);
  }
}

void drawBarChart()
{
  int x = 100;
  for(BarChart b: bars)
  {
    b.drawBar(x);
    
    x += 60; 
  }
}