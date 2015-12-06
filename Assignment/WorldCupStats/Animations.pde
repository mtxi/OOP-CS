class Animations
{
    float angle;
    float hfangle;
    
    Animations()
    {
        
    }
    
    void makeStar(float x, float y, float r1, float r2, int npts)
    {
        hfangle = angle / 2;
        angle = TWO_PI / npts;
        beginShape();
        for (float a = 0; a < TWO_PI; a += angle)
        {
            float sx = x + cos(a) * r2;
            float sy = y + sin(a) * r2;
            vertex(sx, sy);
            sx = x + cos(a + hfangle) * r1;
            sy = y + sin(a + hfangle) * r1;
            vertex(sx, sy);
        }
        endShape(CLOSE);
    }
    
    
    void star1()
    {
        pushMatrix();
        translate((width*0.7), height*0.93);
        rotate(frameCount/60.0);
        stroke(0);
        fill(random(0,255));
        makeStar(0, 0, 30, 40, 30);
        popMatrix();
        
        pushMatrix();
        translate((width*0.34), height*0.93);
        rotate(frameCount/60.0);
        stroke(0);
        fill(random(0,255));
        makeStar(0, 0, 30, 40, 30);
        popMatrix();
        
    }
    
    void star2()
    {
        pushMatrix();
        translate((width*0.38), height*0.28);
        rotate(frameCount/60.0);
        stroke(0);
        fill(random(50,255));
        makeStar(0, 0, 10, 30, 8);
        popMatrix();
        
        pushMatrix();
        translate((width*0.63), height*0.28);
        rotate(frameCount/60.0);
        stroke(0);
        fill(random(50,255));
        makeStar(0, 0, 10, 30, 8);
        popMatrix();
    }
    
}
