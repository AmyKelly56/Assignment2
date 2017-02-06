import ddf.minim.*;
Minim minim;
AudioPlayer menuSong;
AudioPlayer gameSong;
AudioPlayer hornHonk;

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
Traffic car1;
Traffic car2;
Traffic car3;
Traffic car4; 
Traffic car5;
Traffic car6;
Traffic car7;
Traffic car8;
Traffic car9; 
Traffic car10;

void setup()
{
  fullScreen();
  f1 = loadFont("freeversionSketchBlock-Bold-48.vlw");
  f2 = loadFont("orangejuice-48.vlw");
  textFont(f1);
  
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
  city1= new City(width/4, height/4);
  city2 = new  City(width - width/4 - 15, height - height/4 - 30);
  city3 = new City(width/4 + 5, height - height/4 - 30);
  city4 = new City(width - width/4 - 15, height/4 + 70);
  

  car1 = new Traffic(260, 580, 445, 580, 445, 385, 70, 385, 71, 580, 25, random(0, 255), random(0, 255), random(0, 255));
  car2 = new Traffic(261, 350, 445, 350, 445, 155, 70, 155, 71, 350, 30, random(0, 255), random(0, 255), random(0, 255));
  car3 = new Traffic(661, 350, 555, 350, 555, 149, 931, 150, 931, 350, 25, random(0, 255), random(0, 255), random(0, 255));
  car4 = new Traffic(661, 580, 555, 580, 555, 385, 931, 385, 931, 580, 20, random(0, 255), random(0, 255), random(0, 255));
  car5 = new Traffic(445, 385, 70, 385, 71, 580, 260, 580, 445, 580, 25, random(0, 255), random(0, 255), random(0, 255));
  car6 = new Traffic(445, 155, 70, 155, 71, 350, 261, 350, 445, 350, 30, random(0, 255), random(0, 255), random(0, 255));
  car7 = new Traffic(555, 149, 931, 150, 931, 350, 661, 350, 555, 350, 25, random(0, 255), random(0, 255), random(0, 255)); 
  car8 = new Traffic(555, 385, 931, 385, 931, 580, 661, 580, 555, 580, 20, random(0, 255), random(0, 255), random(0, 255));
  
 
  action.add(taxi);
  action.add(city1);
  action.add(city2);
  action.add(city3);
  action.add(city4);
  action.add(car1);
  action.add(car2);
  action.add(car3);
  action.add(car4);
  action.add(car5);
  action.add(car6);
  action.add(car7);
  action.add(car8);
  action.add(fuel);
}
 
void draw()
{

  background(#FA5503);
 
  //Game Menu
  if (menu.game == false)
  {
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
    action.remove(car1);
    action.remove(car2);
    action.remove(car3);
    action.remove(car4);
    action.remove(car5);
    action.remove(car6);
    action.remove(car7);
    action.remove(car8);
    action.remove(fuel);
    action.remove(reFuel);
    customer_destination.remove(customers);
    customer_destination.remove(location);
  
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