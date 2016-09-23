package sheep.sheep.race.mediators;
import pixi.core.display.Container;
import sheep.sheep.race.models.GameModel;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.views.BetPopup;



/**
 * ...
 * @author Ronaldo Santiago
 */
class BetPopupMediator extends AbstractMediator 
{
	var view:BetPopup;
	var gameModel:GameModel;
	var flowService:FlowService;

	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, BetPopup);
		gameModel = Repository.getInstanceOf(GameModel);
		flowService = Repository.getInstanceOf(FlowService);
	}
	
	override public function initialize() 
	{
		view.startButton.addListener("click", onStart);
	}
	
	function onStart() 
	{
		var yourBetToFirstPosition:Int = view.sheepSelectorFirst.getCurrentIndex();
		var yourBetToLastPosition:Int = view.sheepSelectorLast.getCurrentIndex();
		
		if ( yourBetToFirstPosition == yourBetToLastPosition )
		{
			flowService.addAlertPopup();
			return;
		}
		gameModel.yourBetToFirstPosition = yourBetToFirstPosition;
		gameModel.yourBetToLastPosition = yourBetToLastPosition;
		
		flowService.removeLastFloatingView();
	}
	
	override public function destroy() 
	{
		view.startButton.removeListener("click", onStart);
		flowService.addStartingPopup();
	}
	
	
}