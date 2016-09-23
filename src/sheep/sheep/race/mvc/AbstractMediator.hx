package sheep.sheep.race.mvc;
import pixi.core.display.Container;

/**
 * ...
 * @author Ronaldo Santiago
 */
class AbstractMediator
{
	var dispatcher:Container;
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
	
	public function updateDispacher()
	{
		dispatcher = viewComponent.parent;
	}

	function dispatcherEvent( event:String )
	{
		dispatcher.emit(event, event);
	}
	
}