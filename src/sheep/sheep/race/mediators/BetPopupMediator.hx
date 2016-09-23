package sheep.sheep.race.mediators;

import pixi.core.display.Container;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.views.BetPopup;

/**
 * ...
 * @author Ronaldo Santiago
 */
class BetPopupMediator extends AbstractMediator 
{
	var view:BetPopup;

	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, BetPopup);
	}
	
	override public function initialize() 
	{
		view.startButton.on("click", onStart);
	}
	
	function onStart() 
	{
		var yourBetToFirstPosition:Int = view.sheepSelectorFirst.getCurrentIndex();
		var yourBetToLastPosition:Int = view.sheepSelectorLast.getCurrentIndex();
		if ( yourBetToFirstPosition == yourBetToLastPosition )
		{
			dispatcherEvent(FlowEvent.ADD_ALERT_POPUP);
			return;
		}
		dispatcherEvent(FlowEvent.REMOVE_LAST_FLOATING_VIEW);
	}
	
	override public function destroy() 
	{
		trace("DESTROY?");
		dispatcherEvent(FlowEvent.ADD_STARTING_POPUP);
	}
	
	
}