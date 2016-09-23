package sheep.sheep.race.mediators;

import pixi.core.display.Container;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.views.AlertPopup;


/**
 * ...
 * @author Ronaldo Santiago
 */
class AlertPopupMediator extends AbstractMediator
{
	var view:AlertPopup;
	var flowService:FlowService;

	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, AlertPopup);
		flowService = Repository.getInstanceOf(FlowService);
	}
	
	override public function initialize() 
	{
		view.okButton.on("click", onOk);
	}
	
	function onOk() 
	{
		flowService.removeLastFloatingView();
	}
}