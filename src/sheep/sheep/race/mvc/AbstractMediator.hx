package sheep.sheep.race.mvc;
import pixi.core.display.Container;
import pixi.interaction.EventTarget;

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
		dispatcher = Repository.getInstanceOf(Container);
	}
	
	public function initialize()
	{
		
	}
	
	public function destroy()
	{
		
	}
	
	public function addContextListener( event:String, fn:EventTarget->Void) 
	{
		dispatcher.on( event, fn );
	}
	
	public function removeContextListener( event:String, fn:EventTarget->Void) 
	{
		dispatcher.removeListener(event, fn);
	}

	function dispatcherEvent( event:String )
	{
		dispatcher.emit(event, event);
	}
	
}