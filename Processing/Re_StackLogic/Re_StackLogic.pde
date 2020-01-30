import java.util.*;

Matrix matrix;

void init()
{
	keyInit();
	matrix = new Matrix( 250, 30 );
}

void setup()
{
	size( 1600, 900 );
	init();
}

void draw()
{
	background( #FFFFFF );
	matrix.draw();
}