package sheep.sheep.race.utils;
import pixi.core.display.DisplayObject;

/**
 * ...
 * @author Ronaldo Santiago
 */
class ViewPort 
{
	static public inline var MAX_WIDTH:Int = 640;
	static public inline var MAX_HEIGHT:Int = 480;
	static public inline var HALF_WIDTH:Int = 320;
	static public inline var HALF_HEIGHT:Int = 240;

	static public function alignCenter( object:DisplayObject )
	{
		object.position.set( HALF_WIDTH, HALF_HEIGHT );
	}
	
}