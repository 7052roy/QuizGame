package ;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import openfl.events.MouseEvent;
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
	public var scoreCount = 0;
	var scoreTextFormat:TextFormat = new TextFormat("Arial", 28, 0x000000, false, false, false, null, null, TextFormatAlign.RIGHT);
	var exitButton:Buttons;
	var startButton:Buttons;
	var mainMenuButton:Buttons;

	public function new(reference) 
	{
		main = reference;
		super();
	}
	
	public function create()
	{
		viewScores();
		addButtons();
	}
	
	public function insert(name:String, score:Int)
	{
		main.connect.request("INSERT INTO `quizgame`.`highscores` (`HighScore_ID`, `Name`, `Score`) VALUES (NULL,'" +name+ "'," +score+ ")");
	}
	
	function createScoreField()
	{
		for ( i in 0...10)
		{
			scoreText = new TextField();
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
		for (row in scores) 
		{
			scoreName = row.Name + ": " + row.Score;
			endScores[scoreCount].text = scoreName;
			scoreCount ++;
		}
		
	}
	
	function addButtons()
	{
		addChild (scoreText);
		exitButton = new Buttons();
		exitButton.exitButton();
		exitButton.x = 450;
		exitButton.y = 350;
		exitButton.addEventListener( MouseEvent.CLICK, main.endGame );
		addChild( exitButton );
		
		startButton = new Buttons();
		startButton.startButton();
		startButton.x = 450;
		startButton.y = 300;
		startButton.addEventListener( MouseEvent.CLICK, main.startScreen );
		addChild( startButton );
		
		mainMenuButton = new Buttons();
		mainMenuButton.startButton();
		mainMenuButton.x = 450;
		mainMenuButton.y = 250;
		mainMenuButton.addEventListener( MouseEvent.CLICK, main.create );
		addChild( mainMenuButton );
	}
	
}