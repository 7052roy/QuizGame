package ;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
/**
 * ...
 * @author roy leinenga
 */
class HighScores extends Sprite
{
	var main:Main;
	var scores = null;
	var scoreText:TextField = new TextField();
	var scoreName:String;
	var endScores:Array<TextField> = new Array<TextField>();
	var scoreCount = 0;
	var scoreTextFormat:TextFormat = new TextFormat("Arial", 28, 0x000000, false, false, false, null, null,TextFormatAlign.RIGHT);

	public function new(reference) 
	{
		main = reference;
		super();
		
	}
	
	public function insert(name:String, score:Int)
	{
		main.connect.request("INSERT INTO `quizgame`.`highscores` (`HighScore_ID`, `Name`, `Score`) VALUES (NULL,'" +name+ "'," +score+ ")");
	}
	
	public function getScore()
	{
		
	}
	
	public function createScoreField()
	{
		for ( i in 0...10)
		{
			var scoreText:TextField = new TextField();
			scoreText.defaultTextFormat = scoreTextFormat;
			scoreText.x = 0;
			scoreText.y = 150 + 30 * i;
			scoreText.width = 800;
			scoreText.height = 50;
			endScores.push(scoreText);
			addChild (scoreText);	
		}
	}
	
	public function viewScores()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz2.jpg");
		var HighScoreBackground = new Bitmap( bitmapData );
		addChild(HighScoreBackground);
		
		createScoreField();
		scores = main.connect.request("SELECT * FROM highscores ORDER BY Score DESC");
		//main.resetEnd();
		for (row in scores) 
		{
			scoreName = row.Name + " :" + row.Score;
			endScores[scoreCount].text = scoreName;
			scoreCount ++;
		}
	}
	
}