import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
// import processing.net.*;
SLibrary fieldPadding;
JLayeredPane pane;
JTextField field;
JTextArea area;

enum Scene
{
	SETUP,
	CHAT
};

Scene scene;

void setup()
{
	size( 854, 480 );
	surface.setResizable( true );
	surface.setTitle( "ありさアンテナ" );
	smooth( 2 );
	noStroke();

	scene = Scene.CHAT;

	fieldPadding = new SLibrary()
	.setBounds( 10, height - 50, width - 20, 40 )
	.setCorner( 10 )
	.setColor( #222222 )
	;

	Canvas canvas = (Canvas)surface.getNative();
	pane = (JLayeredPane)canvas.getParent().getParent();

	field = new JTextField();
	field.setBounds( 20, height - 50, width - 40, 40 );
	field.setBorder( null );
	field.setForeground( new Color( #FFFFFF ) );
	field.setBackground( new Color( #222222 ) );
	field.setFont( new Font( Font.SANS_SERIF, Font.PLAIN, 16 ) );
	pane.add( field );
	field.addActionListener( new ActionListener(){
		public void actionPerformed( ActionEvent e )
		{
			if( field.getText().equals( "" ) ) return;

			System.out.println( "Input: " + field.getText() );
			field.setText( "" );
		}
	} );
}

void draw()
{
	background( 51 );
	switch( scene ){
		case SETUP:

		break;
		case CHAT:
			fieldPadding
			.setBounds( 10, height - 50, width - 20, 40 )
			.drawBox();
			field.setBounds( 20, height - 50, width - 40, 40 );
			field.repaint();

			
		break;
	}

	fill( #00FF00 );
	textAlign( LEFT, TOP );
	text( Math.round( frameRate ), 0, 0 );
}