package sheep.sheep.race.views;

import pixi.core.display.Container;
import pixi.core.graphics.Graphics;
import pixi.extras.BitmapText;
import sheep.sheep.race.info.AssetsInfo;
import sheep.sheep.race.info.ColorInfo;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.models.GameModel;
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
	public var retryButton:Button;
	public var homeButton:Button;
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
		
	}
	
	public function createPodium( gameModel:GameModel ) 
	{
		var sheeps:Array<Array<String>> = [AssetsInfo.SHEEP_01,AssetsInfo.SHEEP_02,AssetsInfo.SHEEP_03,AssetsInfo.SHEEP_04];
		var sheep:SheepPodium;
		var fistIndex:Int = 0;
		var lastIndex:Int = gameModel.racePositions.length - 1;
		
		for ( i in 0...sheeps.length )
		{
			sheep = new SheepPodium(sheeps[gameModel.racePositions[i]], TextInfo.POSITIONS[i]);
			sheep.x = 105+(70*i);
			sheep.y = 125;
			container.addChild(sheep);
			
			if ( i == fistIndex )
			{
				setWinnerLooser( gameModel.youWonTheFirstPosition(), sheep );
			}
			if ( i == lastIndex )
			{
				setWinnerLooser( gameModel.youWonTheLastPosition(), sheep );
			}
		}
		
		var info:BitmapText = SpriteFactory.getBitmapText( TextInfo.YOUR_BETS );
		info.x = container.width * 0.5;
		info.y = 165;
		info.pivot.x = info.width * 0.5;
		container.addChild( info );
		
		var firstPosition:BitmapText = SpriteFactory.getBitmapText( "1 ST : " +  getWinLoseText(gameModel.youWonTheFirstPosition()) );
		firstPosition.x = container.width * 0.5;
		firstPosition.y = 195;
		firstPosition.pivot.x = firstPosition.width * 0.5;
		container.addChild( firstPosition );
		
		var lastPosition:BitmapText = SpriteFactory.getBitmapText( "4 TH : " +   getWinLoseText(gameModel.youWonTheLastPosition()) );
		lastPosition.x = container.width * 0.5;
		lastPosition.y = 220;
		lastPosition.pivot.x = lastPosition.width * 0.5;
		container.addChild( lastPosition );
	}
	
	function setWinnerLooser( value:Bool, sheep:SheepPodium )
	{
		if (value == true) sheep.winner();
		else sheep.looser();
	}
	
	function getWinLoseText( value:Bool ):String
	{
		if (value == true) return TextInfo.YOU_WIN;
		else return TextInfo.YOU_LOSE;
	}
	
}