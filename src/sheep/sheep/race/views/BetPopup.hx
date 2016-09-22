package sheep.sheep.race.views;

import pixi.core.display.Container;
import pixi.core.graphics.Graphics;
import pixi.extras.BitmapText;
import sheep.sheep.race.info.ColorInfo;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.utils.SpriteFactory;
import sheep.sheep.race.utils.ViewPort;
import sheep.sheep.race.views.components.Button;
import sheep.sheep.race.views.components.SheepSelector;

/**
 * ...
 * @author Ronaldo Santiago
 */
class BetPopup extends Container 
{

	public function new() 
	{
		super();
		
		addChild( SpriteFactory.getShadowBackground() );
		var container:Container = SpriteFactory.getEmptyContainer();
		container.x = ViewPort.HALF_WIDTH;
		container.y = ViewPort.MAX_HEIGHT * 0.2;
		addChild(container);
		container.addChild( SpriteFactory.getColorBox(ViewPort.MAX_WIDTH * 0.55, ViewPort.MAX_HEIGHT * 0.7, ColorInfo.BACKGROUND_POPUP));
		
		var titleBackground:Graphics = SpriteFactory.getColorBox( ViewPort.HALF_WIDTH, 30, ColorInfo.BACKGROUND_TITLE );
		titleBackground.x = 15;
		titleBackground.y = 15;
		container.addChild(titleBackground);
		
		var title:BitmapText = SpriteFactory.getBitmapText( TextInfo.TITLE_BET );
		title.x = 32;
		title.y = 22;
		container.addChild( title );
		
		var sheepSelectorFirst:SheepSelector = new SheepSelector( TextInfo.FIRST_POSITION);
		sheepSelectorFirst.x = container.width * 0.5 - 70;
		sheepSelectorFirst.y = container.height * 0.5 -20;
		container.addChild( sheepSelectorFirst);
		
		var sheepSelectorLast:SheepSelector = new SheepSelector( TextInfo.LAST_POSITION);
		sheepSelectorLast.x = container.width * 0.5 + 70;
		sheepSelectorLast.y = container.height * 0.5 -20;
		sheepSelectorLast.back();
		container.addChild( sheepSelectorLast);
		
		var startButton:Button = SpriteFactory.getBasicButton( TextInfo.BUTTON_START );
		startButton.x = container.width * 0.5;
		startButton.y = container.height * 0.85;
		container.addChild( startButton );
			
		container.pivot.set(container.width * 0.5,0);
	}
	
}