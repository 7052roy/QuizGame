package ;

import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.display.Sprite;

/**
 * This class checks if the answers are correct.
 * 
 * @author roy leinenga
 */
class CheckAnswer extends Sprite
{
	var main:Main;
	var question:Question;
	public var score:Int = 0;
	var answerText:TextField = new TextField();

	public function new(reference, question1) 
	{
		super();
		main = reference;
		question = question1;
		createText();
	}
	
	/**
	 * this function creates the textfield for the feedback
	 */
	function createText()
	{
		var answerTextFormat:TextFormat = new TextFormat("Arial", 28, 0x000000, false, false, false, null, null, TextFormatAlign.LEFT);
		answerText = new TextField();
		answerText.defaultTextFormat = answerTextFormat;
		answerText.x = 0;
		answerText.y = 450;
		answerText.width = 800;
		answerText.height = 50;
		addChild (answerText);	
	}
	
	/**
	 * This function checks the given answer and gives the player feedback
	 * 
	 * @param	givenAnswer
	 */
	public function checkAnswer(givenAnswer:String):Void
	{
		if (givenAnswer == question.correctAnswer)
		{
			score += main.questionTime;
			score += 1000;
			main.questionTime = 100;
			answerText.text = "Well done";
		}else{
			main.questionTime = 100;
			answerText.text = "Better luck next time";
		}
	}
}