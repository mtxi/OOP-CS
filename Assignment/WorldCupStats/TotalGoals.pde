class TotalGoals extends Animations
{
  int year;
  int total;
  String host;
  String champ;
  float x, y;
  PImage image;

  TotalGoals(String line)
  {
    String[] fields = line.split(",");
    year = Integer.parseInt(fields[0]);
    total = Integer.parseInt(fields[1]);
    host = fields[2];
    champ = fields[3];
  }


  TotalGoals()
  {
      
  }

  void makeGraph() // line graph for total goals in World Cup
  {
    background(54,54,95);
    textAlign(CENTER);
    fill(255);
    printText("Total goals scored in the World cup, 1938-2014", x, height / 12);
    stroke(255);

    stroke(158, 157, 165);
    strokeWeight(4);
    line(border - 5, height - border, width - border, height - border);
    line(border, border, border, height - border + 5);

    for (int i = 1; i < data.size (); i++)
    {

      stroke(255);
      strokeWeight(2);
      float x1 = map(i-1, 0, data.size() - 1, border, width - border);
      float y1 = map(data.get(i - 1).total, min, max, height - border, border);
      float x2 = map(i, 0, data.size() - 1, border, width - border);
      float y2 = map(data.get(i).total, min, max, height - border, border);

      line(x1, y1, x2, y2);
    }
  }

  void labelYrGoals() // labels the graph for total goals scored in each World Cup
  {

    textFont(font, 16);
    if (mouseX > border && mouseX < width - border)
    {
      stroke(127);
      fill(127);
      line(mouseX, border, mouseX, height - border);
      int i = (int) map(mouseX, border, width - border, 0, data.size());
      y = map(data.get(i).total, min, max, height - border, border);
      
      fill(255);
      text("Year: " + data.get(i).year, mouseX + 55, y + 15);
      text("Total Goals: " + data.get(i).total, mouseX + 55, y + 30);
      text("Host: " + data.get(i).host, border + 390, border + 540);
      fill(0, 255, 0);
      text("Champion: " + data.get(i).champ, border + 390, border + 560);
    }
  }
  
   void pointer()
   {
       pushMatrix();
       translate(mouseX, y);        
       rotate(frameCount/20.0);
       stroke(0);
       fill(127);
       makeStar(0, 0, 20, 10, 5);
       popMatrix();
   }
    
  void display()
  {
    image = loadImage("world-cup-logo.png");
    imageMode(CORNERS);
    image(image, 30, 60, 200, 200);
    
  }
  
  

}
