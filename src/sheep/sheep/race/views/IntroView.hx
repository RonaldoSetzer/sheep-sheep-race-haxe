package sheep.sheep.race.views;

import pixi.core.display.Container;
import pixi.core.graphics.Graphics;
import pixi.extras.BitmapText;
import sheep.sheep.race.info.ColorInfo;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.utils.SpriteFactory;
import sheep.sheep.race.utils.ViewPort;

/**
 * ...
 * @author Ronaldo Santiago
 */
class IntroView extends Container 
{

	public function new() 
	{
		super();
		
		addChild(SpriteFactory.getBackgroundColor(ColorInfo.BACKGROUND_SKY));
		
		var text:BitmapText = SpriteFactory.getBitmapText( TextInfo.DEVELOPER );
		text.pivot.set(text.width * 0.5,text.height* 0.5);
		ViewPort.alignCenter(text);
		addChild(text);
	}
	
}