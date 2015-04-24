package ;
import openfl.display.Sprite;
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

/**
 * ...
 * @author roy leinenga
 */
class Question extends Sprite
{
	
	var questionTextFormat:TextFormat = new TextFormat("Arial", 28, 0x000000, false, false, false, null, null,TextFormatAlign.CENTER);
	var questionText:TextField = new TextField();
	var answerOptions:Array<TextField> = new Array<TextField>();
	public var correctAnswer:String;
	var main:Main;
	public var image:Bitmap;
	public var currentQuestion:Int = 1;
	var questionDb = null;

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
		//fillFields();
	}
	
	public function createAnswer()
	{
		for ( i in 0...3)
		{
			var answerText:TextField = new TextField();
			answerText.defaultTextFormat = questionTextFormat;
			answerText.x = 0;
			answerText.y = 370 + 30 * i;
			answerText.width = 800;
			answerText.height = 50;
			answerOptions.push(answerText);
			addChild (answerText);	
		}
	}
	
	public function fillFields()
	{
		var answerCount:Int = 0;
		questionDb = main.connect.request("SELECT * FROM question WHERE Question_ID =" + currentQuestion );
		var answerDb = main.connect.request("SELECT * FROM answer WHERE Question_ID =" + currentQuestion );
		
		for (row in questionDb) 
		{
			questionText.text = row.Question ;
			correctAnswer = row.CorrectAnswer;
			var picture = row.Picture;
			var scale:Float = 0.1;
			var bitmapData:BitmapData = Assets.getBitmapData("img/"+picture+".jpg");
			image = new Bitmap( bitmapData );
			image.scaleX = scale;
			image.scaleY = scale;
			image.x = 150;
			image.y = 30;
			addChild( image );
		}
		
		for (row in answerDb) 
		{
			answerOptions[answerCount].text = row.PossibleAnswer;
			answerCount ++;
			trace(row.PossibleAnswer);
		}
		
		main.questionTime = 15000;
		
		main.lastUpdate = getTimer();
	}
	
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
	
	public function resetQuestion()
	{
		removeChild(image);
	}
	
}