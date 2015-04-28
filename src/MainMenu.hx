package ;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.MouseEvent;

/**
 * ...
 * @author roy leinenga
 */
class MainMenu extends Sprite 
{
	var main:Main;
	var startButton:Buttons;

	public function new(reference) 
	{
		super();
		main = reference;
	}
	
	public function create()
	{
		background();
		buttonStart();
	}
	
	function background()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz2.jpg");
		var mainMenuBackground = new Bitmap( bitmapData );
		addChild(mainMenuBackground);
	}
	
	function buttonStart()
	{
		startButton = new Buttons();
		startButton.startButton();
		startButton.x = 650;
		startButton.y = 300;
		startButton.addEventListener( MouseEvent.CLICK, main.onClick );
		addChild( startButton );
	}
	
}