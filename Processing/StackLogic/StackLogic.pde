import java.security.SecureRandom;

class Block
{
	int blockX;
	int blockY;
	color blockColor;

	Block( int x, int y, color c )
	{
		blockX = x;
		blockY = y;
		blockColor = c;
	}

	int getX()
	{
		return( blockX );
	}

	int getY()
	{
		return( blockY );
	}

	color getColor()
	{
		return( blockColor );
	}

	void setX( int x )
	{
		blockX = x;
	}

	void setY( int y )
	{
		blockY = y;
	}

	void setColor( color c )
	{
		blockColor = c;
	}
}

class Mino
{
	Block block[] = new Block[8];
	String minoType;
	int minoWidth;
	int minoHeight;
	int rotation;

	Mino( String type, int r )
	{
		minoType = type;
		rotation = r;
		color blockColor;

		switch( type )
		{
			case "I":
				blockColor = #00FFFF;
				minoWidth = 4;
				minoHeight = 1;
				switch( r ){
					case 0:
						block[0] = new Block( 3, 0, blockColor );
						block[1] = new Block( 4, 0, blockColor );
						block[2] = new Block( 5, 0, blockColor );
						block[3] = new Block( 6, 0, blockColor );
					break;
					case 1:
						block[0] = new Block( 5, -1, blockColor );
						block[1] = new Block( 5, 0, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 2, blockColor );
					break;
					case 2:
						block[0] = new Block( 6, -1, blockColor );
						block[1] = new Block( 5, -1, blockColor );
						block[2] = new Block( 4, -1, blockColor );
						block[3] = new Block( 3, -1, blockColor );
					break;
					case 3:
						block[0] = new Block( 4, 2, blockColor );
						block[1] = new Block( 4, 1, blockColor );
						block[2] = new Block( 4, 0, blockColor );
						block[3] = new Block( 4, -1, blockColor );
					break;
				}
			break;

			case "O":
				blockColor = #FFFF00;
				minoWidth = 2;
				minoHeight = 2;
				switch( r ){
					case 0:
						block[0] = new Block( 4, 0, blockColor );
						block[1] = new Block( 4, 1, blockColor );
						block[2] = new Block( 5, 0, blockColor );
						block[3] = new Block( 5, 1, blockColor );
					break;
					case 1:
						block[0] = new Block( 4, 1, blockColor );
						block[1] = new Block( 5, 0, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 4, 0, blockColor );
					break;
					case 2:
						block[0] = new Block( 5, 0, blockColor );
						block[1] = new Block( 5, 1, blockColor );
						block[2] = new Block( 4, 0, blockColor );
						block[3] = new Block( 4, 1, blockColor );
					break;
					case 3:
						block[0] = new Block( 5, 1, blockColor );
						block[1] = new Block( 4, 0, blockColor );
						block[2] = new Block( 4, 1, blockColor );
						block[3] = new Block( 5, 0, blockColor );
					break;
				}
			break;

			case "T":
				blockColor = #FF00FF;
				minoWidth = 3;
				minoHeight = 2;
				switch( r ){
					case 0:
						block[0] = new Block( 4, 1, blockColor );
						block[1] = new Block( 5, 1, blockColor );
						block[2] = new Block( 6, 1, blockColor );
						block[3] = new Block( 5, 0, blockColor );
					break;
					case 1:
						block[0] = new Block( 5, 0, blockColor );
						block[1] = new Block( 5, 1, blockColor );
						block[2] = new Block( 5, 2, blockColor );
						block[3] = new Block( 6, 1, blockColor );
					break;
					case 2:
						block[0] = new Block( 6, 1, blockColor );
						block[1] = new Block( 5, 1, blockColor );
						block[2] = new Block( 4, 1, blockColor );
						block[3] = new Block( 5, 2, blockColor );
					break;
					case 3:
						block[0] = new Block( 5, 2, blockColor );
						block[1] = new Block( 5, 1, blockColor );
						block[2] = new Block( 5, 0, blockColor );
						block[3] = new Block( 4, 1, blockColor );
					break;
				}
			break;

			case "L":
				blockColor = #FF7700;
				minoWidth = 3;
				minoHeight = 2;
				switch( r ){
					case 0:
						block[0] = new Block( 6, 0, blockColor );
						block[1] = new Block( 4, 1, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 6, 1, blockColor );
					break;
					case 1:
						block[0] = new Block( 6, 2, blockColor );
						block[1] = new Block( 5, 0, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 2, blockColor );
					break;
					case 2:
						block[0] = new Block( 4, 2, blockColor );
						block[1] = new Block( 6, 1, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 4, 1, blockColor );
					break;
					case 3:
						block[0] = new Block( 4, 0, blockColor );
						block[1] = new Block( 5, 2, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 0, blockColor );
					break;
				}
			break;

			case "J":
				blockColor = #0000FF;
				minoWidth = 3;
				minoHeight = 2;
				switch( r ){
					case 0:
						block[0] = new Block( 4, 0, blockColor );
						block[1] = new Block( 4, 1, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 6, 1, blockColor );
					break;
					case 1:
						block[0] = new Block( 6, 0, blockColor );
						block[1] = new Block( 5, 0, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 2, blockColor );
					break;
					case 2:
						block[0] = new Block( 6, 2, blockColor );
						block[1] = new Block( 6, 1, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 4, 1, blockColor );
					break;
					case 3:
						block[0] = new Block( 4, 2, blockColor );
						block[1] = new Block( 5, 2, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 0, blockColor );
					break;
				}
			break;

			case "Z":
				blockColor = #FF0000;
				minoWidth = 3;
				minoHeight = 2;
				switch( r ){
					case 0:
						block[0] = new Block( 4, 0, blockColor );
						block[1] = new Block( 5, 0, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 6, 1, blockColor );
					break;
					case 1:
						block[0] = new Block( 6, 0, blockColor );
						block[1] = new Block( 6, 1, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 2, blockColor );
					break;
					case 2:
						block[0] = new Block( 6, 2, blockColor );
						block[1] = new Block( 5, 2, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 4, 1, blockColor );
					break;
					case 3:
						block[0] = new Block( 4, 2, blockColor );
						block[1] = new Block( 4, 1, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 0, blockColor );
					break;
				}
			break;

			case "S":
				blockColor = #00FF00;
				minoWidth = 3;
				minoHeight = 2;
				switch( r ){
					case 0:
						block[0] = new Block( 6, 0, blockColor );
						block[1] = new Block( 5, 0, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 4, 1, blockColor );
					break;
					case 1:
						block[0] = new Block( 6, 2, blockColor );
						block[1] = new Block( 6, 1, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 0, blockColor );
					break;
					case 2:
						block[0] = new Block( 4, 2, blockColor );
						block[1] = new Block( 5, 2, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 6, 1, blockColor );
					break;
					case 3:
						block[0] = new Block( 4, 0, blockColor );
						block[1] = new Block( 4, 1, blockColor );
						block[2] = new Block( 5, 1, blockColor );
						block[3] = new Block( 5, 2, blockColor );
					break;
				}
			break;

			case "Puttyo":
				block[0] = new Block( 1, 1, #FFFFFF );
				block[1] = new Block( 2, 2, #FFFFFF );
				block[2] = new Block( 3, 1, #FFFFFF );
				block[3] = new Block( 4, 2, #FFFFFF );
				block[4] = new Block( 1, 1, #FFFFFF );
				block[5] = new Block( 2, 2, #FFFFFF );
				block[6] = new Block( 3, 1, #FFFFFF );
				block[7] = new Block( 4, 2, #FFFFFF );
			break;
		}
	}

	int getX( int b )
	{
		return( block[b].getX() );
	}

	int getY( int b )
	{
		return( block[b].getY() );
	}

	int getWidth()
	{
		return( minoWidth );
	}

	int getHeight()
	{
		return( minoHeight );
	}

	String getMinoType()
	{
		return( minoType );
	}

	int getRotation()
	{
		return( rotation );
	}

	color getColor( int b )
	{
		return( block[b].getColor() );
	}

	void setX( int x )
	{
		for( int i = 0; i < 4; i++ ){
			block[i].setX( x );
		}
	}

	void setX( int b, int x )
	{
		block[b].setX( x );
	}

	void setY( int y )
	{
		for( int i = 0; i < 4; i++ ){
			block[i].setY( y );
		}
	}

	void setY( int b, int y )
	{
		block[b].setY( y );
	}
}

int fieldX;
int fieldY;
int blockSize;
int frameWeight;

boolean isLeft;
boolean isRight;
boolean isUp;
boolean isDown;
boolean isShift;
boolean isTurnLeft;
boolean isTurnRight;
boolean isPressed;
boolean isReleased;

int confirmCount;

Mino mino;
Mino tmpMino;
Mino stackMino;
Mino ghostMino;
Mino nextMino[];
Block fieldBlock[][];

void setup()
{
	size( 1600, 900 );
	init();
}

void init()
{
	fieldX = 250;
	fieldY = 30;
	blockSize = 40;
	frameWeight = 20;
	isReleased = true;
	isLeft = false;
	isRight = false;
	isUp = false;
	isDown = false;
	isShift = false;
	confirmCount = 0;
	nextMino = new Mino[5];
	for( int i = 0; i < 5; i++ ){
		nextMino[i] = createMino();
		if( i != 0 && nextMino[i] == nextMino[i - 1] ){
			nextMino[i] = createMino();
		}
	}
	mino = nextMino[0];
	tmpMino = new Mino( mino.getMinoType(), mino.getRotation() );
	ghostMino = new Mino( mino.getMinoType(), mino.getRotation() );
	stackMino = null;

	fieldBlock = new Block[10][20];
}

void draw()
{
	// println( frameRate );
	background( #FFFFFF );
	drawField();
	drawMino();
	drawFieldBlock();
}

void drawField()
{
	// background
	noStroke();
	fill( #444444 );
	rect( fieldX, fieldY, blockSize * 10, blockSize * 20 );
	
	// border
	strokeWeight( 4 );
	stroke( #666666 );
	for( int i = 0; i < 11; i++ ){
		line( fieldX + ( blockSize * i ), fieldY, fieldX + ( blockSize * i ), fieldY + ( blockSize * 20 ) );
	}
	for( int i = 0; i < 21; i++ ){
		line( fieldX, fieldY + ( blockSize * i ), fieldX + ( blockSize * 10 ), fieldY + ( blockSize * i ) );
	}

	// frame
	strokeWeight( frameWeight - 1 );
	stroke( #00DDDD );
	noFill();
	rect( fieldX - ( frameWeight / 2 ) - 1, fieldY - ( frameWeight / 2 ) - 1, ( blockSize * 10 ) + frameWeight + 2, ( blockSize * 20 ) + frameWeight + 2, 4 );

	// hold
	fill( #444444 );
	rect( fieldX - 150 - ( frameWeight / 2 ) - 2, fieldY - ( frameWeight / 2 ) - 1, 150, 150, 4 );

	// next
	for( int i = 0; i < 4; i++ ){
		rect( fieldX + ( blockSize * 10 ) + ( frameWeight / 2 ) + 2, ( fieldY - ( frameWeight / 2 ) ) + ( 150 * i ) - 1, 150, 150, 4 );
	}

	if( stackMino != null ){
		strokeWeight( 1 );
		stroke( #AAAAAA );
		rectMode( CENTER );
		pushMatrix();
		translate( fieldX - 150 - ( frameWeight / 2 ) + ( 150 / 2 ), fieldY - ( frameWeight / 2 ) + ( 150 / 2 ) + ( 150 * ( 1 - 1 ) ) );
		if( stackMino.getWidth()  % 2 == 0 ) 	translate( ( blockSize * 0.8 / 2 ), 0 );
		if( stackMino.getHeight() % 2 == 0 ) 	translate( 0, ( blockSize * 0.8 / 2 ) );
		if( stackMino.getWidth() == 4 ) 		translate( 0, ( blockSize * 0.8 ) );
		for( int i = 0; i < 4; i++ ){
			fill( stackMino.getColor( i ) );
			rect( blockSize * 0.8 * ( stackMino.getX( i ) - 5 ) + 2, blockSize * 0.8 * ( stackMino.getY( i ) - 1 ) - 1, blockSize * 0.8, blockSize * 0.8 );
			// println( stackMino.getMinoType() );
		}
		popMatrix();
		rectMode( CORNER );
	}

	strokeWeight( 1 );
	stroke( #AAAAAA );
	rectMode( CENTER );
	for( int i = 1; i < 5; i++ ){
		pushMatrix();
		translate( fieldX + ( blockSize * 10 ) + ( frameWeight / 2 ) + ( 150 / 2 ), fieldY - ( frameWeight / 2 ) + ( 150 / 2 ) + ( 150 * ( i - 1 )) );
		if( nextMino[i].getWidth()  % 2 == 0 ) 	translate( ( blockSize * 0.8 / 2 ), 0 );
		if( nextMino[i].getHeight() % 2 == 0 ) 	translate( 0, ( blockSize * 0.8 / 2 ) );
		if( nextMino[i].getWidth() == 4 ) 		translate( 0, ( blockSize * 0.8 ) );
		for( int j = 0; j < 4; j++ ){
			fill( nextMino[i].getColor( j ) );
			rect( blockSize * 0.8 * ( nextMino[i].getX( j ) - 5 ) + 2, blockSize * 0.8 * ( nextMino[i].getY( j ) - 1 ) - 1, blockSize * 0.8, blockSize * 0.8 );
		}
		popMatrix();
	}
	rectMode( CORNER );
}

void drawMino()
{
	boolean isCollision = false;

	if( isPressed && isReleased ){
		if( isShift ){
			if( stackMino == null ){
				stackMino = new Mino( mino.getMinoType(), mino.getRotation() );
				for( int i = 0; i < 4; i++ ){
					nextMino[i] = nextMino[ i + 1 ];
				}
				nextMino[4] = createMino();	
				if( nextMino[4] == nextMino[3] ){
					nextMino[4] = createMino();
				}
				mino = nextMino[0];
				tmpMino = new Mino( mino.getMinoType(), mino.getRotation() );
			}else{
				tmpMino = new Mino( stackMino.getMinoType(), 0 );
				stackMino = new Mino( mino.getMinoType(), 0 );
				mino = new Mino( tmpMino.getMinoType(), 0 );
				tmpMino = new Mino( mino.getMinoType(), mino.getRotation() );
			}
		}
		if( isUp ){
			for( int i = 0; i < 20; i++ ){
				for( int j = 0; j < 4; j++ ){
					if( mino.getY( j ) > 18 ){
						isCollision = true;
					}
				}
				for( int j = 0; j < 10; j++ ){
					for( int k = 0; k < 20; k++ ){
						for( int l = 0; l < 4; l++ ){
							if( fieldBlock[j][k] == null ) break;
							if( mino.getX( l ) == fieldBlock[j][k].getX() &&
								mino.getY( l ) == fieldBlock[j][k].getY() - 1 )
							{
								isCollision = true;
							}
						}
					}
				}
				if( !isCollision ){
					for( int j = 0; j < 4; j++ ){
						mino.setY( j, mino.getY( j ) + 1 );
					}
					confirmCount = 80;
				}
				isCollision  = false;
			}
		}
	}
	
	if( keyPressed && frameCount % 2 == 0 ){
		if( !( isLeft && isRight ) ){
			if( isLeft ){
				for( int i = 0; i < 4; i++ ){
					if( mino.getX( i ) <= 0 ){
						isCollision = true;
						break;
					}
				}
				for( int i = 0; i < 10; i++ ){
					for( int j = 0; j < 20; j++ ){
						for( int k = 0; k < 4; k++ ){
							if( fieldBlock[i][j] == null ) break;
							if( mino.getX( k ) == fieldBlock[i][j].getX() + 1 &&
								mino.getY( k ) == fieldBlock[i][j].getY() )
							{
								isCollision = true;
							}
						}
					}
				}
				if( !isCollision ){
					for( int i = 0; i < 4; i++ ){
						mino.setX( i, mino.getX( i ) - 1 );
						ghostMino.setX( i, ghostMino.getX( i ) - 1 );
					}
				}
			}
			if( isRight ){
				for( int i = 0; i < 4; i++ ){
					if( mino.getX( i ) >= 9 ){
						isCollision = true;
						break;
					}
				}
				for( int i = 0; i < 10; i++ ){
					for( int j = 0; j < 20; j++ ){
						for( int k = 0; k < 4; k++ ){
							if( fieldBlock[i][j] == null ) break;
							if( mino.getX( k ) == fieldBlock[i][j].getX() - 1 &&
								mino.getY( k ) == fieldBlock[i][j].getY() )
							{
								isCollision = true;
							}
						}
					}
				}
				if( !isCollision ){
					for( int i = 0; i < 4; i++ ){
						mino.setX( i, mino.getX( i ) + 1 );
						ghostMino.setX( i, ghostMino.getX( i ) + 1 );
					}
				}
			}
			isCollision = false;
		}
		if( isDown ){
			for( int i = 0; i < 4; i++ ){
				if( mino.getY( i ) >= 19 ){
					isCollision = true;
				}
			}
			for( int i = 0; i < 10; i++ ){
				for( int j = 0; j < 20; j++ ){
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( mino.getY( k ) == fieldBlock[i][j].getY() - 1 &&
							mino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
					}
				}
			}
			for( int i = 0; i < 4; i++ ){
				if( mino.getY( i ) < 19 && !isCollision ){
					mino.setY( i, mino.getY( i ) + 1 );
				}
			}
			if( isCollision ){
				confirmCount += 30;
			}
			isCollision = false;
		}
	}
	if( isPressed && isReleased ){
		if( isTurnLeft ){
			int movedX = mino.getX( 0 ) - tmpMino.getX( 0 );
			int movedY = mino.getY( 0 ) - tmpMino.getY( 0 );
			int rotation = tmpMino.getRotation();
			if( --rotation < 0 ) rotation = 3;
			tmpMino = new Mino( mino.getMinoType(), rotation );
			for( int i = 0; i < 4; i++ ){
				tmpMino.setX( i, tmpMino.getX( i ) + movedX );
			}
			for( int i = 0; i < 4; i++ ){
				tmpMino.setY( i, tmpMino.getY( i ) + movedY );
			}
			for( int i = 0; i < 4; i++ ){
				for( int j = 0; j < 4; j++ ){
					if( tmpMino.getX( j ) > 9 ){
						isCollision = true;
					}
				}
				if( isCollision ){
					for( int j = 0; j < 4; j++ ){
						tmpMino.setX( j, tmpMino.getX( j ) - 1 );
					}
				}
				isCollision = false;
			}
			for( int i = 0; i < 4; i++ ){
				for( int j = 0; j < 4; j++ ){
					if( tmpMino.getX( j ) < 0 ){
						isCollision = true;
					}
				}
				if( isCollision ){
					for( int j = 0; j < 4; j++ ){
						tmpMino.setX( j, tmpMino.getX( j ) + 1 );
					}
				}
				isCollision = false;
			}
			for( int i = 0; i < 4; i++ ){
				for( int j = 0; j < 4; j++ ){
					if( tmpMino.getY( j ) > 19 ){
						isCollision = true;
					}
				}
				if( isCollision ){
					for( int j = 0; j < 4; j++ ){
						tmpMino.setY( j, tmpMino.getY( j ) - 1 );
					}
				}
				isCollision = false;
			}
			for( int i = 0; i < 10; i++ ){
				for( int j = 0; j < 20; j++ ){
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( tmpMino.getY( k ) == fieldBlock[i][j].getY() &&
							tmpMino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
						if( isCollision ){
							for( int l = 0; l < 4; l++ ){
								tmpMino.setX( l, tmpMino.getX( l ) - 1 );
							}
						}
						isCollision = false;
					}
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( tmpMino.getY( k ) == fieldBlock[i][j].getY() &&
							tmpMino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
						if( isCollision ){
							for( int l = 0; l < 4; l++ ){
								tmpMino.setX( l, tmpMino.getX( l ) + 1 );
							}
						}
						isCollision = false;
					}
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( tmpMino.getY( k ) == fieldBlock[i][j].getY() &&
							tmpMino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
						if( isCollision ){
							for( int l = 0; l < 4; l++ ){
								tmpMino.setY( l, tmpMino.getY( l ) - 1 );
							}
						}
						isCollision = false;
					}
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( tmpMino.getY( k ) == fieldBlock[i][j].getY() &&
							tmpMino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
						if( isCollision ){
							for( int l = 0; l < 4; l++ ){
								tmpMino.setX( l, mino.getX( l ) );
								tmpMino.setY( l, mino.getY( l ) );
							}
						}
						isCollision = false;
					}
				}
			}
			mino = new Mino( tmpMino.getMinoType(), tmpMino.getRotation() );
			for( int i = 0; i < 4; i++ ){
				mino.setX( i, tmpMino.getX( i ) );
				mino.setY( i, tmpMino.getY( i ) );
			}
			tmpMino = new Mino( mino.getMinoType(), rotation );
			ghostMino = new Mino( mino.getMinoType(), rotation );
			for( int i = 0; i < 4; i++ ){
				ghostMino.setX( i, mino.getX( i ) );
				ghostMino.setY( i, mino.getY( i ) );
			}
		}
		if( isTurnRight ){
			int movedX = mino.getX( 0 ) - tmpMino.getX( 0 );
			int movedY = mino.getY( 0 ) - tmpMino.getY( 0 );
			int rotation = tmpMino.getRotation();
			if( ++rotation > 3 ) rotation = 0;
			tmpMino = new Mino( mino.getMinoType(), rotation );
			for( int i = 0; i < 4; i++ ){
				tmpMino.setX( i, tmpMino.getX( i ) + movedX );
			}
			for( int i = 0; i < 4; i++ ){
				tmpMino.setY( i, tmpMino.getY( i ) + movedY );
			}
			for( int i = 0; i < 4; i++ ){
				for( int j = 0; j < 4; j++ ){
					if( tmpMino.getX( j ) > 9 ){
						isCollision = true;
					}
				}
				if( isCollision ){
					for( int j = 0; j < 4; j++ ){
						tmpMino.setX( j, tmpMino.getX( j ) - 1 );
					}
				}
				isCollision = false;
			}
			for( int i = 0; i < 4; i++ ){
				for( int j = 0; j < 4; j++ ){
					if( tmpMino.getX( j ) < 0 ){
						isCollision = true;
					}
				}
				if( isCollision ){
					for( int j = 0; j < 4; j++ ){
						tmpMino.setX( j, tmpMino.getX( j ) + 1 );
					}
				}
				isCollision = false;
			}
			for( int i = 0; i < 4; i++ ){
				for( int j = 0; j < 4; j++ ){
					if( tmpMino.getY( j ) > 19 ){
						isCollision = true;
					}
				}
				if( isCollision ){
					for( int j = 0; j < 4; j++ ){
						tmpMino.setY( j, tmpMino.getY( j ) - 1 );
					}
				}
				isCollision = false;
			}
			for( int i = 0; i < 10; i++ ){
				for( int j = 0; j < 20; j++ ){
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( tmpMino.getY( k ) == fieldBlock[i][j].getY() &&
							tmpMino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
						if( isCollision ){
							for( int l = 0; l < 4; l++ ){
								tmpMino.setX( l, tmpMino.getX( l ) - 1 );
							}
						}
						isCollision = false;
					}
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( tmpMino.getY( k ) == fieldBlock[i][j].getY() &&
							tmpMino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
						if( isCollision ){
							for( int l = 0; l < 4; l++ ){
								tmpMino.setX( l, tmpMino.getX( l ) + 1 );
							}
						}
						isCollision = false;
					}
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( tmpMino.getY( k ) == fieldBlock[i][j].getY() &&
							tmpMino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
						if( isCollision ){
							for( int l = 0; l < 4; l++ ){
								tmpMino.setY( l, tmpMino.getY( l ) - 1 );
							}
						}
						isCollision = false;
					}
					for( int k = 0; k < 4; k++ ){
						if( fieldBlock[i][j] == null ) break;
						if( tmpMino.getY( k ) == fieldBlock[i][j].getY() &&
							tmpMino.getX( k ) == fieldBlock[i][j].getX() )
						{
							isCollision = true;
						}
						if( isCollision ){
							for( int l = 0; l < 4; l++ ){
								tmpMino.setX( l, mino.getX( l ) );
								tmpMino.setY( l, mino.getY( l ) );
							}
						}
						isCollision = false;
					}
				}
			}
			mino = new Mino( tmpMino.getMinoType(), tmpMino.getRotation() );
			for( int i = 0; i < 4; i++ ){
				mino.setX( i, tmpMino.getX( i ) );
				mino.setY( i, tmpMino.getY( i ) );
			}
			tmpMino = new Mino( mino.getMinoType(), rotation );
			ghostMino = new Mino( mino.getMinoType(), rotation );
			for( int i = 0; i < 4; i++ ){
				ghostMino.setX( i, mino.getX( i ) );
				ghostMino.setY( i, mino.getY( i ) );
			}
		}
		isPressed = false;
	}
	
	if( frameCount % 30 == 0 ){
		for( int i = 0; i < 4; i++ ){
			if( mino.getY( i ) >= 19 ){
				isCollision = true;
			}
		}
		for( int i = 0; i < 10; i++ ){
			for( int j = 0; j < 20; j++ ){
				for( int k = 0; k < 4; k++ ){
					if( fieldBlock[i][j] == null ) break;
					if( mino.getY( k ) == fieldBlock[i][j].getY() - 1 &&
						mino.getX( k ) == fieldBlock[i][j].getX() )
					{
						isCollision = true;
					}
				}
			}
		}
		for( int i = 0; i < 4; i++ ){
			if( mino.getY( i ) < 19 && !isCollision ){
				mino.setY( i, mino.getY( i ) + 1 );
			}
		}
		if( isCollision ){
			confirmCount += 40;
		}
		isCollision = false;
	}

	if( confirmCount >= 80 ){	// 接地フレームが80以上になったら
		for( int i = 0; i < 4; i++ ){	// ミノのfor
			if( mino.getX( i ) < 0 || mino.getX( i ) >= fieldBlock.length ||	// 範囲内でなければ
				mino.getY( i ) < 0 || mino.getY( i ) >= fieldBlock[0].length )
			{

			}else{	// ミノをfieldBlockにコピー
				fieldBlock[mino.getX( i )][mino.getY( i )] = new Block( mino.getX( i ), mino.getY( i ), mino.getColor( i ) );
			}
		}
		for( int i = 19; i >= 0; i-- ){			// 高さ20ライン分のfor
			boolean isFill = true;				// フラグの初期化
			for( int j = 0; j < 10; j++ ){		// 横10ブロック分のfor
				if( fieldBlock[j][i] == null ){	// fieldBlockのj, i番目にブロックがないなら
					isFill = false;				// isFillをfalse, forを離脱
					break;
				}
			}									// ここはたぶんいい
			if( isFill ){						// 1ラインすべて埋まっていれば
				for( int j = 0; j < 10; j++ ){	// 横10ブロック分のfor
					fieldBlock[j][i] = null;	// j, i番目消す
				}
				for( int j = 0; j < 10; j++ ){	// 横10ブロック分のfor
					for( int k = i; k >= 0; k-- ){	// 現在の高さからの上方向へのfor
						if( fieldBlock[j][k] != null && k + 1 < 20 ){	// 
							fieldBlock[j][k + 1] = fieldBlock[j][k];
							fieldBlock[j][k + 1].setY( fieldBlock[j][k].getY() + 1 );
							fieldBlock[j][k] = null;
						}
					}
				}
			}
		}
		for( int i = 0; i < 10; i++ ){
			for( int j = 0; j < 20; j++ ){
				if( fieldBlock[i][j] != null ){
					if( fieldBlock[i][j].getY() > 19 ){
						fieldBlock[i][j] = null;
					}
				}
			}
		}
		for( int i = 0; i < 4; i++ ){
			nextMino[i] = nextMino[ i + 1 ];
		}
		nextMino[4] = createMino();	
		if( nextMino[4] == nextMino[3] ){
			nextMino[4] = createMino();
		}
		mino = nextMino[0];
		if( new SecureRandom().nextInt( 50 ) == 25 ){
			mino = new Mino( "Puttyo", 0 );
		}
		tmpMino = new Mino( mino.getMinoType(), mino.getRotation() );
		ghostMino = new Mino( mino.getMinoType(), mino.getRotation() );
		confirmCount = 0;
	}

	for( int i = 0; i < 4; i++ ){
		ghostMino.setX( i, mino.getX( i ) );
		ghostMino.setY( i, mino.getY( i ) );
	}
	for( int i = 0; i < 20; i++ ){
		for( int j = 0; j < 4; j++ ){
			if( ghostMino.getY( j ) > 18 ){
				isCollision = true;
			}
		}
		for( int j = 0; j < 10; j++ ){
			for( int k = 0; k < 20; k++ ){
				for( int l = 0; l < 4; l++ ){
					if( fieldBlock[j][k] == null ) break;
					if( ghostMino.getX( l ) == fieldBlock[j][k].getX() &&
						ghostMino.getY( l ) == fieldBlock[j][k].getY() - 1 )
					{
						isCollision = true;
					}
				}
			}
		}
		if( !isCollision ){
			for( int j = 0; j < 4; j++ ){
				ghostMino.setY( j, ghostMino.getY( j ) + 1 );
			}
		}
		isCollision  = false;
	}

	strokeWeight( 1 );

	for( int i = 0; i < 4; i++ ){
		stroke( #AAAAAA );
		fill( mino.getColor( i ) );
		rect( fieldX + ( blockSize * mino.getX( i ) ), fieldY + ( blockSize * mino.getY( i ) ), blockSize, blockSize, 2 );
		stroke( #FFFFFF );
		fill( mino.getColor( i ), 128 );
		rect( fieldX + ( blockSize * ghostMino.getX( i ) ), fieldY + ( blockSize * ghostMino.getY( i ) ), blockSize, blockSize, 2 );
	}
}

void drawFieldBlock()
{
	for( int i = 0; i < fieldBlock.length; i++ ){
		for( int j = 0; j < fieldBlock[i].length; j++ ){
			if( fieldBlock[i][j] != null ){
				fill( fieldBlock[i][j].getColor() );
				rect( fieldX + ( blockSize * fieldBlock[i][j].getX() ), fieldY + ( blockSize * fieldBlock[i][j].getY() ), blockSize, blockSize, 2 );
			}
		}
	}
}

Mino createMino()
{
	String caseMino[] = {
		"I",
		"O",
		"T",
		"Z",
		"S",
		"L",
		"J"
	};
	// return( new Mino( caseMino[ int( random( 7 ) ) ], 0 ) );
	return( new Mino( caseMino[ new SecureRandom().nextInt( 7 ) ], 0 ) );
}

void keyPressed()
{
	isPressed = true;
	switch( keyCode )
	{
		case LEFT:
			isLeft = true;
		break;

		case RIGHT:
			isRight = true;
		break;

		case UP:
			isUp = true;
		break;

		case DOWN:
			isDown = true;
		break;

		case 16:
			isShift = true;
		break;

		case 116:
			init();
		break;
	}
	switch( key )
	{
		case 'a':
			isLeft = true;
		break;

		case 'd':
			isRight = true;
		break;

		case 'w':
			isUp = true;
		break;

		case 's':
			isDown = true;
		break;

		case 'k':
			isTurnLeft = true;
		break;

		case 'l':
			isTurnRight = true;
		break;
	}
	// println( keyCode );
}

void keyReleased()
{
	isReleased = true;

	switch( keyCode )
	{
		case LEFT:
			isLeft = false;
		break;

		case RIGHT:
			isRight = false;
		break;

		case UP:
			isUp = false;
		break;

		case DOWN:
			isDown = false;
		break;

		case 16:
			isShift = false;
		break;
	}
	switch( key )
	{
		case 'a':
			isLeft = false;
		break;

		case 'd':
			isRight = false;
		break;

		case 'w':
			isUp = false;
		break;

		case 's':
			isDown = false;
		break;

		case 'k':
			isTurnLeft = false;
		break;

		case 'l':
			isTurnRight = false;
		break;
	}
}