package sheep.sheep.race.managers;

import core.AssetLoader;
import core.AudioAsset;
import pixi.loaders.Loader;
import sheep.sheep.race.info.SoundInfo;

/**
 * ...
 * @author Ronaldo Santiago
 */
class SoundManager 
{
	var loader:AssetLoader;
	var overworld:AudioAsset;
	var map:Map<String,AudioAsset>;

	public function new() 
	{
		map = new Map<String,AudioAsset>();
		
		loader = new AssetLoader();
		loader.baseUrl = "assets/sounds/";
		loader.addAudioAsset(SoundInfo.OVERWORLD, "music_overworld.mp3");
		loader.addAudioAsset(SoundInfo.YOU_LOSE,"sfx_you_lose.mp3");
		loader.addAudioAsset(SoundInfo.YOU_WIN,"sfx_you_win.mp3");
		loader.start( onLoaded );
	}
	
	function onLoaded() 
	{
		overworld = loader.getAudio(SoundInfo.OVERWORLD);
		overworld.loop = true;
		overworld.play();
		
		map.set( SoundInfo.YOU_LOSE, loader.getAudio(SoundInfo.YOU_LOSE));
		map.set( SoundInfo.YOU_WIN, loader.getAudio(SoundInfo.YOU_WIN));
	}
	
	public function playSFX( key:String )
	{
		if (map.get(key) == null) return;
		
		var sfx:AudioAsset = map.get(key);
		sfx.play();
	}
	
}