package sheep.sheep.race.views;

import pixi.core.display.Container;
import pixi.extras.BitmapText;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.utils.SpriteFactory;
import sheep.sheep.race.utils.ViewPort;

/**
 * ...
 * @author Ronaldo Santiago
 */
class StartingPopup extends Container 
{
	var countingText:BitmapText;

	public function new() 
	{
		super();
		
		addChild(SpriteFactory.getShadowBackground());
		
		var starling:BitmapText = SpriteFactory.getBitmapText(TextInfo.STARTING);
		starling.x = ViewPort.HALF_WIDTH;
		starling.y = ViewPort.HALF_HEIGHT - 20;
		starling.pivot.x = starling.width * .5;
		addChild(starling);
		
		countingText = SpriteFactory.getBitmapText("3");
		countingText.x = ViewPort.HALF_WIDTH;
		countingText.y = ViewPort.HALF_HEIGHT + 20;
		countingText.pivot.x = countingText.width * .5;
		addChild(countingText);
	}
	
	public function updateValue(count:Int) 
	{
		countingText.text = Std.string(count);
	}
	
}