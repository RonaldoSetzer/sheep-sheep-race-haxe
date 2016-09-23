package sheep.sheep.race.mvc;
import pixi.core.display.Container;

/**
 * ...
 * @author Ronaldo Santiago
 */
class ViewManager 
{
	var floatingViews:Array<Container>;
	var currentView(get, null):Container;
	var stage(get, null):Container;

	public function new(stage:Container) 
	{
		this.stage = stage;
		floatingViews = new Array<Container>();	
	}
	
	public function addView( view:Container ):Container
	{
		if (floatingViews.indexOf(view) ==-1)
		{
			floatingViews.push(view);
			stage.addChild(view);
		}
		return view;
	}
	
	public function removeFloatingView( view:Container ) 
	{
		var index:Int = floatingViews.indexOf(view);
		
		if (index == -1) return;
		
		floatingViews.splice(index, 1);
		stage.removeChild(view);
	}
	
	public function removeLastFloatingView():Container
	{
		if (floatingViews.length == 0) return null;
		
		var view:Container = floatingViews.pop();
		stage.removeChild(view);
		return view;
	}
	
	public function removeAll() 
	{
		for ( i in 0...floatingViews.length )
		{
			removeFloatingView( floatingViews[i] );
		}
	}
	
	public function setView( view:Container ):Container
	{
		removeCurrentView();
		
		currentView = view;
		stage.addChild(currentView);
		
		return currentView;
	}
	
	public function removeCurrentView() 
	{
		if (stage != null && currentView != null)
		{
			stage.removeChild(currentView);
		}
	}	
	
	public function get_stage():Container 
	{
		return stage;
	}
	
	public function get_currentView():Container 
	{
		return currentView;
	}
	
}