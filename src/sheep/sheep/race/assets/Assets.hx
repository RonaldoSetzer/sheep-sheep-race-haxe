package sheep.sheep.race.assets;
import pixi.core.textures.Texture;

/**
 * ...
 * @author Ronaldo Santiago
 */
class Assets 
{
	static public inline function getTexture( prefix:String ):Texture
	{
		return Texture.fromFrame(prefix);
	}
}