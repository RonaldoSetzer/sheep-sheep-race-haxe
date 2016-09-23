package sheep.sheep.race.mediators;

import haxe.Timer;
import pixi.core.display.Container;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.views.IntroView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class IntroViewMediator extends AbstractMediator
{
	var view:IntroView;
	var timer:Timer;
	var flowService:FlowService;
	
	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, IntroView);
		flowService = Repository.getInstanceOf(FlowService);
	}
	
	override public function initialize() 
	{
		timer = new Timer(2000);
		timer.run = onTimer;
	}
	
	function onTimer() 
	{
		timer.stop();
		timer = null;
		flowService.setHomeView();
	}
}