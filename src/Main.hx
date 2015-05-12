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
 */

class Main extends Sprite 
{
	
	var inited:Bool;
	var question:Question;	
	public var checkAnswer:CheckAnswer;
    var gameMusic:FlxSound;
	public var questionTime:Int = 10000;
	public var lastUpdate:Int;
	var timerText:TextField;
	public var mainMenu:MainMenu;
	var startButton:Buttons;
	public var endScreen:EndScreen;
	var gameBackground:Bitmap;
	var gameInfo:Bitmap;
	var highScore:HighScores;
	
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
	}
	
	public function create(event:MouseEvent)
	{
		removeChild(highScore);
		addChild(mainMenu);
	}
	
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
	
	public function startGame(event:MouseEvent)
	{
		removeChild(startButton);
		removeChild(gameInfo);
		
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz background.jpg");
		gameBackground = new Bitmap( bitmapData );
		addChild(gameBackground);
		
		gameMusic = FlxG.sound.load("assets/music/song.ogg");
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
	
	public function endGame(event:MouseEvent)
	{
		System.exit();
	}
	
	public function highScores(event:MouseEvent)
	{
		removeChild(mainMenu);
		highScore.create();
		addChild(highScore);
	}
	
	public function update(event:Event)
	{
		var currentTime:Int = Lib.getTimer();
		var timePassed:Int  = currentTime - lastUpdate;
		
		lastUpdate = currentTime;
		
		questionTime -= timePassed;
		timerText.text = questionTime + "";
		
		if (questionTime < 0)
		{
			if (question.currentQuestion < 8)
			{
				question.resetQuestion();
				question.fillFields();
				question.currentQuestion ++;
			}
			if (question.currentQuestion == 8)
			{
				removeGame();
			}
		}
	}
	
	public function removeGame()
	{
		gameMusic.stop();
		removeEventListener(Event.ENTER_FRAME, update);
		removeChild(question);
		removeChild(gameBackground);
		removeChild(timerText);
		endScreen.create();
	}
	
	public function resetEnd()
	{
		removeChild(endScreen);
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
