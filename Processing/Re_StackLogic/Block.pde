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

	Block( int x, int y )
	{
		blockX = x;
		blockY = y;
		blockColor = #FFFFFF;
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

	void move( int x, int y )
	{
		blockX += x;
		blockY += y;
	}
}