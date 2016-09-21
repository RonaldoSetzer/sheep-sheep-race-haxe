package sheep.sheep.race.views.components;
import pixi.core.sprites.Sprite;
import pixi.core.textures.Texture;
import pixi.extras.BitmapText;
import sheep.sheep.race.info.TextInfo;
import sheep.sheep.race.utils.SpriteFactory;

/**
 * ...
 * @author Ronaldo Santiago
 */
class Button  extends Sprite 
{
	var isdown:Bool;
	var direction:Int;

	public function new( text:String, ?texture:Texture) 
	{
		super(texture);
		
		buttonMode = true;
		interactive = true;
		isdown = false;
		setDirection(TextInfo.RIGHT);
		
		if (text != "")
		{
			var txt:BitmapText = SpriteFactory.getBitmapText(text);
			txt.pivot.set(txt.width * 0.5,txt.height* 0.5);
			addChild(txt);
		}
		
		on("mousedown", onButtonDown);
        on("touchstart", onButtonDown);
		on("mouseup", onButtonUp);
        on("touchend", onButtonUp);
	}
	
	function onButtonDown()
	{
		isdown = true;
		scale.set(0.95*direction, 0.95);
	}

	function onButtonUp()
	{
		isdown = false;
		scale.set( 1*direction, 1 );
	}
	
	public function setDirection(value:String) 
	{
		direction = 1;
		
		if (value == TextInfo.LEFT)
		{
			direction = -1;
		}
		scale.set( 1*direction, 1 );
	}
	
}