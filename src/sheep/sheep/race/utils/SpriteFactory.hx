package sheep.sheep.race.utils;
import pixi.core.graphics.Graphics;
import pixi.core.sprites.Sprite;
import pixi.extras.BitmapText;
import sheep.sheep.race.assets.Assets;
import sheep.sheep.race.info.AssetsInfo;

/**
 * ...
 * @author Ronaldo Santiago
 */
class SpriteFactory 
{	
	static public function getBitmapText( text:String = "" ):BitmapText
	{
		return new BitmapText( text, { font:AssetsInfo.FONT, align:"center"});
	}
		
	static public function getSprite( assetsKey:String, alignCenter:Bool = false ):Sprite
	{
		var img:Sprite = new Sprite(Assets.getTexture(assetsKey));
		if(alignCenter) img.anchor.set(0.5);
		return img;
	}
	
	static public function getColorBox( width:Float, height:Float, color:Int = 0xFF0000, alpha:Float = 1.0 ):Graphics
	{
		var background:Graphics = new Graphics();
		background.beginFill(color,alpha);
		background.drawRect( 0, 0, width, height );
		background.endFill();
		return  background;
	}
	
	static public function getBackgroundColor(color:Int = 0xFF0000, alpha:Float = 1.0):Graphics
	{
		return getColorBox( ViewPort.MAX_WIDTH, ViewPort.MAX_HEIGHT, color, alpha);
	}
}