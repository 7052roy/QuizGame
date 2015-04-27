package ;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

/**
 * ...
 * @author roy leinenga
 */
class MainMenu extends Sprite 
{

	public function new() 
	{
		super();
	}
	
	public function create()
	{
		Background();
	}
	
	function Background()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz.jpg");
		mainMenuBackground = new Bitmap( bitmapData );
		addChild(mainMenuBackground);
	}
	
}