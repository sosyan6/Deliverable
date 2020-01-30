class Matrix
{
	constructor( x, y )
	{
		this.x = x;
		this.y = y;
		this.gridSize = 40;
		this.col = 10;
		this.row = 20;
		this.width = this.gridSize * this.col;
		this.height = this.gridSize * this.row;
		this.borderWeight = this.gridSize / 10;
		this.frameWeight = this.gridSize / 2;
		this.nextFrame = this.gridSize * 4;

		this.dropTime = 2;
		this.dropCount = 0;
	}

	draw()
	{
		this.drawMatrix();
	}

	drawMatrix()
	{
		c.save();

		c.translate( this.x, this.y );

		// background
		c.fill( '#444' );
		c.fillRect( 0, 0, this.width, this.height );

		//border
		c.lineWidth = this.borderWeight;
		c.strokeStyle = '#666';
		for( let i = 0; i < this.row + 1; i++ ){
			c.beginPath();
			c.moveTo( 0, this.gridSize * i );
			c.lineTo( this.width, this.gridSize * i );
			c.stroke();
		}
		for( let i = 0; i < this.col + 1; i++ ){
			c.beginPath();
			c.moveTo( this.gridSize * i, 0 );
			c.lineTo( this.gridSize * i, this.height );
			c.stroke();
		}

		c.restore();
	}
}