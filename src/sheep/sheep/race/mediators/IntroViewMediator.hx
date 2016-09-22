package sheep.sheep.race.mediators;

import haxe.Timer;
import pixi.core.display.Container;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.views.IntroView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class IntroViewMediator extends AbstractMediator 
{
	var view:IntroView;
	var timer:Timer;

	public function new(view:Container) 
	{
		super(view);
		this.view = cast(viewComponent, IntroView);
	}
	
	override public function initialize() 
	{
		timer = new Timer(2000);
		timer.run = onTimer;
	}
	
	function onTimer() 
	{
		timer.stop();
		dispatcherEvent(FlowEvent.SHOW_HOME);
	}
}