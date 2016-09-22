package;

import js.Lib;
import pixi.core.graphics.Graphics;
import pixi.loaders.Loader;
import pixi.plugins.app.Application;
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
		super.start( Application.AUTO );
	 		
		var loader:Loader = new Loader();
		loader.add("font", "assets/fonts/setzer_pixel_font.xml");
		loader.add("mc", "assets/atlas/sheep_spritesheet.json");
		loader.load( onLoaded );
	}
	
	function onLoaded() 
	{
		//stage.addChild(new IntroView());		
		//stage.addChild(new HomeView());		
		stage.addChild(new GameView());		
	}	
	
	static function main() 
	{
		new Main();
	}
	
}