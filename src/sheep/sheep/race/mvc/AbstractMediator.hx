package sheep.sheep.race.mvc;
import pixi.core.display.Container;

/**
 * ...
 * @author Ronaldo Santiago
 */
class AbstractMediator
{
	var viewComponent:Container;

	public function new(view:Container) 
	{
		viewComponent = view;
	}
	
	public function initialize()
	{
		
	}
	
	public function destroy()
	{
		
	}
		
}