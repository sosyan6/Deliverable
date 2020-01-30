import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class TrigFunc extends PApplet {

float goalX;
float goalY;
int pointNum = 150;
boolean isClicked = false;

class Point{

    float x;
    float y;
    float r;
    float a;
    float sina;
    float cosa;

    Point( float a, float b, float c ){
        x = a;
        y = b;
        r = c;
    }

    public void draw(){

        translate( x, y );
        a = atan2( y - goalY, x - goalX );
        translate( -x, -y );
        sina = sin( a ) * r;
        cosa = cos( a ) * r;

        x -= cosa;
        y -= sina;
        if( ( goalX - x ) > -5 && ( goalY - y ) > -5 && ( goalX - x ) < 5 && ( goalY - y ) < 5 ) fill( 0xffff5555 );
        else fill( 0xffffffff );
        ellipse( x, y, 10, 10 );
        line( x, y, goalX, goalY );
    }

}

Point p[] = new Point[pointNum];

public void setup()
{
    
    for( int a = 0; a < pointNum; a++ ){
        p[a] = new Point( random( width ), random( height ), 0.0f );
    }
}

public void draw()
{
    background( 0 );
    stroke( 0xffFFFFFF );

    if( mousePressed ){
        goalX = mouseX;
        goalY = mouseY;
        isClicked = true;
    }
    
    if( isClicked ){
        ellipse( goalX, goalY, 10, 10 );
        for( int a = 0; a < pointNum; a++ ){
        p[a].draw();
        }
    }
}
  public void settings() {  size( 854, 480 ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TrigFunc" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
