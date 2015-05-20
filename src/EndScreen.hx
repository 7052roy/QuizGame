package ;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.text.TextField;
import openfl.events.MouseEvent;
import flash.events.Event;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * This class creates the endscreen where players submit their score
 * 
 * @author roy leinenga
 */
class EndScreen extends Sprite
{

	var main:Main;
	var playerName:TextField;
	var submitButton:Buttons;
	var scoreText:TextField;
	
	public function new(reference) 
	{
		super();
		main = reference;
		scoreText = new TextField();
	}
	
	/**
	 * This function calls other functions to create the endScreen
	 */
	public function create()
	{
		
		score();
		nameField();
		submit();
	}
	
	/**
	 * This function draws the background to the screen
	 */
	public function backGround()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz2.jpg");
		var mainMenuBackground = new Bitmap( bitmapData );
		addChild(mainMenuBackground);
	}
	
	/**
	 * this function creates a textfield where the players score is shown.
	 */
	public function score()
	{
	
		scoreText.text = main.checkAnswer.score + "";
		scoreText.y = 220;
		scoreText.x = 450;
		addChild(scoreText);
	}
	
	/**
	 * This function creates a textfield where players can enter their name 
	 */
	function nameField()
	{
		playerName = new TextField();
		playerName.type = INPUT;
		playerName.background = true;
		playerName.x = 450;
		playerName.y = 250;
		playerName.height = 20;
		addChild(playerName);
	}
	
	/**
	 * This function creates the submitButton
	 */
	function submit()
	{
		submitButton = new Buttons();
		submitButton.submitButton();
		submitButton.x = 450;
		submitButton.y = 300;
		addChild(submitButton);
		submitButton.addEventListener( MouseEvent.CLICK, submitScore );
	}
	
	/**
	 * This function checks if the name is filled calls a function to add the score to the database
	 * 
	 * @param	event
	 */
	function submitScore(event:Event)
	{
		var insertScore:HighScores = new HighScores(main);
		if (playerName.text == "")
		{
			trace("the name is empty");
		}else {
			trace(playerName.text);
			insertScore.insert(playerName.text, main.checkAnswer.score);
			removeChild(scoreText);
			removeChild(playerName);
			removeChild(submitButton);
			
			main.resetEnd();
		}
	}
	
	public function reset()
	{
		scoreText.text = "";
	}
	
}