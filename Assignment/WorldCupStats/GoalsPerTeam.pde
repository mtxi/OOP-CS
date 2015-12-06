class GoalsPerTeam extends TotalGoals
{
  String team;
  int goalsfor;
  float col,x,y;
  
  // divides the given dataset and puts them into the appropriate fields
   GoalsPerTeam(String perline)
   {
       String[] fields = perline.split(",");
       team = fields[0];
       goalsfor = Integer.parseInt(fields[1]);    
   }
  
  GoalsPerTeam()
  {
      
  }
  
  // Making bar chart for total number of goals (for) per team - 2014
  void BarChart()
  { 
      background(54,54,95);
      int sum = 0;
      for (GoalsPerTeam count:gpt)
      {
          sum += count.goalsfor;
    
      }
      
      // finding minimum index
      float min = gpt.get(0).goalsfor;
      int minIndex = 0;
      for (int i = 1; i < gpt.size(); i++)
      {
          if (gpt.get(i).goalsfor < min)
          {
              min = gpt.get(i).goalsfor;
              minIndex = i;
          }
          
      }
      
      //finding maximum index
      float max = gpt.get(0).goalsfor;
      int maxIndex = 0;
      for (int j = 1; j < gpt.size(); j++)
      {
          if (gpt.get(j).goalsfor > max)
          {
              max = gpt.get(j).goalsfor;
              maxIndex = j;
      
          }
      }
      
      // creating the barchart
      float barWidth = width / (float) gpt.size();
      boolean hover = false;
      float scale = height / 30;
      barWidth = width / (float) gpt.size();
      for (int i = 0; i < gpt.size(); i++)
      {
          x = i * barWidth;
          y = gpt.get(i).goalsfor * scale;
          col = map(y, 0, max * scale, 255, 100);
          stroke(209);
          strokeWeight(1);
          fill(col/3, 0, random(col/4,col/2));
          rect(x, height, barWidth, - y);
          
       
      }
      
      textAlign(CENTER,CENTER);
      fill(255);
      printText("Goals scored per team, 2014   (Total "  + sum + ")", width * 0.5f, width * 0.09f);
      
      int i = (int) map(mouseX, barWidth / gpt.size(), width - barWidth, 0, gpt.size() - 1);
      float y = map(gpt.get(i).goalsfor, min, max*2, height - barWidth, barWidth);

      x = i*barWidth;
      float by = gpt.get(i).goalsfor*scale;
      
      // labeling the bars with its corresponding data if  over a specific bar
        if ( mouseX > x /(barWidth*2) && mouseX < x + (barWidth - 1)
          && mouseY > height - by && mouseY < height + by)
        {
           fill(200,208,247);
           textFont(font,18);
           textAlign(CENTER);
           text(gpt.get(i).team + ": " + gpt.get(i).goalsfor + " goals", 480, 200);
           
           // creates a cursor to see which bar is hovered
           fill(255);
           ellipse(mouseX, mouseY, 15, 15);
           
           
        }

  }
  

}
