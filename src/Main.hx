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
	var gameInfo:GameInfo;
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
		mainMenu = new MainMenu(this);
		addChild(mainMenu);
		endScreen = new EndScreen(this);
		gameInfo = new GameInfo(this);
		
		createGame();
		mainMenu.create();
		//Sys.sleep(1);
		var songNumber = Std.random(3) + 1;
		menuMusic = FlxG.sound.load("assets/music/menuMusic" +songNumber + ".ogg");
		menuMusic.play(true);
		
	}
	
	function createGame()
	{
		var bitmapData2:BitmapData = Assets.getBitmapData("img/coasternews quiz background.jpg");
		gameBackground = new Bitmap( bitmapData2 );
		
		question  = new Question(this);
		checkAnswer  = new CheckAnswer(this, question);
		
		timerText = new TextField();
		timerText.defaultTextFormat = question.questionTextFormat;
		
		//highScore.addButtons();
		
		endScreen.backGround();
	}
	
	/**
	 * This functions listens to a button in the HighScore class once the button is pressed it adds the mainMenu back to the stage.
	 * And removes the highScore screen from the stage.
	 * 
	 * @param	event
	 */
	public function createMenu(event:MouseEvent)
	{
		scoreMusic.stop();
		var songNumber = Std.random(3) + 1;
		menuMusic = FlxG.sound.load("assets/music/menuMusic" +songNumber + ".ogg");
		menuMusic.play(true);
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
		gameInfo.button();
		addChild(gameInfo);
		
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
		//removeChild(endScreen);
		removeChild(startButton);
		removeChild(gameInfo);
		
		
		addChild(gameBackground);
		var songNumber = Std.random(3) + 1;
		gameMusic = FlxG.sound.load("assets/music/gamemusic" +songNumber + ".ogg");
		gameMusic.play(true);
		question.currentQuestion = 1;
		
		lastUpdate = getTimer();
		
		addChild(question);
		
		
		addChild(checkAnswer);
		question.createAnswer();
		question.createQuestion();
		
		stage.color = 0xffffff;
		
		addChild(timerText);
		questionTime = 1;
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
		scoreMusic.play(true);
		removeChild(mainMenu);
		highScore.create();
		addChild(highScore);
	}
	
	/**
	 * This function is called every frame to update the timer and check if the timer hasn't ended
	 * 
	 * @param	event
	 */
	function update(event:Event)
	{
		var currentTime:Int = Lib.getTimer();
		var timePassed:Int  = currentTime - lastUpdate;
		
		lastUpdate = currentTime;
		
		questionTime -= timePassed;
		timerText.text = questionTime + "";
		
		if (questionTime < 0)
		{
			if (question.currentQuestion < 12)
			{
				question.resetQuestion();
				question.fillFields();
				question.currentQuestion ++;
			}
			if (question.currentQuestion == 12)
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
		questionTime  = 1000000;
		removeChild(question);
		removeChild(gameBackground);
		removeChild(timerText);
		addChild(endScreen);
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
		scoreMusic.play(true);
		highScore.create();
		addChild(highScore);
		checkAnswer.score = 0;
		endScreen.reset();
		question.reset();
		//highScore.resetScoreField();
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
