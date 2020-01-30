import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import javax.swing.*; 
import java.awt.*; 
import java.awt.event.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ArisaAntenna extends PApplet {




// import processing.net.*;
SLibrary fieldPadding;
JLayeredPane pane;
JTextField field;
JTextArea area;

enum Scene
{
	SETUP,
	CHAT
};

Scene scene;

public void setup()
{
	
	surface.setResizable( true );
	surface.setTitle( "ありさアンテナ" );
	
	noStroke();

	scene = Scene.CHAT;

	fieldPadding = new SLibrary()
	.setBounds( 10, height - 50, width - 20, 40 )
	.setCorner( 10 )
	.setColor( 0xff222222 )
	;

	Canvas canvas = (Canvas)surface.getNative();
	pane = (JLayeredPane)canvas.getParent().getParent();

	field = new JTextField();
	field.setBounds( 20, height - 50, width - 40, 40 );
	field.setBorder( null );
	field.setForeground( new Color( 0xffFFFFFF ) );
	field.setBackground( new Color( 0xff222222 ) );
	field.setFont( new Font( Font.SANS_SERIF, Font.PLAIN, 16 ) );
	pane.add( field );
	field.addActionListener( new ActionListener(){
		public void actionPerformed( ActionEvent e )
		{
			if( field.getText().equals( "" ) ) return;

			System.out.println( "Input: " + field.getText() );
			field.setText( "" );
		}
	} );
}

public void draw()
{
	background( 51 );
	switch( scene ){
		case SETUP:

		break;
		case CHAT:
			fieldPadding
			.setBounds( 10, height - 50, width - 20, 40 )
			.drawBox();
			field.setBounds( 20, height - 50, width - 40, 40 );
			field.repaint();

			
		break;
	}

	fill( 0xff00FF00 );
	textAlign( LEFT, TOP );
	text( Math.round( frameRate ), 0, 0 );
}
class SLibrary
{
	// General variable

	int objX = 0;
	int objY = 0;
	int objWidth = width;
	int objHeight = height;
	int objMode = CORNER;
	int objCorner[] = { 0, 0, 0, 0 };
	int objColor = 0xffFFFFFF;
	boolean objFlag = false;

	// Label variable

	int labelX = 0;
	int labelY = 0;
	int labelAlign = LEFT;
	int labelVAlign = TOP;
	int labelColor = 0xff000000;
	float labelSize = 10;
	String labelText = "";
	PImage labelIcon;

	// Button variable

	int hoverColor = 0xffDDDDDD;
	int transparency = 255;
	boolean isHover = false;
	boolean isHold = false;
	boolean isClicked = false;
	int clickedButton;

	// TextField variable

	boolean isInput = false;

	// General method

	public SLibrary setPosition( int x, int y )
	{
		objX = x;
		objY = y;
		labelX = x;
		labelY = y;

		return( this );
	}

	public SLibrary setSize( int w, int h )
	{
		objWidth = w;
		objHeight = h;

		return( this );
	}

	public SLibrary setBounds( int x, int y, int w, int h )
	{
		objX = x;
		objY = y;
		labelX = x;
		labelY = y;
		objWidth = w;
		objHeight = h;

		return( this );
	}

	public SLibrary setMode( int m )
	{
		objMode = m;

		return( this );
	}

	public SLibrary setCorner( int r )
	{
		objCorner[0] = r;
		objCorner[1] = r;
		objCorner[2] = r;
		objCorner[3] = r;

		return( this );
	}

	public SLibrary setCorner( int r1, int r2 )
	{
		objCorner[0] = r1;
		objCorner[1] = r1;
		objCorner[2] = r2;
		objCorner[3] = r2;

		return( this );
	}

	public SLibrary setCorner( int r1, int r2, int r3, int r4 )
	{
		objCorner[0] = r1;
		objCorner[1] = r2;
		objCorner[2] = r3;
		objCorner[3] = r4;

		return( this );
	}

	public SLibrary setColor( int c )
	{
		objColor = c;

		return( this );
	}

	public SLibrary switchFlag()
	{
		objFlag = !objFlag;

		return( this );
	}

	public SLibrary switchFlag( boolean b )
	{
		objFlag = b;

		return( this );
	}

	// Label method

	public SLibrary setAlign( int a, int v )
	{
		labelAlign = a;
		labelVAlign = v;

		return( this );
	}

	public SLibrary setLabelPosition( int x, int y )
	{
		labelX = x;
		labelY = y;

		return( this );
	}

	public SLibrary setSize( float s )
	{
		labelSize = s;

		return( this );
	}

	public SLibrary setText( String s )
	{
		labelText = s;

		return( this );
	}

	public SLibrary setLabelColor( int c )
	{
		labelColor = c;

		return( this );
	}

	public SLibrary setIcon( PImage i )
	{
		labelIcon = i;

		return( this );
	}

	// Button method

	public SLibrary setHoverColor( int c )
	{
		hoverColor = c;

		return( this );
	}

	public SLibrary setHoverColor( int c, int a )
	{
		hoverColor = c;
		transparency = a;

		return( this );
	}

	// Draw method
	
	public SLibrary drawBox()
	{
		fill( objColor );
		rectMode( objMode );
		rect( objX, objY, objWidth, objHeight, objCorner[0], objCorner[1], objCorner[2], objCorner[3] );

		return( this );
	}

	public SLibrary drawLabel()
	{
		textAlign( labelAlign, labelVAlign );
		fill( labelColor );
		textSize( labelSize );
		text( labelText, labelX, labelY );

		return( this );
	}

	public SLibrary drawButton()
	{
		getHover();

		isHold = false;
		if( isHover ){
			fill( hoverColor, transparency );
			if( mousePressed ){
				isHold = true;
			}
			cursor( HAND );
		}else{
			fill( objColor );
			cursor( ARROW );
		}

		rectMode( objMode );
		rect( objX, objY, objWidth, objHeight, objCorner[0], objCorner[1], objCorner[2], objCorner[3] );

		return( this );
	}

	public SLibrary drawTextField()
	{
		getHover();

		isHold = false;
		if( isHover ){
			fill( hoverColor, transparency );
			if( mousePressed ){
				isHold = true;
			}
			cursor( TEXT );
		}else{
			fill( objColor );
			cursor( ARROW );
		}

		if( mousePressed ){
			if( isHover ){
				isInput = true;
			}else{
				isInput = false;
			}
		}

		fill( objColor );
		rectMode( objMode );
		rect( objX, objY, objWidth, objHeight, objCorner[0], objCorner[1], objCorner[2], objCorner[3] );

		textAlign( labelAlign, labelVAlign );
		fill( labelColor );
		textSize( labelSize );
		text( labelText, labelX, labelY );

		if( isInput ){
			int w = (int)textWidth( labelText ) + labelX;
			stroke( 0xffFFFFFF );
			if( frameCount % 60 < 30 ){
				line( w + 2, objY + ( objHeight / 2 ) - ( labelSize / 2 ), w + 2, objY + ( objHeight / 2 ) + ( labelSize / 2 ) );
			}
		}

		return( this );
	}

	public void getHover()
	{
		if( objMode == CORNER &&
			mouseX > objX &&
			mouseY > objY &&
			mouseX < objX + objWidth &&
			mouseY < objY + objHeight ||

			objMode == CENTER &&
			mouseX > objX - objWidth / 2 &&
			mouseY > objY - objHeight / 2 &&
			mouseX < objX + objWidth / 2 &&
			mouseY < objY + objHeight / 2
		){
			isHover = true;
		}else{
			isHover = false;
		}
	}
}
  public void settings() { 	size( 854, 480 ); 	smooth( 2 ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ArisaAntenna" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
