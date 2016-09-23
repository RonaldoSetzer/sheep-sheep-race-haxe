package sheep.sheep.race.mediators;

import pixi.core.display.Container;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.views.HomeView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class HomeViewMediator extends AbstractMediator
{
	var view:HomeView;
	var flowService:FlowService;
	
	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, HomeView);
		flowService = Repository.getInstanceOf(FlowService);
	}
	
	override public function initialize() 
	{
		view.startButton.addListener("click", onClick );
	}
	
	function onClick() 
	{
		flowService.setGameView();
	}

	override public function destroy() 
	{
		view.removeAllListeners();
	}
	
}