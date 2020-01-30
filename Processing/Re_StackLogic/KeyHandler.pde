HashMap<String, Boolean> keyMap = new HashMap<String, Boolean>();
Boolean isPressed = false;
Boolean isReleased = true;
Boolean isTyped = false;

void keyInit()
{
	keyMap.put( "left", false );
	keyMap.put( "right", false );
	keyMap.put( "up", false );
	keyMap.put( "down", false );
	keyMap.put( "shift", false );
	keyMap.put( "left", false );
	keyMap.put( "right", false );
	keyMap.put( "up", false );
	keyMap.put( "down", false );
	keyMap.put( "L", false );
	keyMap.put( "R", false );
}

void keyPressed()
{
	isPressed = true;
	switch( keyCode )
	{
		case 16:
			keyMap.put( "shift", true );
		break;

		case 116:
			init();
		break;
	}

	switch( key )
	{
		case 'a':
			keyMap.put( "left", true );
		break;

		case 'd':
			keyMap.put( "right", true );
		break;

		case 'w':
			keyMap.put( "up", true );
		break;

		case 's':
			keyMap.put( "down", true );
		break;

		case 'k':
			keyMap.put( "L", true );
		break;

		case 'l':
			keyMap.put( "R", true );
		break;
	}
}

void keyReleased()

{
	isReleased = true;
	switch( keyCode )
	{
		case 16:
			keyMap.put( "shift", false );
		break;
	}

	switch( key )
	{
		case 'a':
			keyMap.put( "left", false );
		break;

		case 'd':
			keyMap.put( "right", false );
		break;

		case 'w':
			keyMap.put( "up", false );
		break;

		case 's':
			keyMap.put( "down", false );
		break;

		case 'k':
			keyMap.put( "L", false );
		break;

		case 'l':
			keyMap.put( "R", false );
		break;
	}
}

void keyTyped()
{
	isTyped = true;
}