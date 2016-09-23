package sheep.sheep.race.services;
import pixi.core.display.Container;
import sheep.sheep.race.events.GameEvent;
import sheep.sheep.race.mvc.AbstractService;

/**
 * ...
 * @author Ronaldo Santiago
 */
class GameService extends AbstractService
{
	public function new()
	{
		super();
	}
	
	function dispatcherEvent(event:String)
	{
		dispatcher.emit(event, event);
	}
	
	public function finish() 
	{
		dispatcherEvent(GameEvent.FINISH);
	}
	
	public function start() 
	{
		dispatcherEvent(GameEvent.START);
	}
}