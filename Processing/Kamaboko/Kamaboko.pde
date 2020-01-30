int rectSize = 15;

void setup()
{
	size( 854, 480 );
	background( #FFFFFF );

	rectMode( CENTER );
	stroke( #000000 );
	fill( #FFFFFF );

	for( int i = -5; i <= 5; i++ ){
		float y = sqrt( ( 25 * rectSize ) - sq( i ) );
		println( y );
		rect( ( width / 2 ) + ( i * rectSize ), height / 2 + y, rectSize, rectSize );
	}

	line( 0, height / 2, width, height / 2 );
	line( width / 2, 0, width / 2, height );
}

void draw()
{
	
}