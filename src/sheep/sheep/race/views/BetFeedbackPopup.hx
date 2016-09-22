package sheep.sheep.race.views;

import pixi.core.display.Container;
import pixi.core.graphics.Graphics;
import pixi.extras.BitmapText;
import sheep.sheep.race.info.AssetsInfo;
import sheep.sheep.race.info.ColorInfo;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.utils.SpriteFactory;
import sheep.sheep.race.utils.ViewPort;
import sheep.sheep.race.views.components.Button;
import sheep.sheep.race.views.components.SheepPodium;

/**
 * ...
 * @author Ronaldo Santiago
 */
class BetFeedbackPopup extends Container 
{
	var retryButton:Button;
	var homeButton:Button;
	var container:Container;

	public function new() 
	{
		super();
		
		addChild( SpriteFactory.getShadowBackground() );
		container = SpriteFactory.getEmptyContainer();
		container.x = ViewPort.HALF_WIDTH;
		container.y = ViewPort.MAX_HEIGHT * 0.2;
		addChild(container);
		container.addChild( SpriteFactory.getColorBox(ViewPort.MAX_WIDTH * 0.55, ViewPort.MAX_HEIGHT * 0.7, ColorInfo.BACKGROUND_POPUP));
		
		var titleBackground:Graphics = SpriteFactory.getColorBox( ViewPort.HALF_WIDTH, 30, ColorInfo.BACKGROUND_TITLE );
		titleBackground.x = 15;
		titleBackground.y = 15;
		container.addChild(titleBackground);
		
		var title:BitmapText = SpriteFactory.getBitmapText( TextInfo.TITLE_FEEDBACK );
		title.x = container.width * 0.5;
		title.y = 22;
		title.pivot.x = title.width * 0.5;
		container.addChild( title );
		
		retryButton = SpriteFactory.getBasicButton( TextInfo.BUTTON_RETRY );
		retryButton.x = container.width * 0.5 - 50;
		retryButton.y = container.height * 0.85;
		container.addChild( retryButton );
		
		homeButton = SpriteFactory.getBasicButton( TextInfo.BUTTON_HOME );
		homeButton.x = container.width * 0.5 + 50;
		homeButton.y = container.height * 0.85;
		container.addChild( homeButton );
		
		container.pivot.set(container.width * 0.5, 0);
		
		createPodium();
	}
	
	function createPodium() 
	{
		var sheeps:Array<Array<String>> = [AssetsInfo.SHEEP_01,AssetsInfo.SHEEP_02,AssetsInfo.SHEEP_03,AssetsInfo.SHEEP_04];
		var sheep:SheepPodium;
		for ( i in 0...sheeps.length )
		{
			sheep = new SheepPodium(sheeps[i], TextInfo.POSITIONS[i]);
			sheep.x = 105+(70*i);
			sheep.y = 125;
			container.addChild(sheep);
		}
		var info:BitmapText = SpriteFactory.getBitmapText( TextInfo.YOUR_BETS );
		info.x = container.width * 0.5;
		info.y = 165;
		info.pivot.x = info.width * 0.5;
		container.addChild( info );
		
		var firstPosition:BitmapText = SpriteFactory.getBitmapText( "1 ST : " +  TextInfo.YOU_WIN );
		firstPosition.x = container.width * 0.5;
		firstPosition.y = 195;
		firstPosition.pivot.x = firstPosition.width * 0.5;
		container.addChild( firstPosition );
		
		var lastPosition:BitmapText = SpriteFactory.getBitmapText( "4 TH : " +  TextInfo.YOU_LOSE );
		lastPosition.x = container.width * 0.5;
		lastPosition.y = 220;
		lastPosition.pivot.x = lastPosition.width * 0.5;
		container.addChild( lastPosition );
	}
	
}