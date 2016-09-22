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

	public static inline function getTextures( list:Array<String> ):Array<Texture> 
	{
		var textures:Array<Texture> =  new Array<Texture>();
		
		for ( i in 0...list.length )
		{
			textures.push(getTexture(list[i]));
		}
		
		return textures;
	}	
}