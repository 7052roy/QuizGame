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
	var mainMenu:MainMenu;
	var startButton:Buttons;
	public var endScreen:EndScreen;
	var gameBackground:Bitmap;
	
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
		mainMenu = new MainMenu(this);
		addChild(mainMenu);
		endScreen = new EndScreen(this);
		addChild(endScreen);
		mainMenu.create();	
		
	}
	
	public function startGame(event:MouseEvent)
	{
		removeChild(mainMenu);
		var bitmapData:BitmapData = Assets.getBitmapData("img/coasternews quiz background.jpg");
		gameBackground = new Bitmap( bitmapData );
		addChild(gameBackground);
		//startGame();
		
		gameMusic = FlxG.sound.load("assets/music/song.ogg");
		gameMusic.play();
		
		questionTime = 1000;
		lastUpdate = getTimer();
		question  = new Question(this);
		addChild(question);
		
		checkAnswer  = new CheckAnswer(this, question);
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
		
	}
	
	public function update(event:Event)
	{
		var currentTime:Int = Lib.getTimer();
		var timePassed:Int  = currentTime - lastUpdate;
		
		lastUpdate = currentTime;
		
		questionTime -= timePassed;
		//timerText.text = questionTime + "";
		
		if (questionTime < 0)
		{
			if (question.currentQuestion < 5)
			{
				question.resetQuestion();
				question.fillFields();
				question.currentQuestion ++;
			}
			if (question.currentQuestion == 5) {
				question.currentQuestion ++;
				gameMusic.stop();
				removeEventListener(Event.ENTER_FRAME, update);
				trace("open");
				removeGame();
			}
		}
	}
	
	public function removeGame()
	{
		
		//gameMusic.stop();
		//trace("test2");
		removeChild(question);
		removeChild(gameBackground);
		endScreen.create();
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
