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

public class Kamaboko extends PApplet {

int rectSize = 15;

public void setup()
{
	
	background( 0xffFFFFFF );

	rectMode( CENTER );
	stroke( 0xff000000 );
	fill( 0xffFFFFFF );

	for( int i = -5; i <= 5; i++ ){
		float y = sqrt( ( 25 * rectSize ) - sq( i ) );
		println( y );
		rect( ( width / 2 ) + ( i * rectSize ), height / 2 + y, rectSize, rectSize );
	}

	line( 0, height / 2, width, height / 2 );
	line( width / 2, 0, width / 2, height );
}

public void draw()
{
	
}
  public void settings() { 	size( 854, 480 ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Kamaboko" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
