void setup()
{
    size(950,700);
    loadData();
    MinMax();
    border = displayWidth * 0.0752f;
    font = loadFont("Rockwell-48.vlw");

    radius = width / 2;
    centX = width * 0.5f;
    centY = height * 0.5f;

}

TotalGoals go = new TotalGoals();
GoalsPerTeam create = new GoalsPerTeam();
Animations build = new Animations();

// initialising global variables
PFont font;
PImage image;
float min, max;
float radius;
float centX, centY;
int Y;
int mode = 0;

ArrayList<TotalGoals> data = new ArrayList<TotalGoals>();
ArrayList<GoalsPerTeam> gpt = new ArrayList<GoalsPerTeam>();

float border;
float textY = (border *  0.5f);

// Load data from all files containing datasets
void loadData()
{
    String[] lines = loadStrings("totalgoals.csv");
    for(String line: lines)
    {
        TotalGoals goals = new TotalGoals(line);
        data.add(goals);
    }
    
    String[] parts = loadStrings("goalsfor2014.csv");
    for(String lin: parts)
    {  
        GoalsPerTeam count = new GoalsPerTeam(lin);
        gpt.add(count);
    }
    
}

// for makeGraph()
void MinMax()
{
   min = max = data.get(0).total;
   for (TotalGoals goals:data)
   {
       if (goals.total < min)
       {
          min = goals.total;
       }
       if (goals.total > max)
       {
           max = goals.total;
       }
   }
   
}

// sets the font face and size for text and position
void printText(String text, float size, float y)
{
    textFont(font,40);
   float x = width * 0.5f;
    text(text, x, y);

}


// menu to select which visualisation you want to see
void menu()
{
    centX = width/2;
    centY = height/2;
    background(200,208,247);
    fill(255);
    textAlign(CENTER);
    printText("World Cup Statistics (GOALS)", 50, 100);
    fill(173,187,255);
    printText("1: Total Goals per World Cup", 32, 200);
    fill(54,54,95);
    printText("2: WC 2014 - Goals Scored Per Team", 32, 300); 
    image = loadImage("mascot.png");
    imageMode(CENTER);
    image(image, centX, centY + 130, 400, 250);
}

void draw()
{
  // functions the menu
  switch (mode)
  {     
    case 0:  // press 0 to go back to menu
      menu();
      break;
    case 1:
      go.makeGraph();
      go.pointer();
      go.labelYrGoals();
      go.display();
      build.star1();
      break;
    case 2:
      create.BarChart();
      build.star2();
      break;
  }    
}

// if key is pressed, this number is put into variable 'mode'
void keyPressed()
{
    if (key >= '0' && key <= '9') 
    {
       mode = key - '0';
    }
    println(mode);
}
