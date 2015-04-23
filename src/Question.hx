package ;
import openfl.display.Sprite;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.text.TextFormatAlign;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.Lib.getTimer;

/**
 * ...
 * @author roy leinenga
 */
class Question extends Sprite
{
	
	var questionTextFormat:TextFormat = new TextFormat("Arial", 28, 0x000000, false, false, false, null, null,TextFormatAlign.CENTER);
	var questionText:TextField = new TextField();
	var answerOptions:Array<TextField> = new Array<TextField>();
	public var correctAnswer:Int = 1;
	var main:Main;

	public function new(reference) 
	{
		super();
		main = reference;
	}
	
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
		fillFields();
	}
	
	public function createAnswer()
	{
		for ( i in 0...3)
		{
			var answerText:TextField = new TextField();
			answerText.defaultTextFormat = questionTextFormat;
			answerText.x = 0;
			answerText.y = 100 + 100 * i;
			answerText.width = 800;
			answerText.height = 50;
			
			answerOptions.push(answerText);
			addChild (answerText);	
		}
	}
	
	public function fillFields()
	{
		var answerCount:Int = 0;
		var questionDb = main.connect.request("SELECT * FROM question WHERE Question_ID = 1");
		var answerDb = main.connect.request("SELECT * FROM answer WHERE Question_ID = 1");
		
		for (row in questionDb) 
		{
			questionText.text = row.Question ;
			correctAnswer = row.CorrectAnswer;
		}
		for (row in answerDb) 
		{
			answerOptions[answerCount].text = row.PossibleAnswer;
			answerCount ++;
		}
		
		trace(correctAnswer);
		main.questionTime = 4000;
		
		main.lastUpdate = getTimer();
	}
	
	function onKeyPressed(event:KeyboardEvent):Void
	{		
		switch(event.keyCode)
		{
			case Keyboard.NUMBER_1:
				main.checkAnswer.checkAnswer( 0 );
			case Keyboard.NUMBER_2:
				main.checkAnswer.checkAnswer( 1 );
			case Keyboard.NUMBER_3:
				main.checkAnswer.checkAnswer( 2 );
		}
	}
	
}