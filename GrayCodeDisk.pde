final int[][] grayCodeArr = { 
                  {0, 0, 0, 0},
                  {0, 0, 0, 1},
                  {0, 0, 1, 1},
                  {0, 0, 1, 0},
                  {0, 1, 1, 0},
                  {0, 1, 1, 1},
                  {0, 1, 0, 1},
                  {0, 1, 0, 0},
                  {1, 1, 0, 0},
                  {1, 1, 0, 1},
                  {1, 1, 1, 1},
                  {1, 1, 1, 0},
                  {1, 0, 1, 0},
                  {1, 0, 1, 1},
                  {1, 0, 0, 1},
                  {1, 0, 0, 0} };

final float ARC_ANGLE_MAX = PI;
boolean debug = true;
float widthHalf;
float heightHalf;
float arcDiameter;
float arcRadius;
float arcEndAngle;
color arcColor;
boolean isDrawing = true;

boolean isRunning = true;
boolean saveFrames = true;

float outsideDiameter;
float insideDiameter;
float arcWidth;
float arcLengthPerBit;
int resolution;

void setup() {

  size(800, 600);
  //colorMode(HSB, MyColor.HUE_MAX, MyColor.SAT_MAX, MyColor.BRT_MAX);
  ellipseMode(RADIUS);
  strokeCap(SQUARE);
  widthHalf = width/2;
  heightHalf = height/2;
  arcDiameter = height/2;
  arcRadius = arcDiameter/2;
  arcEndAngle = 0;
  arcColor = 0;

  outsideDiameter = 1000;
  insideDiameter = 200;
  resolution = 8;
  arcWidth = ((outsideDiameter/2) - (insideDiameter/2)) / resolution;
  arcLengthPerBit = TWO_PI/pow(2, resolution);

}


void draw() {
  if (isRunning) {
    background(240);
    //fill(32);
    noFill();
    stroke(arcColor);
    strokeWeight(arcWidth);
    arc(widthHalf, heightHalf, arcRadius, arcRadius, 0, arcEndAngle);
    
    if (arcEndAngle < ARC_ANGLE_MAX) {
      arcEndAngle += .02;
    } else {
      
    }  
  
     if (debug) {
       drawDebug(); 
     }
  }
  if (saveFrames) {
    saveFrame("frames/f####.png");
  }
}

void drawDebug() {
  stroke(arcColor);
  strokeWeight(1);
  ellipse(widthHalf, heightHalf, arcRadius, arcRadius);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      // Increase something
    } else if (keyCode == DOWN) {
      // Decrease something
    }
  } else {
    switch (key) {
      case ' ':
        isRunning = !isRunning;
        break;

      case 'd':
      case 'D':
        debug = !debug;
        break;

      case 'r':
      case 'R':
        //subTenderGrp.reset();
        break;

      case 'f':
      case 'F':
        saveFrames = !saveFrames;
        if (saveFrames) {
          println("Saving frames");
        } else {
          println("No longer saving frames");
        }
        break;

      case 's':
      case 'S':
        //subTenderGrp.toggleHorizons();
        break;
    }
  }
}