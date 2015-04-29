package ;

/**
 * ...
 * @author roy leinenga
 */
class HighScores
{
	var main:Main;

	public function new(reference) 
	{
		main = reference;
	}
	
	public function insert(name:String, score:Int)
	{
		main.connect.request("INSERT INTO `quizgame`.`highscores` (`HighScore_ID`, `Name`, `Score`) VALUES (NULL,'" +name+ "'," +score+ ")");
	}
	
	public function getScore()
	{
		
	}
	
}