package sheep.sheep.race.mvc;
import pixi.core.display.Container;
import sheep.sheep.race.mediators.HomeViewMediator;
import sheep.sheep.race.mvc.AbstractMediator;
import sheep.sheep.race.views.HomeView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class MediatorMap 
{

	var mapMediators:Map<String,Class<Dynamic>>;
	var activedMediators:Map<String,AbstractMediator>;
	
	public function new() 
	{
		mapMediators = new Map<String,Class<Dynamic>>();
		activedMediators = new Map<String,AbstractMediator>();
	}
	
	public function map(viewClass:Class<Dynamic>, mediatorClass:Class<Dynamic>) 
	{	
		if (viewClass == null || mediatorClass == null ) return;
		
		mapMediators.set(Type.getClassName(viewClass), mediatorClass);
	}
	
	public function unmap(viewClass:Class<Dynamic>)
	{
		if (viewClass == null) return;
		
		mapMediators.remove(Type.getClassName(viewClass));
	}
	
	public function mediate(viewClass:Class<Dynamic>, view:Container) 
	{
		if ( view == null ) return;
		
		var viewClassName:String = Type.getClassName(viewClass);
		var mediatorClass:Class<Dynamic> = mapMediators.get( viewClassName );
		
		if (mediatorClass == null  ) return;
		
		var mediator:AbstractMediator = Type.createInstance(mediatorClass, [view]);
		mediator.initialize();
		
		activedMediators.set(viewClassName,mediator);
	}
	
	public function unmediate( view:Container) 
	{
		if (view == null) return;
		
		var viewClassName:String = Type.getClassName(Type.getClass(view));
		var mediator:AbstractMediator = activedMediators.get( viewClassName );
		
		if (mediator == null) return;
		
		mediator.destroy();
		
		activedMediators.remove(viewClassName);
		mediator = null;
	}
}