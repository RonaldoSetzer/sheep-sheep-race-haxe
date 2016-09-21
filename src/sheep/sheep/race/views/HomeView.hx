package sheep.sheep.race.views;

import pixi.core.display.Container;
import pixi.core.sprites.Sprite;
import sheep.sheep.race.info.AssetsInfo;
import sheep.sheep.race.info.ColorInfo;
import sheep.sheep.race.utils.SpriteFactory;
import sheep.sheep.race.utils.ViewPort;

/**
 * ...
 * @author Ronaldo Santiago
 */
class HomeView extends Container 
{
	public function new() 
	{
		super();
		
		addChild( SpriteFactory.getBackgroundColor( ColorInfo.BACKGROUND_SKY ) );
		addChild( SpriteFactory.getSprite( AssetsInfo.BACKGROUND_GAME ) );
		
		var logo:Sprite = SpriteFactory.getSprite( AssetsInfo.SHEEP_LOGO, true );
		logo.x = ViewPort.HALF_WIDTH;
		logo.y = ViewPort.MAX_HEIGHT * .3;
		addChild( logo );
		
	}
}