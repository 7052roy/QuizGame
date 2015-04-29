package ;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;

/**
 * ...
 * @author roy leinenga
 */
class EndScreen extends Sprite
{

	var main:Main;
	
	public function new(reference) 
	{
		super();
		main = reference;
	}
	
	public function create()
	{
		//trace("test");
		backGround();
		score();
		nameField();
	}
	
	function backGround()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz2.jpg");
		var mainMenuBackground = new Bitmap( bitmapData );
		addChild(mainMenuBackground);
	}
	
	function score()
	{
		
	}
	
	function nameField()
	{
		
	}
	
}