package sheep.sheep.race.views.components;

import pixi.core.display.Container;
import pixi.core.graphics.Graphics;
import pixi.core.sprites.Sprite;
import pixi.extras.BitmapText;
import sheep.sheep.race.assets.Assets;
import sheep.sheep.race.info.AssetsInfo;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.utils.SpriteFactory;

/**
 * ...
 * @author Ronaldo Santiago
 */
class SheepSelector extends Container 
{
	var image:Sprite;
	var indexes:Array<Int>;

	public function new( label:String ) 
	{
		super();
		
		indexes = [0, 1, 2, 3];
		
		var background1:Graphics = SpriteFactory.getColorBox( 86, 72, 0x000000 );
		background1.pivot.x = background1.width * 0.5;
		background1.pivot.y = background1.height * 0.5;
		addChild( background1);
		
		var background2:Graphics = SpriteFactory.getColorBox( 82, 68, 0xFFFFFF );
		background2.pivot.x = background2.width * 0.5;
		background2.pivot.y = background2.height * 0.5;
		addChild( background2);
		
		image = SpriteFactory.getSprite( AssetsInfo.SHEEPS_SELECTOR[0] );
		image.pivot.x = image.width * 0.5;
		image.pivot.y = image.height * 0.5;
		addChild( image );
		
		var text:BitmapText = SpriteFactory.getBitmapText(label);
		text.pivot.x = text.width * 0.5;
		text.y = -75;
		addChild(text);
		
		var backButton:Button = SpriteFactory.getArrowButton(TextInfo.LEFT);
		backButton.x = -22;
		backButton.y = 60;
		addChild( backButton );
		
		var nextButton:Button = SpriteFactory.getArrowButton(TextInfo.RIGHT);
		nextButton.x = 22;
		nextButton.y = 60;
		addChild( nextButton );
		
		backButton.on("click", back);
		nextButton.on("click", next);
	}
		
	function updateImage( index:Int )
	{
		image.texture = Assets.getTexture( AssetsInfo.SHEEPS_SELECTOR[index] );
	}
	
	public function next()
	{
		indexes.push( indexes.shift() );
		updateImage( indexes[0] );
	}

	public function back()
	{
		indexes.unshift( indexes.pop() );
		updateImage( indexes[0] );
	}
	
	public function getCurrentIndex():Int
	{
		return indexes[0];
	}
}