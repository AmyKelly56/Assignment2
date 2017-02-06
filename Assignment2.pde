import ddf.minim.*;
Minim minim;
AudioPlayer menuSong;
AudioPlayer gameSong;
AudioPlayer hornHonk;

Table PopularRoutes;
ArrayList<BarChart> bars = new ArrayList<BarChart>();

PFont f1,f2;
ArrayList<Actions> action;
ArrayList<Customer> customer_destination = new ArrayList<Customer>();

MainMenu menu;
TaxiCar taxi;
City city1;
City city2;
City city3;
City city4;
Customer customers;
Destination location;
Fuel fuel;
GameOver gameOver;
ReFuel reFuel;
Score score;

void setup()
{
  fullScreen();
  f1 = loadFont("freeversionSketchBlock-Bold-48.vlw");
  f2 = loadFont("orangejuice-48.vlw");
  textFont(f1);
  
  PopularRoutes = loadTable("PopularRoutes.csv", "header");
  createbarChart();
  
  minim = new Minim(this);
  menuSong = minim.loadFile("Fast_Motion.wav");
  gameSong = minim.loadFile("Steppin'_Out.wav");
  hornHonk = minim.loadFile("HornHonk.wav");
  
  menu = new MainMenu();
  customer_destination = new ArrayList<Customer>();
  customers = new Customer();
  location = new Destination();
  customer_destination.add(customers);
  action = new ArrayList<Actions>();
  taxi = new TaxiCar();
  fuel = new Fuel();
  reFuel = new ReFuel();
  score = new Score(); 
  gameOver = new GameOver();
  city1= new City(width/4, height/4 + 70);
  city2 = new  City(width - width/4 - 15, height - height/4 - 30);
  city3 = new City(width/4 + 5, height - height/4 - 30);
  city4 = new City(width - width/4 - 15, height/4 + 70);
  
  action.add(taxi);
  action.add(city1);
  action.add(city2);
  action.add(city3);
  action.add(city4);
  action.add(fuel);
}
 
void draw()
{
  background(#FA5503);
 
  if (menu.game == false)
  {
    menu.draw();
    menu.logo();
    menu.update();
    menu.instrctions();
    menuSong.play();
  }
  else if (menu.game == true)
  {
    gameSong.play();
    
    if (customers.startGame == true)
    {
      customers.randomise();
      customers.startGame = false;
    }
    
    background(#646362);
    gameOver.draw();
    
    for(Customer c : customer_destination)
    {
      c.draw();
      c.crash();
      
      if (c.collected == true)
      {
        if (c.customer_destination == true)
        {
          hornHonk.play();
          hornHonk.rewind();
          location.randomise();
          customer_destination.add(location);
        }
        else if (c.customer_destination == false)
        {
           hornHonk.play();
           hornHonk.rewind();
           customers.randomise();
           customer_destination.add(customers);
           score.addScore();
        }
        customer_destination.remove(c);
        c.collected = false;
        }
     }
     
    for (Actions a : action)
    {
      a.draw();
      a.update();
      a.checkSides();
      a.crash();
      a.reFuel();
    }
    
    if (reFuel.remove == true)
    {
      reFuel.remove = false;
      action.remove(reFuel);
    }
    if (reFuel.fuelStation == false)
    {
      if (fuel.fuel < 85)
      {
        reFuel.fuelStation = true;
        
        if (reFuel.fuelStation == true)
        {
          reFuel.randomise();
          action.add(reFuel);
        }
      }
    }
    score.draw();
  }
  if (taxi.working == false)
  {
    action.remove(taxi);
    action.remove(city1);
    action.remove(city2);
    action.remove(city3);
    action.remove(city4);
    action.remove(fuel);
    action.remove(reFuel);
    customer_destination.remove(customers);
    customer_destination.remove(location);
  
    drawBarChart();
    gameOver.expandGameOver();
    textSize(40);
    fill(32);
    text("Game Over!\n Your Score: " + score.score, width/2 - 125, height/2 - 160);
    text("Press R to Retrun\n to The Home Screen!", width/2 - 125, height/2);
    
    if (key == 'r')
    {
      minim.stop();
      setup();
    }  
  }
  
  spawnTraffic();
}

void spawnTraffic()
{
  if(frameCount % 120 == 0)
  {
    int place = (int)random(0,5);
    Traffic cars;
    color c = color(random(255), random(255), random(255));
    
    if(place <=1)
    {
      cars = new Traffic(0, height/2 + 80, radians(0),c);
      action.add(cars);
    }
    if(place == 2)
    {
      cars = new Traffic(width/2 - 80, +200, radians(270),c);
      action.add(cars);
    }
    if(place == 3)
    {
      cars = new Traffic(width,  height/2 - 80, radians(180),c);
      action.add(cars);
    }
    if(place >= 4) 
    {
      cars = new Traffic(width/2 + 80, height - 30, radians(90),c);
      action.add(cars);
    } 
  }
}
 
void keyPressed()
{
  if (key == ' ')
  {
    if (menu.game == false)
    {
      menuSong.close();
      menu.game = true;
    }
  }
  
  if (keyCode == LEFT || key == 'a')
  {
    taxi.left = true;
  }
  if (keyCode == RIGHT || key == 'd')
  {
    taxi.right = true;
  }
  
  if (keyCode == UP || key == 'w')
  {
    if (taxi.fast == true)
    {
      taxi.speed *= 2;
    }
    else
    {
      taxi.speed *= 1.5;
      taxi.fast = true;
    }
  }
  if (keyCode == DOWN || key == 's')
  {
    if (taxi.fast == false)
    {
      taxi.speed *= 2;
    }
    else
    {
      taxi.speed = 100;
      taxi.fast = false;
    }
  }  
}

void keyReleased()
{
  if (keyCode == LEFT || key == 'a')
  {
    taxi.left = false;
  }
  if (keyCode == RIGHT || key == 'd')
  {
    taxi.right = false;
  }
}