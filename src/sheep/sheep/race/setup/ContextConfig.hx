package sheep.sheep.race.setup;
import pixi.core.display.Container;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.mediators.GameViewMediator;
import sheep.sheep.race.mediators.IntroViewMediator;
import sheep.sheep.race.mvc.FlowManager;
import sheep.sheep.race.mvc.MediatorMap;
import sheep.sheep.race.mvc.ViewManager;
import sheep.sheep.race.mediators.HomeViewMediator;
import sheep.sheep.race.views.GameView;
import sheep.sheep.race.views.HomeView;
import sheep.sheep.race.views.IntroView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class ContextConfig 
{
	var stage:Container;
	var flowManager:FlowManager;
	var mediatorMap:MediatorMap;
	
	public function new(stage:Container) 
	{
		this.stage = stage;
		
		mediatorMap = new MediatorMap();
		mediatorMap.map(IntroView, IntroViewMediator);
		mediatorMap.map(HomeView, HomeViewMediator);
		mediatorMap.map(GameView, GameViewMediator);
		
		flowManager = new FlowManager( stage, mediatorMap );
		
		flowManager.mapSetView( FlowEvent.SHOW_INTRO, IntroView );
		flowManager.mapSetView( FlowEvent.SHOW_HOME, HomeView );
		flowManager.mapSetView( FlowEvent.SHOW_GAME, GameView );
		
		init();
	}
	
	function init() 
	{
		stage.emit(FlowEvent.SHOW_INTRO, FlowEvent.SHOW_INTRO);
	}	
}