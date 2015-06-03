package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("img/Button quizgame.psd", __ASSET__img_button_quizgame_psd);
		type.set ("img/Button quizgame.psd", AssetType.BINARY);
		className.set ("img/coasternews quiz background.jpg", __ASSET__img_coasternews_quiz_background_jpg);
		type.set ("img/coasternews quiz background.jpg", AssetType.IMAGE);
		className.set ("img/coasternews quiz info.jpg", __ASSET__img_coasternews_quiz_info_jpg);
		type.set ("img/coasternews quiz info.jpg", AssetType.IMAGE);
		className.set ("img/coasternews quiz.jpg", __ASSET__img_coasternews_quiz_jpg);
		type.set ("img/coasternews quiz.jpg", AssetType.IMAGE);
		className.set ("img/coasternews quiz2.jpg", __ASSET__img_coasternews_quiz2_jpg);
		type.set ("img/coasternews quiz2.jpg", AssetType.IMAGE);
		className.set ("img/exit.png", __ASSET__img_exit_png);
		type.set ("img/exit.png", AssetType.IMAGE);
		className.set ("img/Scores.png", __ASSET__img_scores_png);
		type.set ("img/Scores.png", AssetType.IMAGE);
		className.set ("img/start.png", __ASSET__img_start_png);
		type.set ("img/start.png", AssetType.IMAGE);
		className.set ("img/Submit.png", __ASSET__img_submit_png);
		type.set ("img/Submit.png", AssetType.IMAGE);
		className.set ("img/Boomerang.jpg", __ASSET__img_boomerang_jpg);
		type.set ("img/Boomerang.jpg", AssetType.IMAGE);
		className.set ("img/Dominator.jpg", __ASSET__img_dominator_jpg);
		type.set ("img/Dominator.jpg", AssetType.IMAGE);
		className.set ("img/GateKeeper.jpg", __ASSET__img_gatekeeper_jpg);
		type.set ("img/GateKeeper.jpg", AssetType.IMAGE);
		className.set ("img/GreatWhite.jpg", __ASSET__img_greatwhite_jpg);
		type.set ("img/GreatWhite.jpg", AssetType.IMAGE);
		className.set ("img/Joker.jpg", __ASSET__img_joker_jpg);
		type.set ("img/Joker.jpg", AssetType.IMAGE);
		className.set ("img/KingDaKa.jpg", __ASSET__img_kingdaka_jpg);
		type.set ("img/KingDaKa.jpg", AssetType.IMAGE);
		className.set ("img/MainMenu.png", __ASSET__img_mainmenu_png);
		type.set ("img/MainMenu.png", AssetType.IMAGE);
		className.set ("img/RideOfSteel.jpg", __ASSET__img_rideofsteel_jpg);
		type.set ("img/RideOfSteel.jpg", AssetType.IMAGE);
		className.set ("img/SpaceMountain.jpg", __ASSET__img_spacemountain_jpg);
		type.set ("img/SpaceMountain.jpg", AssetType.IMAGE);
		className.set ("img/TimeWarp.jpg", __ASSET__img_timewarp_jpg);
		type.set ("img/TimeWarp.jpg", AssetType.IMAGE);
		className.set ("img/Tornado.jpg", __ASSET__img_tornado_jpg);
		type.set ("img/Tornado.jpg", AssetType.IMAGE);
		className.set ("assets/music/gamemusic1.ogg", __ASSET__assets_music_gamemusic1_ogg);
		type.set ("assets/music/gamemusic1.ogg", AssetType.MUSIC);
		className.set ("assets/music/gamemusic2.ogg", __ASSET__assets_music_gamemusic2_ogg);
		type.set ("assets/music/gamemusic2.ogg", AssetType.MUSIC);
		className.set ("assets/music/gamemusic3.ogg", __ASSET__assets_music_gamemusic3_ogg);
		type.set ("assets/music/gamemusic3.ogg", AssetType.MUSIC);
		className.set ("assets/music/menuMusic1.ogg", __ASSET__assets_music_menumusic1_ogg);
		type.set ("assets/music/menuMusic1.ogg", AssetType.MUSIC);
		className.set ("assets/music/menuMusic2.ogg", __ASSET__assets_music_menumusic2_ogg);
		type.set ("assets/music/menuMusic2.ogg", AssetType.MUSIC);
		className.set ("assets/music/menuMusic3.ogg", __ASSET__assets_music_menumusic3_ogg);
		type.set ("assets/music/menuMusic3.ogg", AssetType.MUSIC);
		className.set ("assets/music/scoreMusic1.ogg", __ASSET__assets_music_scoremusic1_ogg);
		type.set ("assets/music/scoreMusic1.ogg", AssetType.MUSIC);
		className.set ("assets/music/scoreMusic2.ogg", __ASSET__assets_music_scoremusic2_ogg);
		type.set ("assets/music/scoreMusic2.ogg", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "img/Button quizgame.psd";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "img/coasternews quiz background.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/coasternews quiz info.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/coasternews quiz.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/coasternews quiz2.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/exit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Scores.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/start.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Submit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Boomerang.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Dominator.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/GateKeeper.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/GreatWhite.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Joker.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/KingDaKa.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/MainMenu.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/RideOfSteel.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/SpaceMountain.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/TimeWarp.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Tornado.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/gamemusic1.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/gamemusic2.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/gamemusic3.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/menuMusic1.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/menuMusic2.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/menuMusic3.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/scoreMusic1.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/scoreMusic2.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("img/Button quizgame.psd", __ASSET__img_button_quizgame_psd);
		type.set ("img/Button quizgame.psd", AssetType.BINARY);
		
		className.set ("img/coasternews quiz background.jpg", __ASSET__img_coasternews_quiz_background_jpg);
		type.set ("img/coasternews quiz background.jpg", AssetType.IMAGE);
		
		className.set ("img/coasternews quiz info.jpg", __ASSET__img_coasternews_quiz_info_jpg);
		type.set ("img/coasternews quiz info.jpg", AssetType.IMAGE);
		
		className.set ("img/coasternews quiz.jpg", __ASSET__img_coasternews_quiz_jpg);
		type.set ("img/coasternews quiz.jpg", AssetType.IMAGE);
		
		className.set ("img/coasternews quiz2.jpg", __ASSET__img_coasternews_quiz2_jpg);
		type.set ("img/coasternews quiz2.jpg", AssetType.IMAGE);
		
		className.set ("img/exit.png", __ASSET__img_exit_png);
		type.set ("img/exit.png", AssetType.IMAGE);
		
		className.set ("img/Scores.png", __ASSET__img_scores_png);
		type.set ("img/Scores.png", AssetType.IMAGE);
		
		className.set ("img/start.png", __ASSET__img_start_png);
		type.set ("img/start.png", AssetType.IMAGE);
		
		className.set ("img/Submit.png", __ASSET__img_submit_png);
		type.set ("img/Submit.png", AssetType.IMAGE);
		
		className.set ("img/Boomerang.jpg", __ASSET__img_boomerang_jpg);
		type.set ("img/Boomerang.jpg", AssetType.IMAGE);
		
		className.set ("img/Dominator.jpg", __ASSET__img_dominator_jpg);
		type.set ("img/Dominator.jpg", AssetType.IMAGE);
		
		className.set ("img/GateKeeper.jpg", __ASSET__img_gatekeeper_jpg);
		type.set ("img/GateKeeper.jpg", AssetType.IMAGE);
		
		className.set ("img/GreatWhite.jpg", __ASSET__img_greatwhite_jpg);
		type.set ("img/GreatWhite.jpg", AssetType.IMAGE);
		
		className.set ("img/Joker.jpg", __ASSET__img_joker_jpg);
		type.set ("img/Joker.jpg", AssetType.IMAGE);
		
		className.set ("img/KingDaKa.jpg", __ASSET__img_kingdaka_jpg);
		type.set ("img/KingDaKa.jpg", AssetType.IMAGE);
		
		className.set ("img/MainMenu.png", __ASSET__img_mainmenu_png);
		type.set ("img/MainMenu.png", AssetType.IMAGE);
		
		className.set ("img/RideOfSteel.jpg", __ASSET__img_rideofsteel_jpg);
		type.set ("img/RideOfSteel.jpg", AssetType.IMAGE);
		
		className.set ("img/SpaceMountain.jpg", __ASSET__img_spacemountain_jpg);
		type.set ("img/SpaceMountain.jpg", AssetType.IMAGE);
		
		className.set ("img/TimeWarp.jpg", __ASSET__img_timewarp_jpg);
		type.set ("img/TimeWarp.jpg", AssetType.IMAGE);
		
		className.set ("img/Tornado.jpg", __ASSET__img_tornado_jpg);
		type.set ("img/Tornado.jpg", AssetType.IMAGE);
		
		className.set ("assets/music/gamemusic1.ogg", __ASSET__assets_music_gamemusic1_ogg);
		type.set ("assets/music/gamemusic1.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/gamemusic2.ogg", __ASSET__assets_music_gamemusic2_ogg);
		type.set ("assets/music/gamemusic2.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/gamemusic3.ogg", __ASSET__assets_music_gamemusic3_ogg);
		type.set ("assets/music/gamemusic3.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/menuMusic1.ogg", __ASSET__assets_music_menumusic1_ogg);
		type.set ("assets/music/menuMusic1.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/menuMusic2.ogg", __ASSET__assets_music_menumusic2_ogg);
		type.set ("assets/music/menuMusic2.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/menuMusic3.ogg", __ASSET__assets_music_menumusic3_ogg);
		type.set ("assets/music/menuMusic3.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/scoreMusic1.ogg", __ASSET__assets_music_scoremusic1_ogg);
		type.set ("assets/music/scoreMusic1.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/scoreMusic2.ogg", __ASSET__assets_music_scoremusic2_ogg);
		type.set ("assets/music/scoreMusic2.ogg", AssetType.MUSIC);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__img_button_quizgame_psd extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__img_coasternews_quiz_background_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_coasternews_quiz_info_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_coasternews_quiz_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_coasternews_quiz2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_exit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_scores_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_start_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_submit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_boomerang_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_dominator_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_gatekeeper_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_greatwhite_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_joker_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_kingdaka_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_mainmenu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_rideofsteel_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_spacemountain_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_timewarp_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_tornado_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_gamemusic1_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_gamemusic2_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_gamemusic3_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_menumusic1_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_menumusic2_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_menumusic3_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_scoremusic1_ogg extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_scoremusic2_ogg extends flash.media.Sound { }


#elseif html5

































#else



#if (windows || mac || linux)


@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:file("assets/img/Button quizgame.psd") #if display private #end class __ASSET__img_button_quizgame_psd extends lime.utils.ByteArray {}
@:image("assets/img/coasternews quiz background.jpg") #if display private #end class __ASSET__img_coasternews_quiz_background_jpg extends lime.graphics.Image {}
@:image("assets/img/coasternews quiz info.jpg") #if display private #end class __ASSET__img_coasternews_quiz_info_jpg extends lime.graphics.Image {}
@:image("assets/img/coasternews quiz.jpg") #if display private #end class __ASSET__img_coasternews_quiz_jpg extends lime.graphics.Image {}
@:image("assets/img/coasternews quiz2.jpg") #if display private #end class __ASSET__img_coasternews_quiz2_jpg extends lime.graphics.Image {}
@:image("assets/img/exit.png") #if display private #end class __ASSET__img_exit_png extends lime.graphics.Image {}
@:image("assets/img/Scores.png") #if display private #end class __ASSET__img_scores_png extends lime.graphics.Image {}
@:image("assets/img/start.png") #if display private #end class __ASSET__img_start_png extends lime.graphics.Image {}
@:image("assets/img/Submit.png") #if display private #end class __ASSET__img_submit_png extends lime.graphics.Image {}
@:image("assets/gameImage/Boomerang.jpg") #if display private #end class __ASSET__img_boomerang_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/Dominator.jpg") #if display private #end class __ASSET__img_dominator_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/GateKeeper.jpg") #if display private #end class __ASSET__img_gatekeeper_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/GreatWhite.jpg") #if display private #end class __ASSET__img_greatwhite_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/Joker.jpg") #if display private #end class __ASSET__img_joker_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/KingDaKa.jpg") #if display private #end class __ASSET__img_kingdaka_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/MainMenu.png") #if display private #end class __ASSET__img_mainmenu_png extends lime.graphics.Image {}
@:image("assets/gameImage/RideOfSteel.jpg") #if display private #end class __ASSET__img_rideofsteel_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/SpaceMountain.jpg") #if display private #end class __ASSET__img_spacemountain_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/TimeWarp.jpg") #if display private #end class __ASSET__img_timewarp_jpg extends lime.graphics.Image {}
@:image("assets/gameImage/Tornado.jpg") #if display private #end class __ASSET__img_tornado_jpg extends lime.graphics.Image {}
@:file("assets/music/gamemusic1.ogg") #if display private #end class __ASSET__assets_music_gamemusic1_ogg extends lime.utils.ByteArray {}
@:file("assets/music/gamemusic2.ogg") #if display private #end class __ASSET__assets_music_gamemusic2_ogg extends lime.utils.ByteArray {}
@:file("assets/music/gamemusic3.ogg") #if display private #end class __ASSET__assets_music_gamemusic3_ogg extends lime.utils.ByteArray {}
@:file("assets/music/menuMusic1.ogg") #if display private #end class __ASSET__assets_music_menumusic1_ogg extends lime.utils.ByteArray {}
@:file("assets/music/menuMusic2.ogg") #if display private #end class __ASSET__assets_music_menumusic2_ogg extends lime.utils.ByteArray {}
@:file("assets/music/menuMusic3.ogg") #if display private #end class __ASSET__assets_music_menumusic3_ogg extends lime.utils.ByteArray {}
@:file("assets/music/scoreMusic1.ogg") #if display private #end class __ASSET__assets_music_scoremusic1_ogg extends lime.utils.ByteArray {}
@:file("assets/music/scoreMusic2.ogg") #if display private #end class __ASSET__assets_music_scoremusic2_ogg extends lime.utils.ByteArray {}



#end

#if openfl

#end

#end
#end

