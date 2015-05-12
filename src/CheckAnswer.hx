package ;

import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.display.Sprite;

/**
 * ...
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
	
	public function checkAnswer(givenAnswer:String):Void
	{
		if (givenAnswer == question.correctAnswer)
		{
			score += main.questionTime;
			score += 1000;
			main.questionTime = 1;
			//createText();
			answerText.text = "Well done";
			//addChild(answerText);
			//trace ("Well done");
			//trace(score);
		}else {
			main.questionTime = 1;
			trace("Better luck next time");
			//createText();
			answerText.text = "Better luck next time";
		}
	}
}