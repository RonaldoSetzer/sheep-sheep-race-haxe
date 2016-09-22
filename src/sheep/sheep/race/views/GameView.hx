package sheep.sheep.race.views;

import pixi.core.display.Container;
import pixi.core.sprites.Sprite;
import pixi.extras.MovieClip;
import sheep.sheep.race.info.AssetsInfo;
import sheep.sheep.race.info.ColorInfo;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.utils.SpriteFactory;
import sheep.sheep.race.utils.ViewPort;
import sheep.sheep.race.views.components.Button;

/**
 * ...
 * @author Ronaldo Santiago
 */
class GameView extends Container 
{
	public var betButton:Button;

	public function new() 
	{
		super();
		
		addChild( SpriteFactory.getBackgroundColor( ColorInfo.BACKGROUND_SKY ) );
		addChild( SpriteFactory.getSprite( AssetsInfo.BACKGROUND_GAME ) );
		
		var raceContent:Container = SpriteFactory.getEmptyContainer();
		raceContent.x = 30;
		raceContent.y = 200;
		addChild( raceContent );
		
		var startMark:Sprite = SpriteFactory.getSprite( AssetsInfo.START_MARK );
		startMark.x = 55;
		startMark.y = 20;
		raceContent.addChild( startMark );
		
		var finishMark:Sprite = SpriteFactory.getSprite( AssetsInfo.FINISH_MARK );
		finishMark.x = 520;
		finishMark.y = 20;
		raceContent.addChild( finishMark );
		
		
		var sheeps:Array<MovieClip> = [
			SpriteFactory.getMovieClip( AssetsInfo.SHEEP_01 ),
			SpriteFactory.getMovieClip( AssetsInfo.SHEEP_02 ),
			SpriteFactory.getMovieClip( AssetsInfo.SHEEP_03 ),
			SpriteFactory.getMovieClip( AssetsInfo.SHEEP_04 )
		];
		
		for ( i in 0...sheeps.length )
		{
			sheeps[i].y = (i * 45);
			sheeps[i].stop();
			raceContent.addChild( sheeps[i] );
		}
		
		betButton = SpriteFactory.getBasicButton( TextInfo.BUTTON_BET );
		betButton.x = ViewPort.HALF_WIDTH;
		betButton.y = ViewPort.MAX_HEIGHT * .9;
		addChild( betButton );
	}
	
}