package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.ui.Keyboard;
import openfl.Lib.getTimer;
import sys.db.Mysql;
import openfl.Assets;
import flixel.system.FlxSound;
import flixel.FlxG;
import openfl.events.MouseEvent;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.system.System;


/**
 * ...
 * @author Roy Leinenga
 * 
 * This is a small Quizgame where people have to answer questions about rollercoasters.
 */

class Main extends Sprite 
{
	
	var inited:Bool;
	var question:Question;	
	public var checkAnswer:CheckAnswer;
    var gameMusic:FlxSound;
	var menuMusic:FlxSound;
	var scoreMusic:FlxSound;
	public var questionTime:Int = 10000;
	public var lastUpdate:Int;
	var timerText:TextField;
	public var mainMenu:MainMenu;
	var startButton:Buttons;
	public var endScreen:EndScreen;
	var gameBackground:Bitmap;
	var gameInfo:Bitmap;
	var highScore:HighScores;
	
	//This variable connects towards the database.
	public var connect = Mysql.connect({ 
            host : "localhost",
            port : 3306,
            user : "root",
            pass : "",
            socket : null,
            database : "quizgame"
        });
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	/**
	 * This function initializes the start of the game.
	 */
	function init() 
	{
		stage.displayState = NORMAL;
		stage.color = 0xFF0000;
		highScore = new HighScores(this);
		//highScore.create();
		//addChild(highScore);
		mainMenu = new MainMenu(this);
		addChild(mainMenu);
		endScreen = new EndScreen(this);
		//addChild(checkAnswer);
		addChild(endScreen);
		mainMenu.create();
		var songNumber = Std.random(3) + 1;
		menuMusic = FlxG.sound.load("assets/music/menuMusic" +songNumber + ".ogg");
		menuMusic.play();
	}
	
	/**
	 * This functions listens to a button in the HighScore class once the button is pressed it adds the mainMenu back to the stage.
	 * And removes the highScore screen from the stage.
	 * 
	 * @param	event
	 */
	public function create(event:MouseEvent)
	{
		scoreMusic.stop();
		var songNumber = Std.random(3) + 1;
		menuMusic = FlxG.sound.load("assets/music/menuMusic" +songNumber + ".ogg");
		menuMusic.play();
		removeChild(highScore);
		addChild(mainMenu);
	}
	
	/**
	 * This function creates the startScreen of the game which has a bit of explanation on how the game works.
	 * It also removes the mainMenu from the stage and adds a button to start the actual game.
	 * 
	 * @param	event
	 */
	public function startScreen(event:MouseEvent)
	{

		removeChild(mainMenu);
		highScore.scoreCount = 0;
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz info.jpg");
		gameInfo = new Bitmap( bitmapData );
		addChild(gameInfo);
		
		startButton = new Buttons();
		startButton.startButton();
		startButton.x = 600;
		startButton.y = 450;
		startButton.addEventListener( MouseEvent.CLICK, startGame );
		addChild( startButton );
		
	}
	
	/**
	 * This function creates the actual game.
	 * 
	 * @param	event
	 */
	public function startGame(event:MouseEvent)
	{
		if (scoreMusic != null)
		{
			scoreMusic.stop();
		}
		menuMusic.stop();
		removeChild(startButton);
		removeChild(gameInfo);
		
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz background.jpg");
		gameBackground = new Bitmap( bitmapData );
		addChild(gameBackground);
		var songNumber = Std.random(3) + 1;
		gameMusic = FlxG.sound.load("assets/music/gamemusic" +songNumber + ".ogg");
		trace(songNumber);
		gameMusic.play();
		
		questionTime = 1;
		lastUpdate = getTimer();
		question  = new Question(this);
		addChild(question);
		
		checkAnswer  = new CheckAnswer(this, question);
		addChild(checkAnswer);
		question.createAnswer();
		question.createQuestion();
		
		stage.color = 0xffffff;
		timerText = new TextField();
		timerText.defaultTextFormat = question.questionTextFormat;
		addChild(timerText);
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	/**
	 * This function closes the game
	 * 
	 * @param	event
	 */
	public function endGame(event:MouseEvent)
	{
		System.exit();
	}
	
	public function highScores(event:MouseEvent)
	{
		menuMusic.stop();
		var songNumber = Std.random(2) + 1;
		scoreMusic = FlxG.sound.load("assets/music/scoreMusic" +songNumber + ".ogg");
		scoreMusic.play();
		removeChild(mainMenu);
		highScore.create();
		addChild(highScore);
	}
	
	/**
	 * This function is called every frame to update the timer and check if the timer hasn't ended
	 * 
	 * @param	event
	 */
	public function update(event:Event)
	{
		var currentTime:Int = Lib.getTimer();
		var timePassed:Int  = currentTime - lastUpdate;
		
		lastUpdate = currentTime;
		
		questionTime -= timePassed;
		timerText.text = questionTime + "";
		
		if (questionTime < 0)
		{
			if (question.currentQuestion < 4)
			{
				question.resetQuestion();
				question.fillFields();
				question.currentQuestion ++;
			}
			if (question.currentQuestion == 4)
			{
				removeGame();
			}
		}
	}
	
	/**
	 * This function removes the game from the screen and creates the end screen
	 */
	public function removeGame()
	{
		
		removeEventListener(Event.ENTER_FRAME, update);
		removeChild(question);
		removeChild(gameBackground);
		removeChild(timerText);
		endScreen.create();
	}
	
	/**
	 * This function creates the endscore screen. And starts the highscore music.
	 */
	public function resetEnd()
	{
		gameMusic.stop();
		removeChild(endScreen);
		var songNumber = Std.random(2) + 1;
		scoreMusic = FlxG.sound.load("assets/music/scoreMusic" +songNumber + ".ogg");
		scoreMusic.play();
		highScore.create();
		addChild(highScore);
		
	}
	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.EXACT_FIT;
		Lib.current.addChild(new Main());
	}
}
