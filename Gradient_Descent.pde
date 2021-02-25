public class GradientDescent{
  float slope;
  float offset;
  float intercept;
  float learningRate;
 
  
  public GradientDescent(float learningRate,float offset){
    this.learningRate = learningRate; 
    this.offset = offset;
    // Initial values for slope and intercept
    this.slope = 1;
    this.intercept = 0;
  }  
  
  public void linearRegression(ArrayList<PVector> pvectorList){
        
      float interceptStepSize = getInterceptStepSize(pvectorList);
      float slopeStepSize = getSlopeStepSize(pvectorList);   
    
      
      intercept = intercept - interceptStepSize;    
    
      slope = slope - slopeStepSize; 
    
    
    drawLine();
    
    
  }
  private float getSlopeStepSize(ArrayList<PVector> points){
    
   float slopeStepSize = (getSlopeLossFunction(points)) * learningRate;
   
   return slopeStepSize;
    
  }

  private float getInterceptStepSize(ArrayList<PVector> points){
    
    float interceptStepSize = (getInterceptLossFunction(points)) * learningRate;
    
    return interceptStepSize;
    
  }
  
   private float getSlopeLossFunction(ArrayList<PVector> points){
     
     float SS = 0;
     for(PVector p : points){
        SS = SS - (2 * p.x * (p.y - ((slope * p.x) + intercept)));   
      }
      
      return SS;
   }
   private float getInterceptLossFunction(ArrayList<PVector> points){
     
     float SS = 0;
     for(PVector p : points){
             
        SS = SS - (2 * (p.y - ((slope * p.x) + intercept)));   
      }
      
      return SS;
   }
   
    private void drawLine(){
      float x1 = 0;
      float x2 = 1;
      
        
      float y1 = slope * x1 + intercept;
      float y2 = slope * x2 + intercept;
      
      
      x1 = map(x1,0,1,offset,width-offset);
      x2 = map(x2,0,1,offset,width-offset);
  
      
    
      y1 = map(y1,0,1,height - offset,offset);
      y2 = map(y2,0,1,height - offset,offset);
      
      stroke(255);
      String slopeval = String.format("Slope: %5f",slope);
      String interVal = String.format("Y Intercept: %5f",intercept);
      
      text(slopeval,500,20);
      text(interVal,500,40);
      
      line(x1,y1,x2,y2);
    }
   
  
}
