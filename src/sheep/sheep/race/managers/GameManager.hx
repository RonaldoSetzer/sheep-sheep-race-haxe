package sheep.sheep.race.managers;
import pixi.core.display.Container;
import sheep.sheep.race.models.GameModel;
import sheep.sheep.race.mvc.Repository;
import sheep.sheep.race.services.GameService;

/**
 * ...
 * @author Ronaldo Santiago
 */
class GameManager 
{
	var gameModel:GameModel;
	var gameService:GameService;
	
	public function new()
	{
		gameModel = Repository.getInstanceOf(GameModel);
		gameService = Repository.getInstanceOf(GameService);
	}

	public function updateRace()
	{
		var speeds:Array<Int> = [1, 2, 3, 4];
		var speed:Int;

		for ( i in 0...gameModel.distances.length )
		{
			speed = speeds[Math.floor( Math.random() * speeds.length )];
			gameModel.distances[i]+= speed;
			if ( gameModel.distances[i] >= 500 )
			{
				gameModel.addRacePosition( i );
			}
			if ( gameModel.isTheRaceFinished() )
			{
				gameService.finish();
				return;
			}
		}
	}
}