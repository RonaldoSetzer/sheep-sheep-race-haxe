package sheep.sheep.race.mediators;
import pixi.core.display.Container;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.views.GameView;
import sheep.sheep.race.views.HomeView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class HomeViewMediator extends AbstractMediator
{
	var view:HomeView;
	
	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, HomeView);
	}
	
	override public function initialize() 
	{
		view.startButton.addListener("click", onClick );
	}
	
	function onClick() 
	{
		dispatcherEvent(FlowEvent.SHOW_GAME);
	}

	override public function destroy() 
	{
		trace("HOME DESTROY");
		view.removeAllListeners();
	}
	
}