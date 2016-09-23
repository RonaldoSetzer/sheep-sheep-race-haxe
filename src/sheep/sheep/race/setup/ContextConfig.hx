package sheep.sheep.race.setup;
import pixi.core.display.Container;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.managers.GameManager;
import sheep.sheep.race.mediators.AlertPopupMediator;
import sheep.sheep.race.mediators.BetFeedbackPopupMediator;
import sheep.sheep.race.mediators.BetPopupMediator;
import sheep.sheep.race.mediators.GameViewMediator;
import sheep.sheep.race.mediators.IntroViewMediator;
import sheep.sheep.race.mediators.StartingPopupMediator;
import sheep.sheep.race.models.GameModel;
import sheep.sheep.race.mvc.FlowManager;
import sheep.sheep.race.mvc.MediatorMap;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.mvc.ViewManager;
import sheep.sheep.race.mediators.HomeViewMediator;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.services.GameService;
import sheep.sheep.race.views.AlertPopup;
import sheep.sheep.race.views.BetFeedbackPopup;
import sheep.sheep.race.views.BetPopup;
import sheep.sheep.race.views.GameView;
import sheep.sheep.race.views.HomeView;
import sheep.sheep.race.views.IntroView;
import sheep.sheep.race.views.StartingPopup;

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
		
		Repository.mapToSingleton( stage, Container);
		
		Repository.mapAsSingleton(GameModel);
		Repository.mapAsSingleton(GameService);
		Repository.mapAsSingleton(FlowService);
		Repository.mapAsSingleton(GameManager);
		
		mediatorMap = new MediatorMap();
		mediatorMap.map(IntroView, IntroViewMediator);
		mediatorMap.map(HomeView, HomeViewMediator);
		mediatorMap.map(GameView, GameViewMediator);
		
		mediatorMap.map(AlertPopup, AlertPopupMediator);
		mediatorMap.map(BetPopup, BetPopupMediator);
		mediatorMap.map(BetFeedbackPopup, BetFeedbackPopupMediator);
		mediatorMap.map(StartingPopup, StartingPopupMediator);
		
		flowManager = new FlowManager( stage, mediatorMap );
		
		flowManager.mapSetView( FlowEvent.SHOW_INTRO, IntroView );
		flowManager.mapSetView( FlowEvent.SHOW_HOME, HomeView );
		flowManager.mapSetView( FlowEvent.SHOW_GAME, GameView );
		
		flowManager.mapAddView( FlowEvent.ADD_ALERT_POPUP, AlertPopup );
		flowManager.mapAddView( FlowEvent.ADD_BET_POPUP, BetPopup );
		flowManager.mapAddView( FlowEvent.ADD_BET_FEEDBACK_POPUP, BetFeedbackPopup );
		flowManager.mapAddView( FlowEvent.ADD_STARTING_POPUP, StartingPopup );
		
		init();
	}
	
	function init() 
	{
		stage.emit(FlowEvent.SHOW_INTRO, FlowEvent.SHOW_INTRO);
	}	
}