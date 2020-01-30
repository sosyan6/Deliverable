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

public class TrunLogic extends PApplet {


String path[] = {
	"./DataFile/data1.txt",
	"./DataFile/data2.txt",
	"./DataFile/data3.txt",
	"./DataFile/data4.txt",
	"./DataFile/data5.txt"
};

MakeBox[] makebox;

String[] data;


float size;
float xspace = 200;
float yspace = 200;
float cleartime = 0;

int[] check;
int wlen;
int maxlen;
int max;
int objnum;
int frame;
int clickCount = 0;
int are = 0;

boolean titleClick = false;
boolean menuClick  = false;
boolean clearClick = false;
boolean isClear    = false;
boolean isPlaying  = false;
boolean isReset    = false;
boolean isBack     = false;
boolean isClicked  = true;

class MakeBox {

	float size1;
	float size2;
	int status;
	boolean turn;

	MakeBox( int s, float x, float y ){

		size1 = x;
		size2 = y; 
		status = s;

	}


	public void drawBox( ){

		rectMode( CORNER );

		if( status == 0 )
			fill( 0xffFFFFFF );

		else if( status == 1 )
			fill( 0xff00EEEE );

		if( ( mouseX > size1 - size  && mouseX < size1 + ( size * 2 ) && mouseY > size2 && mouseY < size2 + size && mouseX > xspace && mouseY > yspace && mouseX < xspace + size * max && mouseY < yspace + size * max ) ||
			( mouseX > size1 && mouseX < size1 + size && mouseY > size2 - size && mouseY < size2 + ( size * 2 ) && mouseX > xspace && mouseY > yspace  && mouseX < xspace + size * max && mouseY < yspace + size * max  ) ){
			// if( status == 0 )	
				stroke( 0xff00CCCC );
				noFill();
			// else if( status == 1 )
			// 	fill( #AADDDD );
		}
		rect( size1, size2, size + 5, size + 5 );
	}

	public int isPosition( ){
	if ( mouseX > size1 && mouseX < size1 + size && mouseY > size2 && mouseY < size2 + size )
		return 1;
	else
		return 0;
	}

	public void flip(){

		if( status == 1 )
			status = 0;
		
		else
			status = 1;

	}

	public int check(){

		if( status == 1 )
			return 1;

		else
			return 0;

	}

