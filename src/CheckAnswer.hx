package ;

/**
 * ...
 * @author roy leinenga
 */
class CheckAnswer
{
	var main:Main;
	var question:Question;

	public function new(reference, question1) 
	{
		main = reference;
		question = question1;
	}
	
	public function checkAnswer(givenAnswer:Int):Void
	{
		if (givenAnswer == question.correctAnswer)
		{
			trace ("Well done");
		}else {
			trace("Better luck next time");
		}
	}
	
}