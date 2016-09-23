package sheep.sheep.race.mediators;
import haxe.Timer;
import pixi.core.display.Container;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.events.GameEvent;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.services.GameService;
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
	var flowService:FlowService;
	var gameService:GameService;

	public function new(view:Container) 
	{
		super(view);
		this.view = cast(viewComponent, StartingPopup);
		flowService = Repository.getInstanceOf(FlowService);
		gameService = Repository.getInstanceOf(GameService);
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
		
		flowService.removeLastFloatingView();
	}
	
	override public function destroy() 
	{
		gameService.start();
	}
	
}