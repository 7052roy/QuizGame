package ;

/**
 * ...
 * @author roy leinenga
 */
class CheckAnswer
{
	var main:Main;
	var question:Question;
	var score:Int = 0;

	public function new(reference, question1) 
	{
		main = reference;
		question = question1;
	}
	
	public function checkAnswer(givenAnswer:String):Void
	{
		if (givenAnswer == question.correctAnswer)
		{
			score += main.questionTime;
			score += 1000;
			main.questionTime = 1;
			trace ("Well done");
			trace(score);
		}else {
			main.questionTime = 1;
			trace("Better luck next time");
		}
	}
	
	public function endScore()
	{
		
	}
	
}