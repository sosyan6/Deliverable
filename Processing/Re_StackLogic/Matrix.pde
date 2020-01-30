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

	void draw()
	{
		drawMatrix();
		drawMino();
	}

	void drawMatrix()
	{
		translate( matrixX, matrixY );

		// background
		noStroke();
		fill( #444444 );
		rect( 0, 0, matrixWidth, matrixHeight );

		// border
		strokeWeight( borderWeight );
		stroke( #666666 );
		for( int i = 0; i < blockVertical + 1; i++ ){
			line( 0, blockSize * i, matrixWidth, blockSize * i );
		}
		for( int i = 0; i < blockHorizontal + 1; i++ ){
			line( blockSize * i, 0, blockSize * i, matrixHeight );
		}

		// frame
		strokeWeight( frameWeight );
		stroke( #00DDDD );
		noFill();
		rect( -( frameWeight / 2 ) - 1, -( frameWeight / 2 ) - 1, matrixWidth + frameWeight + 2, matrixHeight + frameWeight + 2, frameWeight );

		// hold
		fill( #444444 );
		rect( -nextFrameSize - ( frameWeight / 2 ) - 2, -( frameWeight / 2 ) - 1, nextFrameSize, nextFrameSize, frameWeight );

		// next
		for( int i = 0; i < 4; i++ ){
			rect( matrixWidth + ( frameWeight / 2 ) + 2, -( frameWeight / 2 ) + ( nextFrameSize * i ) - 1, nextFrameSize, nextFrameSize, frameWeight );
		}
	}

	boolean getCollision()
	{
		if( isCollision ){
			isCollision = false;
			return true;
		}
		return false;
	}

	void fallMino()
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

	void operateMino()
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

	void drawMino()
	{
		operateMino();

		strokeWeight( 1.2 );

		for( Block b : ghostMino.getBlocks() ){
			stroke( #444444 );
			fill( ghostMino.getColor(), 128 );
			rect( blockSize * b.getX(), blockSize * b.getY(), blockSize, blockSize, 2 );
			// stroke( #FFFFFF );
		}
		for( Block b : currentMino.getBlocks() ){
			stroke( #444444 );
			fill( currentMino.getColor() );
			rect( blockSize * b.getX(), blockSize * b.getY(), blockSize, blockSize, 2 );
			// stroke( #FFFFFF );
		}
	}
}