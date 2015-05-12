package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("img/Boomerang.jpg", "img/Boomerang.jpg");
			type.set ("img/Boomerang.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/coasternews quiz background.jpg", "img/coasternews quiz background.jpg");
			type.set ("img/coasternews quiz background.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/coasternews quiz info.jpg", "img/coasternews quiz info.jpg");
			type.set ("img/coasternews quiz info.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/coasternews quiz.jpg", "img/coasternews quiz.jpg");
			type.set ("img/coasternews quiz.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/coasternews quiz2.jpg", "img/coasternews quiz2.jpg");
			type.set ("img/coasternews quiz2.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Dominator.jpg", "img/Dominator.jpg");
			type.set ("img/Dominator.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/exit.png", "img/exit.png");
			type.set ("img/exit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/GateKeeper.jpg", "img/GateKeeper.jpg");
			type.set ("img/GateKeeper.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/GreatWhite.jpg", "img/GreatWhite.jpg");
			type.set ("img/GreatWhite.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/KingDaKa.jpg", "img/KingDaKa.jpg");
			type.set ("img/KingDaKa.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Scores.png", "img/Scores.png");
			type.set ("img/Scores.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/start.png", "img/start.png");
			type.set ("img/start.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Tornado.jpg", "img/Tornado.jpg");
			type.set ("img/Tornado.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/gamemusic1.ogg", "assets/music/gamemusic1.ogg");
			type.set ("assets/music/gamemusic1.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/gamemusic2.ogg", "assets/music/gamemusic2.ogg");
			type.set ("assets/music/gamemusic2.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/gamemusic3.ogg", "assets/music/gamemusic3.ogg");
			type.set ("assets/music/gamemusic3.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/menuMusic1.ogg", "assets/music/menuMusic1.ogg");
			type.set ("assets/music/menuMusic1.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/menuMusic2.ogg", "assets/music/menuMusic2.ogg");
			type.set ("assets/music/menuMusic2.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/menuMusic3.ogg", "assets/music/menuMusic3.ogg");
			type.set ("assets/music/menuMusic3.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/scoreMusic1.ogg", "assets/music/scoreMusic1.ogg");
			type.set ("assets/music/scoreMusic1.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/scoreMusic2.ogg", "assets/music/scoreMusic2.ogg");
			type.set ("assets/music/scoreMusic2.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
