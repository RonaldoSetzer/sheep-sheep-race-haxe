package sheep.sheep.race.mvc;
import pixi.core.Pixi;
import pixi.core.display.Container;
import pixi.interaction.EventTarget;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.mediators.HomeViewMediator;
import sheep.sheep.race.mvc.MediatorMap;
import sheep.sheep.race.views.HomeView;
import sheep.sheep.race.views.IntroView;

/**
 * ...
 * @author Ronaldo Santiago
 */
class FlowManager 
{
	var viewManager:ViewManager;
	var mediatorMap:MediatorMap;
	var mapEvents:Map<String,Class<Dynamic>>;
	var stage:Container;
	
	public function new(stage:Container, mediatorMap:MediatorMap) 
	{
		this.mediatorMap = mediatorMap;
		
		this.stage = stage;
		viewManager = new ViewManager(stage);
		mapEvents = new Map<String,Class<Dynamic>>();
		stage.on(FlowEvent.REMOVE_LAST_FLOATING_VIEW, onRemoveLastFloatingView);
	}
	
	function onRemoveLastFloatingView() 
	{
		var view:Container = viewManager.removeLastFloatingView();
		
		if (view == null) return;
		
		mediatorMap.unmediate(view);
	}
	
	public function mapSetView(event:String, view:Class<Dynamic>) 
	{
		mapEvents.set(event, view);
		stage.on(event, onSetView);
	}
	
	public function mapAddView(event:String, view:Class<Dynamic>) 
	{
		mapEvents.set(event, view);
		stage.on(event, onAddView);
	}
	
	private function onSetView(type:Dynamic) 
	{
		mediatorMap.unmediate(viewManager.get_currentView());
		
		var viewClass:Class<Dynamic> = mapEvents.get(type);
		var view:Container = Type.createInstance(viewClass,[]);
		viewManager.setView(view);
		
		mediatorMap.mediate( viewClass, view );
	}
	
	private function onAddView(type:Dynamic) 
	{
		mediatorMap.unmediate(viewManager.get_currentView());
		
		var viewClass:Class<Dynamic> = mapEvents.get(type);
		var view:Container = Type.createInstance(viewClass,[]);
		viewManager.addView(view);
		
		mediatorMap.mediate( viewClass, view );
	}
	
}