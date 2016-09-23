package sheep.sheep.race.mediators;
import haxe.Timer;
import pixi.core.display.Container;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.views.StartingPopup;

/**
 * ...
 * @author Ronaldo Santiago
 */
class StartingPopupMediator extends AbstractMediator 
{
	var view:StartingPopup;
	var timer:Timer;
	var count:Int;

	public function new(view:Container) 
	{
		super(view);
		this.view = cast(viewComponent, StartingPopup);
	}
	
	override public function initialize() 
	{
		timer = new Timer(600);
		timer.run = onTimer;
		count = 3;
	}
	
	function onTimer() 
	{
		count -= 1;
		view.updateValue(count);
		
		if (count > 0) return;
		timer.stop();
		dispatcherEvent(FlowEvent.REMOVE_LAST_FLOATING_VIEW);
	}
	
	override public function destroy() 
	{
		//dispatcherEvent(GameEvent.START);
	}
	
}