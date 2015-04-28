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
			path.set ("img/coasternews quiz.jpg", "img/coasternews quiz.jpg");
			type.set ("img/coasternews quiz.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/coasternews quiz2.jpg", "img/coasternews quiz2.jpg");
			type.set ("img/coasternews quiz2.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Dominator.jpg", "img/Dominator.jpg");
			type.set ("img/Dominator.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/GateKeeper.jpg", "img/GateKeeper.jpg");
			type.set ("img/GateKeeper.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/start.png", "img/start.png");
			type.set ("img/start.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/Tornado.jpg", "img/Tornado.jpg");
			type.set ("img/Tornado.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/play.mp3", "assets/music/play.mp3");
			type.set ("assets/music/play.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/play.wav", "assets/music/play.wav");
			type.set ("assets/music/play.wav", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/song.ogg", "assets/music/song.ogg");
			type.set ("assets/music/song.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
