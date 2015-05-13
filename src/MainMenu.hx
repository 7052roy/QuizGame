package ;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.MouseEvent;

/**
 * This class creates the mainMenu
 * 
 * @author roy leinenga
 */
class MainMenu extends Sprite 
{
	var main:Main;
	var startButton:Buttons;
	var scoreButton:Buttons;
	var exitButton:Buttons;

	public function new(reference) 
	{
		super();
		main = reference;
	}
	
	/**
	 * This funstion calls other functions to create the menu
	 */
	public function create()
	{
		background();
		buttonStart();
		highScoreButton();
		endButton();
	}
	
	/**
	 * This function creates the background for the main menu
	 */
	function background()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz2.jpg");
		var mainMenuBackground = new Bitmap( bitmapData );
		addChild(mainMenuBackground);
	}
	
	/**
	 * this function adds the button to go to the startScreen
	 */
	function buttonStart()
	{
		startButton = new Buttons();
		startButton.startButton();
		startButton.x = 550;
		startButton.y = 250;
		startButton.addEventListener( MouseEvent.CLICK, main.startScreen );
		addChild( startButton );
	}
	
	/**
	 * This function adds the highScore button
	 */
	function highScoreButton()
	{
		scoreButton = new Buttons();
		scoreButton.highScoreButton();
		scoreButton.x = 550;
		scoreButton.y = 300;
		scoreButton.addEventListener( MouseEvent.CLICK, main.highScores );
		addChild( scoreButton );
	}
	
	/**
	 * This function adds the endButton
	 */
	function endButton()
	{
		exitButton = new Buttons();
		exitButton.exitButton();
		exitButton.x = 550;
		exitButton.y = 350;
		exitButton.addEventListener( MouseEvent.CLICK, main.endGame );
		addChild( exitButton );
	}
	
	/**
	 * This function adds the start button to start the actual game
	 */
	public function buttonStartGame()
	{
		startButton = new Buttons();
		startButton.startButton();
		startButton.x = 550;
		startButton.y = 400;
		startButton.addEventListener( MouseEvent.CLICK, main.startGame );
		addChild( startButton );
	}
	
}