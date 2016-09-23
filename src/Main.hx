package;

import js.Lib;
import pixi.core.graphics.Graphics;
import pixi.loaders.Loader;
import pixi.plugins.app.Application;
import sheep.sheep.race.setup.ContextConfig;
import sheep.sheep.race.views.GameView;
import sheep.sheep.race.views.HomeView;
import sheep.sheep.race.views.IntroView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class Main extends Application
{
	
	function new()
	{
		super();
		
		init();
	}
	
	function init() 
	{
		backgroundColor = 0xFFFFFF;
		autoResize = false;
		width = 640;
		height = 480;
		super.start( Application.AUTO );
	 		
		var loader:Loader = new Loader();
		loader.add("font", "assets/fonts/setzer_pixel_font.xml");
		loader.add("mc", "assets/atlas/sheep_spritesheet.json");
		loader.load( onLoaded );
	}
	
	function onLoaded() 
	{
		var context:ContextConfig = new ContextConfig( stage );
	}	
	
	static function main() 
	{
		new Main();
	}
	
}