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
 * This class creates the highscore screen.
 * 
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
		background();
	}
	
	/**
	 * This function creates the backGround for the highscore screen
	 */
	public function background()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz2.jpg");
		var HighScoreBackground = new Bitmap( bitmapData );
		addChild(HighScoreBackground);
	}
	
	/**
	 * This function empties the array and calls the function to create the scores and the buttons
	 */
	public function create()
	{
		while (endScores.length > 0)
		{
			removeChild(endScores.pop());
		}
		scoreCount = 0;
		viewScores();
		addButtons();
	}
	
	/**
	 * This function adds the score to the database
	 * 
	 * @param	name
	 * @param	score
	 */
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
	
	
	/**
	 * This function requests the scores from the database and shows the on the screen
	 */
	function viewScores()
	{	
		
		createScoreField();
		scores = main.connect.request("SELECT * FROM highscores ORDER BY Score DESC");
		var i:Int = 0;
		for (row in scores) 
		{
			if (i < 10)
			{
				scoreName = row.Name + ": " + row.Score;
				endScores[scoreCount].text = scoreName;
				
			}
			scoreCount ++;
			i ++;
		}
		
	}
	
	/**
	 * This function adds the buttons to the highscore screen
	 */
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