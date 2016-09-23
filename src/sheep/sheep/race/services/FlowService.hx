package sheep.sheep.race.services;
import sheep.sheep.race.events.FlowEvent;
import sheep.sheep.race.mvc.AbstractService;

/**
 * ...
 * @author Ronaldo Santiago
 */
class FlowService extends AbstractService
{

	public function new()
	{
		super();
	}
	
	function dispatcherEvent(event:String)
	{
		dispatcher.emit(event, event);
	}
	public function setHomeView()
	{
		dispatcherEvent( FlowEvent.SHOW_HOME );
	}

	public function setGameView()
	{
		dispatcherEvent( FlowEvent.SHOW_GAME );
	}

	public function addBetPopup()
	{
		dispatcherEvent( FlowEvent.ADD_BET_POPUP );
	}
	
	public function addBetFeedbackPopup()
	{
		dispatcherEvent( FlowEvent.ADD_BET_FEEDBACK_POPUP );
	}

	public function addStartingPopup()
	{
		dispatcherEvent( FlowEvent.ADD_STARTING_POPUP );
	}

	public function addAlertPopup()
	{
		dispatcherEvent( FlowEvent.ADD_ALERT_POPUP );
	}
	
	public function removeLastFloatingView() 
	{
		dispatcherEvent( FlowEvent.REMOVE_LAST_FLOATING_VIEW );
	}
}