	public void setStatus( int a ){

		status = a;

	}

}

public void makeObject( int p ){

	objnum = 0;

	int checklen;

	data  = loadStrings( path[p] );

	if( data[0].length() != data[1].length() )
		data[0] = data[0].substring( 1, data[0].length() );

	wlen  = data.length;

	for( int a = 0; a < wlen; a++ )
	{
		objnum += data[a].length();
		
		if( maxlen < data[a].length() )
			maxlen = data[a].length();

	}

	makebox = new MakeBox[objnum];

	objnum = 0;

	if( wlen > maxlen ){
		size = ( height - 200 ) / wlen;
		xspace += ( wlen - maxlen ) * size;
		max = wlen;
	}


	else if( wlen < maxlen ){
		size = ( width - 200 ) / maxlen;		
		yspace += ( maxlen - wlen ) * size;
		max = maxlen;
	}

	else{
		max = wlen;
		size = ( width - 200 ) / maxlen;
	}

	for( int a = 0; a < wlen; a++ ){


		for( int s = 0; s < data[a].length(); s++ ){

			makebox[objnum] = new MakeBox( PApplet.parseInt( data[a].substring( s, s + 1 ) ), xspace + ( s * size ), yspace + ( a * size ) );
		
			objnum++;

		}
	}	
}

public void drawRect(){

	fill( 0xffAAAAAA );

	rect( 200, 200, max * size, max * size );

	objnum = 0;

	for( int a = 0; a < data.length; a++ ){

		for( int s = 0; s < data[a].length(); s++ ){

			makebox[objnum].drawBox();

			objnum++;
		}
	}	


}


public void mouseClicked(){

	if( !isPlaying )
		return;

	if( are == 0 ){
		are++;
		return;
	}
	
	if( mouseX > xspace && mouseX < xspace + ( size * max ) && mouseY > yspace && mouseY < yspace + ( size * max ) )
		clickCount++;

	int count = 0;

	boolean nowPosition;

	loop:for( int a = 0; a < data.length; a++ ){

		for( int s = 0; s < data[a].length(); s++ ){

			if( makebox[count].isPosition() == 1 ){

				makebox[count].flip();

				if( count % maxlen != 0 )
					makebox[count - 1].flip();

				if( count % maxlen != maxlen - 1 )
					makebox[count + 1].flip();

				if( count - maxlen >= 0 )
					makebox[count - maxlen].flip();

				if( count + maxlen < maxlen * wlen )
					makebox[count + maxlen].flip();

				break loop;
			}

			count++;
		}
	}
}



public void clearCheck(){

	int count = 0;

	for( int a = 0; a < data.length; a++ ){

		for( int s = 0; s < data[a].length(); s++ ){

			if( makebox[count].check() != 1 )
				return;

			count++;

		}

	}

	isClear = true;

}

public void title(){

	background( 0xffFFFFFF );
	fill( 0xff555555, frameCount * 5 );
	textAlign( CENTER, CENTER );
	textSize( 64 );
	text( "- T R U N R O G I C -", width / 2, height / 2 - 40 );
	textSize( 32 );
	text( "Click mouse to start", width / 2, height / 2 + 40 );
	if( frameCount < 255 )
		frameCount++;

	if( mousePressed && isClicked ){

		isClicked = false;
	
		titleClick = true;
	}
}

public void menu(){

	background( 0xffFFFFFF );

	strokeWeight( 5 );
	textSize( 64 );
	fill( 0xff555555 );
	text( "Select a STEP", width / 2, height / 2 - 140 );
	stroke( 0xff555555 );
	rectMode( CENTER );

	for( int h = 1; h <= 5; h++ ){
		fill( 0xffFFFFFF );
		rect( width * h / 6, height / 2, 100, 100 );
		textSize( 20 );
		fill( 0xff555555 );
		text( "STEP0" + h, width * h / 6, height / 2 );
	}

	if( mousePressed && isClicked ){
		for( int h = 1; h <= 5; h++ ){
			if( mouseY > height / 2 - 50 &&
				mouseY < height / 2 + 50 ){
				if( mouseX > width * h / 6 - 50 &&
					mouseX < width * h / 6 + 50 ){
					makeObject( h - 1 );
					menuClick = true;
				}
			}
		}
	}

}

public void reset(){

	objnum = 0;

	for( int a = 0; a < data.length; a++ ){


		for( int s = 0; s < data[a].length(); s++ ){

			makebox[objnum].setStatus( PApplet.parseInt( data[a].substring( s, s + 1 ) ) );
		
			objnum++;

		}
	}



}

public void clear()
{
	if( frame * 10 < 240 ){
		frame++;
	}
	fill( 0xffFFFFFF, frame * 10 );

	noStroke();
	rect( 0, height * 2 / 6, width, height * 2 / 6 );
	stroke( 0xff555555, frame * 10 );
	line( 0, height * 2 / 6, width, height * 2 / 6 );
	line( 0, height * 4 / 6, width, height * 4 / 6 );

	fill( 0xff555555, frame * 10 );
	textSize( 64 );
	textAlign( CENTER, CENTER );
	text( "G A M E   C L E A R !", width / 2, height / 2 );
	if( isClicked && mousePressed ){
		isClear = false;
		isClicked = false;
		init();
	}
}

public void mouseReleased() {
	
	isClicked = true;
}

public void keyPressed(){

	if( !isPlaying )
		return;

	if( keyCode == 116 )
		isReset = true;

	if( keyCode == 114 )
		isBack = true;

}

public void init(){

menuClick  = false;
clearClick = false;
isPlaying  = false;
frame 	   = 0;
clickCount = 0;
maxlen 	   = 0;
xspace	   = 200;
yspace	   = 200;
cleartime = 0;
are       = 0;
textAlign( CENTER );

}

public void setup() {

	

}


public void draw(){

	if( !titleClick )
		title();

	else if( titleClick && !menuClick )
		menu();

	else if( titleClick && menuClick && !isClear ){
		isPlaying = true;
		background( 0xffFFFFFF );
		fill( 0xff000000 );
		textAlign( LEFT );
		text( "Time:" + nf( cleartime ,0 ,3 ) + "\nClick:" + clickCount , width / 10, height / 10 );
		drawRect();
		clearCheck();
		cleartime +=  1.0f / 60.0f;
		}

	if( isReset ){
		isReset = false;
		reset();
	}

	if( isBack ){
		isBack = false;
		init();

	}

	if( isClear )
		clear();

}
  public void settings() { 	size( 600, 600 ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TrunLogic" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
