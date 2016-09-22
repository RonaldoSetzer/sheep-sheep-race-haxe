package sheep.sheep.race.views.components;

import pixi.core.display.Container;
import pixi.core.graphics.Graphics;
import pixi.extras.BitmapText;
import pixi.extras.MovieClip;
import sheep.sheep.race.info.ColorInfo;
import sheep.sheep.race.utils.SpriteFactory;

/**
 * ...
 * @author Ronaldo Santiago
 */
class SheepPodium extends Container 
{
	var background:Graphics;
	var sheep:MovieClip;

	public function new( assetskeys:Array<String>, positionText:String ) 
	{
		super();
		
		var backgroundBorder:Graphics = SpriteFactory.getColorBox( 68, 68, 0x000000 );
		backgroundBorder.pivot.x = backgroundBorder.width * .5;
		backgroundBorder.pivot.y = backgroundBorder.height * .5;
		addChild( backgroundBorder );
		
		background = createBoxColor(ColorInfo.YELLOW);
		addChild( background );
		
		sheep = SpriteFactory.getMovieClip( assetskeys );
		sheep.scale.x = -1;
		sheep.pivot.x = sheep.width * .5;
		sheep.pivot.y = sheep.height * .5;
		addChild( sheep );
		
		
		pivot.x = width * .5;
		pivot.y = height * .5;
		
		var currentPositionText:BitmapText = SpriteFactory.getBitmapText( positionText );
		currentPositionText.pivot.x = currentPositionText.width * .5;
		currentPositionText.pivot.y = currentPositionText.height * .5;
		currentPositionText.y = 50;
		addChild( currentPositionText );
		
	}
	
	function createBoxColor( color:Int ):Graphics
	{
		var box:Graphics = SpriteFactory.getColorBox( 64, 64, color );
		box.pivot.x = box.width * .5;
		box.pivot.y = box.height * .5;
		return box;
	}
	
	public function winner()
	{
		sheep.play();
		removeChild(background);
		background = null;
		background = createBoxColor( ColorInfo.GREEN );
		addChildAt(background,1);
	}

	public function looser()
	{
		removeChild(background);
		background = null;
		background = createBoxColor( ColorInfo.RED );
		addChildAt(background,1);
	}
	
}