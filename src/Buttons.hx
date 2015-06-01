package ;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;

/**
 * This class creates the buttons that will be used in the game
 * 
 * @author roy leinenga
 */
class Buttons extends Sprite
{

	public function new() 
	{
		super();
	}
	
	/**
	 * This function draws the startButton
	 */
	public function startButton()
	{
		var buttonGraphic:openfl.display.BitmapData = Assets.getBitmapData( "img/start.png" );
		var bitmap:openfl.display.Bitmap = new Bitmap( buttonGraphic );
		addChild( bitmap );
		buttonMode = true;
	}
	
	public function mainMenuButton()
	{
		var buttonGraphic:openfl.display.BitmapData = Assets.getBitmapData( "img/MainMenu.png" );
		var bitmap:openfl.display.Bitmap = new Bitmap( buttonGraphic );
		addChild( bitmap );
		buttonMode = true;
	}
	
	/**
	 * This function draws the exitButton
	 */
	public function exitButton()
	{
		var buttonGraphic:openfl.display.BitmapData = Assets.getBitmapData( "img/exit.png" );
		var bitmap:openfl.display.Bitmap = new Bitmap( buttonGraphic );
		addChild( bitmap );
		buttonMode = true;
	}
	
	/**
	 * This function draws the highScoreButton
	 */
	public function highScoreButton()
	{
		var buttonGraphic:openfl.display.BitmapData = Assets.getBitmapData( "img/Scores.png" );
		var bitmap:openfl.display.Bitmap = new Bitmap( buttonGraphic );
		addChild( bitmap );
		buttonMode = true;
	}
	
	/**
	 * This function creates the submitButton
	 */
	public function submitButton()
	{
		var buttonGraphic:openfl.display.BitmapData = Assets.getBitmapData( "img/Submit.png" );
		var bitmap:openfl.display.Bitmap = new Bitmap( buttonGraphic );
		addChild( bitmap );
		buttonMode = true;
	}
	
}