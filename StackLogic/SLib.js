class SLib
{
	constructor( query )
	{
		this.canvas = document.querySelector( canvas );
		this.ctx = canvas.getContext( '2d' );
	}

	save()
	{
		this.ctx.save();
	}

	restore()
	{
		this.ctx.restore();
	}

	translate()
	{
		this.ctx.translate();
	}

	rotate()
	{
		this.ctx.rotate();
	}

	scale()
	{
		this.ctx.scale();
	}

	fill( color )
	{
		this.ctx.fillStyle = color;
	}


	fillRect( x, y, w, h )
	{
		this.ctx.fillRect( x, y, w, h );
	}
}