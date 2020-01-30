import processing.video.*;

Movie movie;

int flyX;
int flyY;
int flySpeed = 5;

void setup()
{
	size( 800, 800, P2D );
	// frameRate( 30 );
	rectMode( CENTER );
	stroke( #000000 );

	movie = new Movie( this, "explode.mp4" );

	flyX = int( random( width ) );
	flyY = int( random( height ) );
}

void draw()
{
	background( #FFFFFF );
	drawFly();
	drawSwatter();
}

void drawFly()
{
	flyX += int( random( -flySpeed, flySpeed ) );
	flyY += int( random( -flySpeed, flySpeed ) );

	if( flyX < 0 ) 		flyX = 0;
	if( flyX > width ) 	flyX = width;
	if( flyY < 0 ) 		flyY = 0;
	if( flyY > height - 130 ) flyY = height - 130;

	fill( #000000 );
	point( flyX, flyY );
}

void drawSwatter()
{
	noFill();
	rect( mouseX, mouseY - 180, 80, 100 );
	line( mouseX, mouseY - 130, mouseX, mouseY + 20 );
}

void mousePressed()
{
	if( flyX > mouseX - 40 &&
		flyX < mouseX + 40 &&
		flyY > mouseY - 230 &&
		flyY < mouseY - 130
	){
		println("clear");
	}else{
		movie.play();
		println("died");
	}
}