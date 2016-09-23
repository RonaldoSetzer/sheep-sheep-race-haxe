package sheep.sheep.race.mvc;
import pixi.core.display.Container;
import sheep.sheep.race.models.GameModel;

/**
 * ...
 * @author Ronaldo Santiago
 */
class Repository 
{

	static private var instance(default, null):Repository = new Repository();
	
	private var map:Map<String,Dynamic>;
	
	private function new() 
	{
		init();
	}
	
	function init() 
	{
		map = new Map<String,Dynamic>();
	}
	
	static public function mapAsSingleton(clazz:Class<Dynamic>)
	{
		instance.map.set(Type.getClassName(clazz), Type.createInstance(clazz,[]));
	}
	
	static public function getInstanceOf( clazz:Class<Dynamic> ):Dynamic
	{
		return instance.map.get(Type.getClassName(clazz));
	}
	
	static public function mapToSingleton(object:Dynamic, clazz:Class<Dynamic>) 
	{
		instance.map.set(Type.getClassName(clazz), object);
	}
	
}