package ;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Roy
 */
class GameInfo extends Sprite
{
	
	var main:Main;
	var gameInfo:Bitmap;
	var startButton:Buttons;

	public function new(reference) 
	{
		super();
		main = reference;
		backGround();
	}
	
	public function backGround()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz info.jpg");
		gameInfo = new Bitmap( bitmapData );
		addChild(gameInfo);
	}
	
	public function button()
	{
		startButton = new Buttons();
		startButton.startButton();
		startButton.x = 600;
		startButton.y = 450;
		startButton.addEventListener( MouseEvent.CLICK, main.startGame );
		addChild( startButton );
	}
	
}