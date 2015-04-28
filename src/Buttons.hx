package ;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;

/**
 * ...
 * @author roy leinenga
 */
class Buttons extends Sprite
{

	public function new() 
	{
		super();
	}
	
	public function startButton()
	{
		var buttonGraphic:openfl.display.BitmapData = Assets.getBitmapData( "img/start.png" );
		var bitmap:openfl.display.Bitmap = new Bitmap( buttonGraphic );
		addChild( bitmap );
		buttonMode = true;
	}
	
	public function endButton()
	{
		
	}
	
	public function highScoreButton()
	{
		
	}
	
}