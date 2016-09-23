package sheep.sheep.race.mediators;

import pixi.core.display.Container;
import sheep.sheep.race.models.GameModel;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.views.BetFeedbackPopup;

/**
 * ...
 * @author Ronaldo Santiago
 */
class BetFeedbackPopupMediator extends AbstractMediator 
{

	var view:BetFeedbackPopup;
	var gameModel:GameModel;
	var flowService:FlowService;
	
	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, BetFeedbackPopup);
		gameModel = Repository.getInstanceOf(GameModel);
		flowService = Repository.getInstanceOf(FlowService);
	}
	
	override public function initialize() 
	{
		view.createPodium(gameModel);
		view.homeButton.addListener("click", onHome );
		view.retryButton.addListener("click", onRetry );
	}
	
	function onRetry() 
	{
		flowService.setGameView();
	}
	
	function onHome() 
	{
		flowService.setHomeView();
	}
	
	override public function destroy() 
	{
		view.homeButton.removeListener("click", onHome );
		view.retryButton.removeListener("click", onRetry );
	}
}