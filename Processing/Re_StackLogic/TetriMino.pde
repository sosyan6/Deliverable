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
	color blockColor;

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
				blockColor = #00FFFF;
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
				blockColor = #FFFF00;
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
				blockColor = #FF00FF;
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
				blockColor = #FF7700;
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
				blockColor = #0000FF;
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
				blockColor = #FF0000;
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
				blockColor = #00FF00;
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

	ArrayList<Block> getBlocks()
	{
		return( block );
	}

	Type getType()
	{
		return( type );
	}

	int getRotation()
	{
		return( rotation );
	}

	color getColor()
	{
		return( blockColor );
	}

	void move( int x, int y )
	{
		for( Block b : block ){
			b.move( x, y );
		}
	}

	void copy( TetriMino m )
	{
		for( int i = 0; i < m.getBlocks().size(); i++ ){
			block.get( i ).setX( m.getBlocks().get( i ).getX() );
			block.get( i ).setY( m.getBlocks().get( i ).getY() );
		}
	}
}