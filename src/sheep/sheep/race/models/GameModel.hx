package sheep.sheep.race.models;

/**
 * ...
 * @author Ronaldo Santiago
 */
class GameModel 
{
	public var yourBetToFirstPosition:Int;
	public var yourBetToLastPosition:Int;
	
	public var distances:Array<Int>;
	public var racePositions:Array<Int>;
	
	public function new()
	{
		clear();
	}
	
	public function addRacePosition(index:Int) 
	{
		if ( racePositions.indexOf(index)==-1)
		{
			racePositions.push(index);
		}
	}
	
	public function isTheRaceFinished():Bool
	{
		return racePositions.length == distances.length;
	}
	
	public function clear() 
	{
		distances = [0, 0, 0, 0];
		racePositions = [];
		yourBetToFirstPosition = 0;
		yourBetToLastPosition = 0;
	}
}