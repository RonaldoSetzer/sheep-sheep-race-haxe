package sheep.sheep.race.mediators;
import pixi.core.display.Container;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.views.AlertPopup;

/**
 * ...
 * @author Ronaldo Santiago
 */
class AlertPopupMediator extends AbstractMediator
{
	var view:AlertPopup;

	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, AlertPopup);
	}
	
	override public function initialize() 
	{
		view.okButton.on("click", onOk);
	}
	
	function onOk() 
	{
		dispatcherEvent(FlowEvent.REMOVE_LAST_FLOATING_VIEW);
	}
}