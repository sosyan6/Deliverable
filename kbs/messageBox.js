const { ipcRenderer } = require( 'electron' );
const { ipcMain } = require( 'electron' ).remote;

window.onload = () => {
	document.querySelector( 'a#close' ).addEventListener( 'click', () => {
		ipcRenderer.send( 'close', 'close' );
	} );

}
ipcMain.on( 'message', ( event, body ) => {
	console.log( message );
	document.querySelector( 'div#message' ).innerHTML = body;
	// for( let e of document.querySelector( 'div#message' ).innerHTML.match( /https?:\/\/[\w/\\:;|^%#$&?(){}[@`~_.=+-]]+/ ) || [] ){
	// 	document.querySelector( 'div#message' ).innerHTML = document.querySelector( 'div#message' ).innerHTML
	// 		.replace( e, `<a onclick = "location.href = '${ e }'">${ e }</a>` );
	// }
} );