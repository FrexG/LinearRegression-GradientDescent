float offset = 10;
float pointRadius = 20;
float xMouse;
float yMouse;
float xPoint;
float yPoint;

GradientDescent gd;

ArrayList<PVector> dataPoints = new ArrayList<PVector>();

void setup(){
  //Initialize canvas (width,height)
  size(600,600);
  
  gd = new GradientDescent(0.01,offset);
  
}

void draw(){
  //Draw x-y axis
  background(0);
  stroke(0,255,0);  
  // X-axis
  line(offset,height-offset,width-offset,height-offset);
  text("X",width-offset,height - offset);
  
  //Y-axis
  line(offset,height-offset,offset,offset);
  text("Y",offset,offset);
  
  // Draw points on mouse clicked
  if(dataPoints.size() > 1){
    for(PVector p : dataPoints){
      xPoint = map(p.x,0,1,offset,width - offset);
      yPoint = map(p.y,0,1,height - offset,offset);
      
      circle(xPoint,yPoint,pointRadius);
    }
    gd.linearRegression(dataPoints);
  }
}

//Get mouse cliked position
void mousePressed(){
  //map cursor position between O and 1
  xMouse = map(mouseX,0,width,0,1);
  yMouse = map(mouseY,0,height,1,0);
  
  dataPoints.add(new PVector(xMouse,yMouse)); 

  
}
