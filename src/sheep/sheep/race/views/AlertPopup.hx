package sheep.sheep.race.views;

import pixi.core.display.Container;
import pixi.core.graphics.Graphics;
import pixi.extras.BitmapText;
import sheep.sheep.race.info.ColorInfo;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.utils.SpriteFactory;
import sheep.sheep.race.utils.ViewPort;
import sheep.sheep.race.views.components.Button;

/**
 * ...
 * @author Ronaldo Santiago
 */
class AlertPopup extends Container 
{
	public var okButton:Button;

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
		
		var title:BitmapText = SpriteFactory.getBitmapText( TextInfo.TITLE_ALERT );
		title.x = container.width * 0.5;
		title.y = 22;
		title.pivot.x = title.width * 0.5;
		container.addChild( title );
		
		var msg:BitmapText = SpriteFactory.getBitmapText( TextInfo.BET_MISTAKE );
		msg.x = container.width * 0.5;
		msg.y = container.width * 0.35;
		msg.pivot.x = msg.width * 0.5;
		container.addChild( msg );
		
		okButton = SpriteFactory.getBasicButton( TextInfo.BUTTON_OK );
		okButton.x = container.width * 0.5;
		okButton.y = container.height * 0.85;
		container.addChild( okButton );
		
		container.pivot.set(container.width * 0.5,0);
	}
	
}