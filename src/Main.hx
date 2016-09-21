package;

import js.Lib;
import pixi.core.graphics.Graphics;
import pixi.plugins.app.Application;

/**
 * ...
 * @author Ronaldo Santiago
 */
class Main extends Application
{
	
	function new()
	{
		super();
		
		_init();
	}
	
	function _init() 
	{
		backgroundColor = 0xFF6600;
		super.start( Application.AUTO );
	 
		var graphic:Graphics = new Graphics();
		graphic.beginFill(0xFF0000, .3);
		graphic.drawRect(0, 0, 640, 480);
		graphic.endFill();
		
		stage.addChild(graphic);
	}
	
	static function main() 
	{
		new Main();
	}
	
}