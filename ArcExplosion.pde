private float X_MIN;
private float X_MAX;
private float Y_MIN;
private float Y_MAX;
private float INNER_RADIUS_MIN;
private float INNER_RADIUS_MAX;
private float OUTER_RADIUS_MIN;
private float OUTER_RADIUS_MAX;

private final float ANGLE_START_DEG_MIN = 0;
private final float ANGLE_START_DEG_MAX = 359;
private final float LENGTH_DEG_MIN = 10;
private final float LENGTH_DEG_MAX = 360;
private final float HUE_MIN = 0;
private final float HUE_MAX = 350;

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
boolean saveFrames = false;

float outsideDiameter;
float insideDiameter;
float arcWidth;
float arcLengthPerBit;
int resolution;

void setup() {

  size(800, 600);
  X_MIN = width * 0.1;
  X_MAX = width * 0.9;
  Y_MIN = height * 0.1;
  Y_MAX = height * 0.9;
  INNER_RADIUS_MIN = width * 0.01;
  INNER_RADIUS_MAX = width * 0.1;
  OUTER_RADIUS_MIN = width * 0.05;
  OUTER_RADIUS_MAX = width * 0.20;
  ANGLE_START_MIN = 0;
  ANGLE_START_MAX = 360;
  
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

class Arc {
 float x, y;
 float innerRadius;
 float outerRadius;
 int arcHue;

  Arc() {
    x = random(X_MIN, X_MAX);
    y = random(Y_MIN, Y_MAX);
    innerRadius = random(INNER_RADIUS_MIN, INNER_RADIUS_MAX);
    outerRadius = random(OUTER_RADIUS_MIN, OUTER_RADIUS_MAX);
    arcHue = random(HUE_MIN, HUE_MAX);
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