const { desktopCapturer, remote, ipcRenderer } = require( 'electron' );
const server = require( 'http' ).createServer();
const io = require( 'socket.io' ).listen( server );

const { BrowserWindow, ipcMain } = remote;
const messageBox = new BrowserWindow( {
	x: remote.screen.getPrimaryDisplay().workAreaSize.width - 300,
	y: remote.screen.getPrimaryDisplay().workAreaSize.height - 100,
	width: 300,
	height: 100,
	frame: false,
	resizable: false,
	focusable: false,
	alwaysOnTop: true,
	show: false,
	webPreferences: {
		nodeIntegration: true
	},
} );

const getSources = async () => await desktopCapturer.getSources( { types: [ 'screen', 'window' ], thumbnailSize: { width: 300, height: 300 } } );

const getStream = ( id ) => new Promise( async ( resolve ) => {
	try{
		resolve( await navigator.mediaDevices.getUserMedia( {
			audio: false,
			video: {
				mandatory: {
					chromeMediaSource: 'desktop',
					chromeMediaSourceId: id,
					minWidth: 0,
					maxWidth: 1920,
					minHeight: 0,
					maxHeight: 1080,
				}
			}
		} ) );
	}catch( e ){
		console.error( e );
	}
} );

getSources().then( ( sources ) => getStream( sources[0].id ) ).then( ( stream ) => {
	var currentVideo = document.createElement( 'video' );
		currentVideo.width = 1920;
		currentVideo.height = 1080;
		currentVideo.srcObject = stream;
		currentVideo.autoplay = true;
	document.body.appendChild( currentVideo );

	var currentCanvas = document.createElement( 'canvas' );
		currentCanvas.width = currentVideo.width;
		currentCanvas.height = currentVideo.height;
	var currentCtx = currentCanvas.getContext( '2d' );

	setInterval( () => {
		currentCtx.drawImage( currentVideo, 0, 0, currentVideo.width, currentVideo.height );
		io.emit( 'currentData', currentCanvas.toDataURL( 'image/jpeg', 0.8 ) );
	}, 1000 / 13 );

	setInterval( () => {
		getSources().then( ( sources ) => 
			io.emit( 'sourceList', sources.map( v => ( { id: v.id, name: v.name, thumbnail: v.thumbnail.toDataURL( 0.8 ) } ) ) ) 
		);
	}, 1000 / 3 );

	io.on( 'connection', ( socket ) => {
		socket.on( 'switchSource', async ( id ) => currentVideo.srcObject = await getStream( id ) );
		
		let t;
		socket.on( 'sendMessage', ( message ) => {
			clearTimeout( t );

			ipcRenderer.send( 'message', message );
			messageBox.showInactive();

			t = setTimeout( () => {
				messageBox.hide();
				clearTimeout( t );
			}, 10000 );

			ipcMain.on( 'close', ( data ) => {
				console.log( data );
				messageBox.hide();
			} );
		} );
	} );

	messageBox.loadFile( 'messageBox.html' );
} );

