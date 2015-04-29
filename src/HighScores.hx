package ;

/**
 * ...
 * @author roy leinenga
 */
class HighScores
{
	var name:String;
	var score:Int;

	public function new() 
	{
		
	}
	
	function insert()
	{
		insertHighScore = main.connect.request("INSERT INTO `quizgame`.`highscores` (`HighScore_ID`, `Name`, `Score`) VALUES (NULL," +name "," +score")");
	}
	
	public function getScore()
	{
		
	}
	
}