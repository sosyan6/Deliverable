import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Re_StackLogic extends PApplet {



Matrix matrix;

public void init()
{
	keyInit();
	matrix = new Matrix( 250, 30 );
}

public void setup()
{
	
	init();
}

public void draw()
{
	background( 0xffFFFFFF );
	matrix.draw();
}
class Block
{
	int blockX;
	int blockY;
	int blockColor;

	Block( int x, int y, int c )
	{
		blockX = x;
		blockY = y;
		blockColor = c;
	}

	Block( int x, int y )
	{
		blockX = x;
		blockY = y;
		blockColor = 0xffFFFFFF;
	}

	public int getX()
	{
		return( blockX );
	}

	public int getY()
	{
		return( blockY );
	}

	public int getColor()
	{
		return( blockColor );
	}

	public void setX( int x )
	{
		blockX = x;
	}

	public void setY( int y )
	{
		blockY = y;
	}

	public void setColor( int c )
	{
		blockColor = c;
	}

	public void move( int x, int y )
	{
		blockX += x;
		blockY += y;
	}
}
HashMap<String, Boolean> keyMap = new HashMap<String, Boolean>();
Boolean isPressed = false;
Boolean isReleased = true;
Boolean isTyped = false;

public void keyInit()
{
	keyMap.put( "left", false );
	keyMap.put( "right", false );
	keyMap.put( "up", false );
	keyMap.put( "down", false );
	keyMap.put( "shift", false );
	keyMap.put( "left", false );
	keyMap.put( "right", false );
	keyMap.put( "up", false );
	keyMap.put( "down", false );
	keyMap.put( "L", false );
	keyMap.put( "R", false );
}

public void keyPressed()
{
	isPressed = true;
	switch( keyCode )
	{
		case 16:
			keyMap.put( "shift", true );
		break;

		case 116:
			init();
		break;
	}

	switch( key )
	{
		case 'a':
			keyMap.put( "left", true );
		break;

		case 'd':
			keyMap.put( "right", true );
		break;

		case 'w':
			keyMap.put( "up", true );
		break;

		case 's':
			keyMap.put( "down", true );
		break;

		case 'k':
			keyMap.put( "L", true );
		break;

		case 'l':
			keyMap.put( "R", true );
		break;
	}
}

public void keyReleased()

{
	isReleased = true;
	switch( keyCode )
	{
		case 16:
			keyMap.put( "shift", false );
		break;
	}

	switch( key )
	{
		case 'a':
			keyMap.put( "left", false );
		break;

		case 'd':
			keyMap.put( "right", false );
		break;

		case 'w':
			keyMap.put( "up", false );
		break;

		case 's':
			keyMap.put( "down", false );
		break;

		case 'k':
			keyMap.put( "L", false );
		break;

		case 'l':
			keyMap.put( "R", false );
		break;
	}
}

public void keyTyped()
{
	isTyped = true;
}
class Matrix
{
	int matrixX;
	int matrixY;
	int blockSize;
	int blockHorizontal;
	int blockVertical;
	int matrixWidth;
	int matrixHeight;
	int borderWeight;
	int frameWeight;
	int nextFrameSize;

	int dropTime;
	int dropCount;
	boolean isCollision;

	int fallTime;
	int fallCount;
	
	TetriMino currentMino;
	TetriMino ghostMino;
	ArrayList<TetriMino> restMino = new ArrayList<TetriMino>();

	Matrix( int x, int y )
	{
		matrixX = x;
		matrixY = y;
		blockSize = 40;
		blockHorizontal = 10;
		blockVertical = 20;
		matrixWidth = blockSize * blockHorizontal;
		matrixHeight = blockSize * blockVertical;
		borderWeight = blockSize / 10;
		frameWeight = blockSize / 2;
		nextFrameSize = blockSize * 4;

		dropTime = 2;
		dropCount = 0;
		isCollision = false;

		fallTime = 20;
		fallCount = 0;

		for( Type t : Type.values() ){
			restMino.add( new TetriMino( t ) );
		}
		Collections.shuffle( restMino );

		currentMino = restMino.get( 0 );
		ghostMino = new TetriMino( currentMino.getType(), currentMino.getRotation() );
		restMino.remove( 0 );
	}

	public void draw()
	{
		drawMatrix();
		drawMino();
	}

	public void drawMatrix()
	{
		translate( matrixX, matrixY );

		// background
		noStroke();
		fill( 0xff444444 );
		rect( 0, 0, matrixWidth, matrixHeight );

		// border
		strokeWeight( borderWeight );
		stroke( 0xff666666 );
		for( int i = 0; i < blockVertical + 1; i++ ){
			line( 0, blockSize * i, matrixWidth, blockSize * i );
		}
		for( int i = 0; i < blockHorizontal + 1; i++ ){
			line( blockSize * i, 0, blockSize * i, matrixHeight );
		}

		// frame
		strokeWeight( frameWeight );
		stroke( 0xff00DDDD );
		noFill();
		rect( -( frameWeight / 2 ) - 1, -( frameWeight / 2 ) - 1, matrixWidth + frameWeight + 2, matrixHeight + frameWeight + 2, frameWeight );

		// hold
		fill( 0xff444444 );
		rect( -nextFrameSize - ( frameWeight / 2 ) - 2, -( frameWeight / 2 ) - 1, nextFrameSize, nextFrameSize, frameWeight );

		// next
		for( int i = 0; i < 4; i++ ){
			rect( matrixWidth + ( frameWeight / 2 ) + 2, -( frameWeight / 2 ) + ( nextFrameSize * i ) - 1, nextFrameSize, nextFrameSize, frameWeight );
		}
	}

	public boolean getCollision()
	{
		if( isCollision ){
			isCollision = false;
			return true;
		}
		return false;
	}

	public void fallMino()
	{
		if( ++fallCount >= fallTime ){
			for( Block b : currentMino.getBlocks() ){
				if( b.getY() >= blockVertical - 1 ){
					isCollision = true;
					break;
				}
			}
			currentMino.move( 0, getCollision() ? 0 : 1 );
			fallCount = 0;
		}
	}

	public void operateMino()
	{
		ghostMino.copy( currentMino );
		for( int y = 0; y < blockVertical; y++ ){
			for( Block b : ghostMino.getBlocks() ){
				if( b.getY() >= blockVertical - 1 ){
					isCollision = true;
					break;
				}
			}
			ghostMino.move( 0, getCollision() ? 0 : 1 );
		}

		if( keyMap.get( "down" ) ){
			if( ++dropCount >= dropTime ){
				for( Block b : currentMino.getBlocks() ){
					if( b.getY() >= blockVertical - 1 ){
						isCollision = true;
						break;
					}
				}
				currentMino.move( 0, getCollision() ? 0 : 1 );
				dropCount = 0;
			}
		}else{
			dropCount = dropTime;
			fallMino();
		}

		if( isTyped ){
			if( keyMap.get( "right" ) ){
				for( Block b : currentMino.getBlocks() ){
					if( b.getX() == blockHorizontal - 1 ){
						isCollision = true;
						break;
					}
				}
				currentMino.move( getCollision() ? 0 : 1, 0 );
			}
			if( keyMap.get( "left" ) ){
				for( Block b : currentMino.getBlocks() ){
					if( b.getX() == 0 ){
						isCollision = true;
						break;
					}
				}
				currentMino.move( getCollision() ? 0 : -1, 0 );
			}
			if( keyMap.get( "up" ) ){
				currentMino.copy( ghostMino );
			}
			isTyped = false;
		}
	}

	public void drawMino()
	{
		operateMino();

		strokeWeight( 1.2f );

		for( Block b : ghostMino.getBlocks() ){
			stroke( 0xff444444 );
			fill( ghostMino.getColor(), 128 );
			rect( blockSize * b.getX(), blockSize * b.getY(), blockSize, blockSize, 2 );
			// stroke( #FFFFFF );
		}
		for( Block b : currentMino.getBlocks() ){
			stroke( 0xff444444 );
			fill( currentMino.getColor() );
			rect( blockSize * b.getX(), blockSize * b.getY(), blockSize, blockSize, 2 );
			// stroke( #FFFFFF );
		}
	}
}
enum Type
{
	I,
	O,
	T,
	L,
	J,
	Z,
	S,
};

class TetriMino
{
	ArrayList<Block> block = new ArrayList<Block>();
	Type type;
	int rotation;
	int blockColor;

	TetriMino( Type t )
	{
		this( t, 0 );
	}

	TetriMino( Type t, int r )
	{
		type = t;
		rotation = r;

		switch( type )
		{
			case I:
				blockColor = 0xff00FFFF;
				switch( rotation )
				{
					case 0:
						block.add( new Block( -1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 2, 0 ) );
					break;
					case 1:
						block.add( new Block( 1, -1 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 1, 1 ) );
						block.add( new Block( 1, 2 ) );
					break;
					case 2:
						block.add( new Block( 2, 1 ) );
						block.add( new Block( 1, 1 ) );
						block.add( new Block( 0, 1 ) );
						block.add( new Block( -1, 1 ) );
					break;
					case 3:
						block.add( new Block( 0, 2 ) );
						block.add( new Block( 0, 1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
					break;
				}
			break;

			case O:
				blockColor = 0xffFFFF00;
				switch( rotation )
				{
					case 0:
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 1, -1 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 0, 0 ) );
					break;
					case 1:
						block.add( new Block( 1, -1 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
					break;
					case 2:
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 1, -1 ) );
					break;
					case 3:
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 1, -1 ) );
						block.add( new Block( 1, 0 ) );
					break;
				}
			break;

			case T:
				blockColor = 0xffFF00FF;
				switch( rotation )
				{
					case 0:
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( -1, 0 ) );
					break;
					case 1:
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 0, 1 ) );
						block.add( new Block( 0, -1 ) );
					break;
					case 2:
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, 1 ) );
						block.add( new Block( -1, 0 ) );
						block.add( new Block( 1, 0 ) );
					break;
					case 3:
						block.add( new Block( 0, 0 ) );
						block.add( new Block( -1, 0 ) );
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 0, 1 ) );
					break;
				}
			break;

			case L:
				blockColor = 0xffFF7700;
				switch( rotation )
				{
					case 0:
						block.add( new Block( 1, -1 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( -1, 0 ) );
					break;
					case 1:
						block.add( new Block( 1, 1 ) );
						block.add( new Block( 0, 1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
					break;
					case 2:
						block.add( new Block( -1, 1 ) );
						block.add( new Block( -1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 1, 0 ) );
					break;
					case 3:
						block.add( new Block( -1, -1 ) );
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, 1 ) );
					break;
				}
			break;

			case J:
				blockColor = 0xff0000FF;
				switch( rotation )
				{
					case 0:
						block.add( new Block( -1, -1 ) );
						block.add( new Block( -1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 1, 0 ) );
					break;
					case 1:
						block.add( new Block( 1, -1 ) );
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, 1 ) );
					break;
					case 2:
						block.add( new Block( 1, 1 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( -1, 0 ) );
					break;
					case 3:
						block.add( new Block( -1, 1 ) );
						block.add( new Block( 0, 1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
					break;
				}
			break;

			case Z:
				blockColor = 0xffFF0000;
				switch( rotation )
				{
					case 0:
						block.add( new Block( -1, -1 ) );
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 1, 0 ) );
					break;
					case 1:
						block.add( new Block( 1, -1 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, 1 ) );
					break;
					case 2:
						block.add( new Block( 1, 1 ) );
						block.add( new Block( 0, 1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( -1, 0 ) );
					break;
					case 3:
						block.add( new Block( -1, 1 ) );
						block.add( new Block( -1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
					break;
				}
			break;

			case S:
				blockColor = 0xff00FF00;
				switch( rotation )
				{
					case 0:
						block.add( new Block( 1, -1 ) );
						block.add( new Block( 0, -1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( -1, 0 ) );
					break;
					case 1:
						block.add( new Block( 1, 1 ) );
						block.add( new Block( 1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, -1 ) );
					break;
					case 2:
						block.add( new Block( -1, 1 ) );
						block.add( new Block( 0, 1 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 1, 0 ) );
					break;
					case 3:
						block.add( new Block( -1, -1 ) );
						block.add( new Block( -1, 0 ) );
						block.add( new Block( 0, 0 ) );
						block.add( new Block( 0, 1 ) );
					break;
				}
			break;
		}

		for( Block b : block ){
			if( b != null ){
				b.setColor( blockColor );
				b.move( 4, 0 );
			}
		}
	}

	public ArrayList<Block> getBlocks()
	{
		return( block );
	}

	public Type getType()
	{
		return( type );
	}

	public int getRotation()
	{
		return( rotation );
	}

	public int getColor()
	{
		return( blockColor );
	}

	public void move( int x, int y )
	{
		for( Block b : block ){
			b.move( x, y );
		}
	}

	public void copy( TetriMino m )
	{
		for( int i = 0; i < m.getBlocks().size(); i++ ){
			block.get( i ).setX( m.getBlocks().get( i ).getX() );
			block.get( i ).setY( m.getBlocks().get( i ).getY() );
		}
	}
}
  public void settings() { 	size( 1600, 900 ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Re_StackLogic" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
