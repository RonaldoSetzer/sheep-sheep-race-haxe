package sheep.sheep.race.mvc;
import pixi.core.display.Container;
import sheep.sheep.race.mvc.Repository;

/**
 * ...
 * @author Ronaldo Santiago
 */
class AbstractService 
{
	var dispatcher:Container;

	public function new() 
	{
		dispatcher = Repository.getInstanceOf(Container);
	}
}