package sheep.sheep.race.mediators;
import pixi.core.display.Container;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.views.GameView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class GameViewMediator extends AbstractMediator
{
	var view:GameView;
	
	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, GameView);
		
	}
	
	override public function initialize() 
	{
	}
	
	override public function destroy() 
	{
		view.removeAllListeners();
	}
	
}