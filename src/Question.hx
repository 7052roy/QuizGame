package ;
import openfl.display.Sprite;
import openfl.system.System;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.text.TextFormatAlign;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.Lib.getTimer;
import openfl.media.Sound;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import motion.Actuate;
import motion.easing.*;
import openfl.events.Event;

/**
 * This class fetches the question and answers from the database and adds the to the screen
 * 
 * @author roy leinenga
 */
class Question extends Sprite
{
	
	public var questionTextFormat:TextFormat = new TextFormat("Arial", 28, 0x000000, false, false, false, null, null,TextFormatAlign.CENTER);
	var questionText:TextField = new TextField();
	var answerOptions:Array<TextField> = new Array<TextField>();
	public var correctAnswer:String;
	var main:Main;
	public var image:Bitmap;
	public var currentQuestion:Int = 1;
	var questionDb = null;
	var answerCount:Int = 0;
	var answerText:TextField;

	public function new(reference) 
	{
		super();
		main = reference;
	}
	
	/**
	 * this function creates the textfield for the question
	 */
	public function createQuestion()
	{
		questionText = new TextField();
		questionText.defaultTextFormat = questionTextFormat;
		questionText.x = 0;
		questionText.y = 0;
		questionText.width = 800;
		questionText.height = 50;
		
		addChild (questionText);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
	}
	
	/**
	 * This function creates the textfields for the possible answers
	 */
	public function createAnswer()
	{
		/*while (answerOptions.length > 0)
		{
			answerOptions.pop();
		}*/
		for ( i in 0...3)
		{
			answerText = new TextField();
			answerText.defaultTextFormat = questionTextFormat;
			answerText.x = 0;
			answerText.y = 370 + 30 * i;
			answerText.width = 800;
			answerText.height = 50;
			answerOptions.push(answerText);
			addChild (answerText);	
		}
	}
	
	/**
	 * This function fills the question and the answers and adds the corresponding picture to the screen
	 */
	public function fillFields()
	{
		
		questionDb = main.connect.request("SELECT * FROM question WHERE Question_ID =" + currentQuestion );
		var answerDb = main.connect.request("SELECT * FROM answer WHERE Question_ID =" + currentQuestion );
		
		
		
		for (row in questionDb) 
		{
			questionText.text = row.Question ;
			correctAnswer = row.CorrectAnswer;
			trace(correctAnswer);
			var picture = row.Picture;
			var scale:Float = 0.1;
			var bitmapData:BitmapData = Assets.getBitmapData("img/"+picture+".jpg");
			image = new Bitmap( bitmapData );
			image.x = 150;
			image.y = 30;
			image.width = 500;
			image.height = 340;
			addChild( image );
			//Actuate.tween (image, 2, { alpha: 1, width: 500, height: 340 } ).ease (Sine.easeIn);
			
		}
		
		for (row in answerDb) 
		{
			answerOptions[answerCount].text = row.PossibleAnswer;
			answerCount ++;
		}
		
		main.questionTime = 10000;
		
		main.lastUpdate = getTimer();
		
	}
	
	/**
	 * This function checks if a key is pressed
	 * 
	 * @param	event
	 */
	function onKeyPressed(event:KeyboardEvent):Void
	{		
		switch(event.keyCode)
		{
			case Keyboard.NUMBER_1:
				main.checkAnswer.checkAnswer( answerOptions[0].text );
			case Keyboard.NUMBER_2:
				main.checkAnswer.checkAnswer( answerOptions[1].text );
			case Keyboard.NUMBER_3:
				main.checkAnswer.checkAnswer( answerOptions[2].text );
		}
	}
	
	/**
	 * This function empties the textFields and removes the picture from the screen
	 */
	public function resetQuestion()
	{
		if (image != null)
		{
			removeChild(image);
		}
		if(currentQuestion > 6)
		{
			main.removeGame();
		}
		
		
		answerCount = 0;
	}
	
	public function reset()
	{
		questionText.text = "";
	}
	
}