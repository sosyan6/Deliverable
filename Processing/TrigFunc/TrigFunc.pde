float goalX;
float goalY;
int pointNum = 150;
boolean isClicked = false;

class Point{

    float x;
    float y;
    float r;
    float a;
    float sina;
    float cosa;

    Point( float a, float b, float c ){
        x = a;
        y = b;
        r = c;
    }

    void draw(){

        translate( x, y );
        a = atan2( y - goalY, x - goalX );
        translate( -x, -y );
        sina = sin( a ) * r;
        cosa = cos( a ) * r;

        x -= cosa;
        y -= sina;
        if( ( goalX - x ) > -5 && ( goalY - y ) > -5 && ( goalX - x ) < 5 && ( goalY - y ) < 5 ) fill( #ff5555 );
        else fill( #ffffff );
        ellipse( x, y, 10, 10 );
        line( x, y, goalX, goalY );
    }

}

Point p[] = new Point[pointNum];

void setup()
{
    size( 854, 480 );
    for( int a = 0; a < pointNum; a++ ){
        p[a] = new Point( random( width ), random( height ), 0.0 );
    }
}

void draw()
{
    background( 0 );
    stroke( #FFFFFF );

    if( mousePressed ){
        goalX = mouseX;
        goalY = mouseY;
        isClicked = true;
    }
    
    if( isClicked ){
        ellipse( goalX, goalY, 10, 10 );
        for( int a = 0; a < pointNum; a++ ){
        p[a].draw();
        }
    }
}