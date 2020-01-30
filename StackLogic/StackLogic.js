let c;
let matrix;

window.addEventListener( 'load', () => {
	init();
	setInterval( draw, 1000 / 60 );
} );

function init()
{
	c = new SLib( 'canvas#main_canvas' );

	matrix = new Matrix( 250, 30 );
}

function draw()
{
	matrix.draw();
}