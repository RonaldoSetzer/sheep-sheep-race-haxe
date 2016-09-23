package sheep.sheep.race.mediators;

import haxe.Timer;
import pixi.core.display.Container;
import sheep.sheep.race.info.SoundInfo;
import sheep.sheep.race.managers.SoundManager;
import sheep.sheep.race.models.GameModel;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.FlowService;
import sheep.sheep.race.views.BetFeedbackPopup;

/**
 * ...
 * @author Ronaldo Santiago
 */
class BetFeedbackPopupMediator extends AbstractMediator 
{

	var view:BetFeedbackPopup;
	var gameModel:GameModel;
	var flowService:FlowService;
	var soundManager:SoundManager;
	var timer:Timer;
	var count:Int;
	
	public function new(view:Container) 
	{
		super(view);
		
		this.view = cast(viewComponent, BetFeedbackPopup);
		gameModel = Repository.getInstanceOf(GameModel);
		flowService = Repository.getInstanceOf(FlowService);
		soundManager = Repository.getInstanceOf(SoundManager);
	}
	
	override public function initialize() 
	{
		view.createPodium(gameModel);
		view.homeButton.addListener("click", onHome );
		view.retryButton.addListener("click", onRetry );
		
		count = 0;
		timer = new Timer(200);
		timer.run = onSfxPlaY;
		soundManager.playSFX(SoundInfo.YOU_LOSE);
	}
	
	function onSfxPlaY() 
	{
		if (count == 0 && gameModel.youWonTheFirstPosition()) soundManager.playSFX(SoundInfo.YOU_WIN);
		else if (count == 0) soundManager.playSFX(SoundInfo.YOU_LOSE);
		else if (gameModel.youWonTheLastPosition()) soundManager.playSFX(SoundInfo.YOU_WIN);
		else soundManager.playSFX(SoundInfo.YOU_LOSE);
		
		count += 1;
		if (count < 2) return;
		
		timer.stop();
		timer = null;
		
	}
	
	function onRetry() 
	{
		flowService.setGameView();
	}
	
	function onHome() 
	{
		flowService.setHomeView();
	}
	
	override public function destroy() 
	{
		view.homeButton.removeListener("click", onHome );
		view.retryButton.removeListener("click", onRetry );
	}
}