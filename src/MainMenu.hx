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
	var main:Main;

	public function new(reference) 
	{
		super();
		main = reference;
	}
	
	public function create()
	{
		Background();
	}
	
	function Background()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz2.jpg");
		var mainMenuBackground = new Bitmap( bitmapData );
		addChild(mainMenuBackground);
	}
	
}