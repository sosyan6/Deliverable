import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class hae extends PApplet {



Movie movie;

int flyX;
int flyY;
int flySpeed = 5;

public void setup()
{
	
	// frameRate( 30 );
	rectMode( CENTER );
	stroke( 0xff000000 );

	movie = new Movie( this, "explode.mp4" );

	flyX = PApplet.parseInt( random( width ) );
	flyY = PApplet.parseInt( random( height ) );
}

public void draw()
{
	background( 0xffFFFFFF );
	drawFly();
	drawSwatter();
}

public void drawFly()
{
	flyX += PApplet.parseInt( random( -flySpeed, flySpeed ) );
	flyY += PApplet.parseInt( random( -flySpeed, flySpeed ) );

	if( flyX < 0 ) 		flyX = 0;
	if( flyX > width ) 	flyX = width;
	if( flyY < 0 ) 		flyY = 0;
	if( flyY > height - 130 ) flyY = height - 130;

	fill( 0xff000000 );
	point( flyX, flyY );
}

public void drawSwatter()
{
	noFill();
	rect( mouseX, mouseY - 180, 80, 100 );
	line( mouseX, mouseY - 130, mouseX, mouseY + 20 );
}

public void mousePressed()
{
	if( flyX > mouseX - 40 &&
		flyX < mouseX + 40 &&
		flyY > mouseY - 230 &&
		flyY < mouseY - 130
	){
		println("clear");
	}else{
		movie.play();
		println("died");
	}
}
  public void settings() { 	size( 800, 800, P2D ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "hae" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