server.on( 'request', ( req, res ) => {
	// if( req.url != '/kbs' ) return;
	if( req.url != '/' ) return;
	if( req.headers.host == "127.0.0.1" || req.headers.host == "localhost" ) return;
	res.writeHead( 200 );
	// res.write( require( 'fs' ).readFileSync( 'a.html', 'utf-8' ) );
	res.write( 
		`<!DOCTYPE html>
<html>
	<head>
		<meta charset = "utf-8">
		<title>Connecting...</title>
		<script src = "/socket.io/socket.io.js"></script>
		<style>
			body {
				margin: 0;
				background-color: #333;
				overflow: hidden;
				-webkit-user-drag: none;
			}
			div#img_wrapper {
				width: 100vw;
				height: 100vh;
			}
			div#img_wrapper img {
				width: 100%;
				height: 100%;
				object-fit: contain;
			}
			div#screen_container {
				position: fixed;
				top: 0;
				left: 0;
				width: 20vw;
				height: 100vh;
			}
			div#screen_container div#screen_wrapper {
				width: 100%;
				height: 100%;
				text-align: center;
				transition: 0.3s ease;
				transform: translateX( -10vw );
				opacity: 0;
				background: #0007;
				color: #fff;
				font-size: 1.3em;
				padding-top: 10px;
			}
			div#screen_container:hover div#screen_wrapper {
				transform: translateX( 0 );
				opacity: 1;
			}
			div#screen_wrapper img {
				width: 90%;
				margin: 10px 0;
				border: solid 4px #fff0;
				-webkit-user-drag: none;
				transition: 0.1s ease;
			}
			div#screen_wrapper img:hover {
				border: solid 4px #fff;
			}
			div#screen_wrapper img:active {
				transform: scale( 0.9, 0.9 );
			}
			div#window_container {
				position: fixed;
				top: 0;
				right: 0;
				width: 20vw;
				height: 100vh;
				overflow-y: auto;
			}
			div#window_container::-webkit-scrollbar {
				display: none;
				-webkit-appearance: none;
			}
			div#window_container div#window_wrapper {
				width: 100%;
				height: 100%;
				text-align: center;
				transition: 0.3s ease;
				transform: translateX( 10vw );
				opacity: 0;
				color: #fff;
				font-size: 1.3em;
				padding-top: 10px;
			}
			div#window_container div#window_background {
				position: fixed;
				top: 0;
				right: 0;
				width: 20vw;
				height: 100vh;
				transition: 0.3s ease;
				transform: translateX( 10vw );
				opacity: 0;
				background: #0007;
			}
			div#window_container:hover div#window_wrapper, div#window_container:hover div#window_background {
				transform: translateX( 0 );
				opacity: 1;
			}

			div#window_container div#window_footer {
				width: 100%;
				height: 50px;
			}
			div#window_wrapper img {
				width: 90%;
				margin: 10px 0;
				border: solid 4px #fff0;
				-webkit-user-drag: none;
				transition: 0.1s ease;
			}
			div#window_wrapper img:hover {
				border: solid 4px #fff;
			}
			div#window_wrapper img:active {
				transform: scale( 0.9, 0.9 );
			}
			div#message_container {
				position: fixed;
				bottom: 0;
				width: 100vw;

			}
			div#message_wrapper {
				width: 100vw;
				background: #0007;
				text-align: center;
				transition: 0.3s ease;
				transform: translateY( 10vw );
				opacity: 0;
			}
			div#message_container:hover div#message_wrapper {
				transform: translateY( 0 );
				opacity: 1;
			}
			div#message_wrapper form input {
				width: 90%;
				margin: 10px 0;
				font-size: 1em;
			}
		</style>
	</head>
	<body>
		<div id = "img_wrapper">
			<img id = "current_img">
		</div>
		<div id = "screen_container">
			<div id = "screen_wrapper">Screen</div>
		</div>
		<div id = "window_container">
			<div id = "window_background"></div>
			<div id = "window_wrapper">Window</div>
			<div id = "window_footer"></div>
		</div>
		<div id = "message_container">
			<div id = "message_wrapper">
				<form onsubmit = "sendMessage(); return false;">
					<input type = "text" id = "message_box" placeholder = "メッセージを入力してEnterキー押下で送信">
				</form>
			</div>
		</div>
		<script>
			const socket = io.connect( '/' );
			history.replaceState( '', '', '/' );

			let sendMessage;

			socket.on( 'connect', () => {
				var frameCount = 0;

				setInterval( () => {
					document.title = frameCount + 'FPS' + ( frameCount ? '' : '(Task was killed)' );
					frameCount = 0;
				}, 1000 );

				socket.on( 'currentData', data => {
					document.getElementById( 'current_img' ).src = data;
					frameCount++;
				} );

				socket.on( 'sourceList', sourceList => {
					for( var source of sourceList ){
						var e = document.getElementById( ( source.id.match( /screen:/ ) ) ? 'screen_wrapper' : 'window_wrapper' );
						if( !Array.from( e.children ).filter( v => v.id == source.id ).length ){
							var i = document.createElement( 'img' );
							i.id = source.id;
							i.addEventListener( 'click', event => {
								socket.emit( 'switchSource', event.target.id );
							} );
							e.appendChild( i );
						}
						document.getElementById( source.id ).src = source.thumbnail;
					}
					var s = document.getElementById( 'window_wrapper' ).children;
					for( var i = 0; i < s.length; i++ ){
						if( !sourceList.filter( v => v.id == s[i].id ).length ){
							s[i].remove();
						}
					}
				} );

				sendMessage = () => {
					const messageBox = document.querySelector( 'input#message_box' );
					if( messageBox.value.replace( /[\\s\\n\\t]*/g, '' ) !== '' ){
						socket.emit( 'sendMessage', messageBox.value );
					}
					messageBox.value = '';
				};
			} );
		</script>
	</body>
</html>`
	);
	res.end();
} ).listen( 80 );