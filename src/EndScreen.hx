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
 * ...
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
	}
	
	public function create()
	{
		backGround();
		score();
		nameField();
		submit();
	}
	
	function backGround()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz2.jpg");
		var mainMenuBackground = new Bitmap( bitmapData );
		addChild(mainMenuBackground);
	}
	
	function score()
	{
		scoreText = new TextField();
		scoreText.text = main.checkAnswer.score + "";
		scoreText.y = 220;
		scoreText.x = 450;
		addChild(scoreText);
	}
	
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
	
	function submit()
	{
		submitButton = new Buttons();
		submitButton.submitButton();
		submitButton.x = 450;
		submitButton.y = 300;
		addChild(submitButton);
		submitButton.addEventListener( MouseEvent.CLICK, submitScore );
	}
	
	function submitScore(event:Event)
	{
		var insertScore:HighScores = new HighScores(main);
		if (playerName.text == "")
		{
			trace("the name is empty");
		}else {
			trace(playerName.text);
			insertScore.insert(playerName.text, main.checkAnswer.score);
		}
	}
	
}