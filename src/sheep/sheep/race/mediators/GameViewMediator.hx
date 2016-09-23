package sheep.sheep.race.mediators;

import js.Browser;
import pixi.core.display.Container;
import pixi.extras.MovieClip;
import sheep.sheep.race.events.GameEvent;
import sheep.sheep.race.managers.GameManager;
import sheep.sheep.race.models.GameModel;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.views.GameView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class GameViewMediator extends AbstractMediator
{
	var view:GameView;
	var gameModel:GameModel;
	var gameManager:GameManager;
	var flowService:FlowService;
	var isActivedLoop:Bool;
	
	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, GameView);
		
		gameModel = Repository.getInstanceOf(GameModel);
		gameManager = Repository.getInstanceOf(GameManager);
		flowService = Repository.getInstanceOf(FlowService);
	}
	
	override public function initialize() 
	{
		isActivedLoop = false;
		gameModel.clear();
		udpatePositions();
		
		view.betButton.addListener("click", onClick );
		addContextListener( GameEvent.START, onGameStart );
		addContextListener( GameEvent.FINISH, onGameFinish );
	}
	
	private function onGameFinish(e):Void 
	{
		isActivedLoop = false;
		var sheeps:Array<MovieClip> = view.getSheeps();
		for ( i in 0...sheeps.length )
		{
			sheeps[i].stop();
		}
		flowService.addBetFeedbackPopup();
	}
	
	private function onGameStart(e):Void 
	{
		isActivedLoop = true;
		var sheeps:Array<MovieClip> = view.getSheeps();
		for ( i in 0...sheeps.length )
		{
			sheeps[i].play();
		}
		
		Browser.window.requestAnimationFrame(cast onLoop);
	}

	function onLoop() 
	{
		if (isActivedLoop == false) return;
		
		Browser.window.requestAnimationFrame(cast onLoop);
		
		gameManager.updateRace();
		udpatePositions();
	}
	
	function udpatePositions() 
	{
		var sheeps:Array<MovieClip> = view.getSheeps();
		for ( i in 0...sheeps.length )
		{
			sheeps[i].x = gameModel.distances[i];
		}
	}
	
	function onClick() 
	{
		view.betButton.visible = false;
		flowService.addBetPopup();
	}
	
	override public function destroy() 
	{
		view.betButton.removeListener("click", onClick );
		removeContextListener( GameEvent.START, onGameStart );
		removeContextListener( GameEvent.FINISH, onGameFinish );
		view.removeAllListeners();
	}
	
}