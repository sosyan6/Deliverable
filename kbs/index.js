const { app, BrowserWindow } = require( 'electron' );

let win;

function createWindow()
{
	win = new BrowserWindow( {
		width: 0,
		height: 0,
		frame: false,
		show: false,
		webPreferences: {
			nodeIntegration: true
		}
	} );

	win.loadFile( 'index.html' );

	win.on( 'closed', () => {
		win = null;
	} );
}

app.on( 'ready', createWindow );

app.on( 'window-all-closed', () => {
	
} );

app.on( 'activate', () => {
	if( win === null ) createWindow();
} );

process.on( 'exit', ( code ) => {
	console.log( code );
} );