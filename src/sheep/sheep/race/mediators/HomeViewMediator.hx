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
	
	override public function initialize() 
	{
		trace("HOME INITALIZE");
		view = cast(viewComponent, HomeView);
		view.startButton.addListener("click", onClick );
	}
	
	function onClick() 
	{
		view.parent.emit(FlowEvent.SHOW_GAME, FlowEvent.SHOW_GAME);
	}

	override public function destroy() 
	{
		trace("HOME DESTROY");
		view.removeAllListeners();
	}
}