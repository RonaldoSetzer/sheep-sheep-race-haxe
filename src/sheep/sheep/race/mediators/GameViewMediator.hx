package sheep.sheep.race.mediators;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.views.GameView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class GameViewMediator extends AbstractMediator
{
	var view:GameView;
	
	override public function initialize() 
	{
		view = cast(viewComponent, GameView);
	}
	
	override public function destroy() 
	{
		view.removeAllListeners();
	}
}