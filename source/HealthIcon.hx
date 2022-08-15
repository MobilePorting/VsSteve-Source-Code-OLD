package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = false;
		animation.add('bf-pixel', [0, 2, 1], 0, false, isPlayer);
		animation.add('bfminecraft', [41, 43, 42], 0, false, isPlayer);
		animation.add('tuxsteveuoh', [5, 6, 7], 0, false, isPlayer);
		animation.add('stevelucky', [5, 6, 7], 0, false, isPlayer);
		animation.add('senpai-angry', [8, 6, 9], 0, false, isPlayer);
		animation.add('gf-pixel', [23, 25, 24], 0, false, isPlayer);
		animation.add('steve-armor', [10, 6, 11], 0, false, isPlayer);
		animation.add('tuxsteve', [8, 6, 9], 0, false, isPlayer);
		animation.add('tuxstevewhatever', [8, 6, 9], 0, false, isPlayer);
		animation.add('stevehorse', [5, 6, 7], 0, false, isPlayer);
		animation.add('stevefnm', [8, 6, 9], 0, false, isPlayer);
		animation.add('stevematt', [10, 6, 11], 0, false, isPlayer);	
		animation.add('alex', [12, 13, 14], 0, false, isPlayer);
		animation.add('alexpickaxe', [30, 31, 30], 0, false, isPlayer);
		animation.add('alexpickaxemad', [12, 13, 14], 0, false, isPlayer);
		animation.add('alexchill', [30, 31, 30], 0, false, isPlayer);
		animation.add('giantalex', [30, 31, 30], 0, false, isPlayer);
		animation.add('herobrine', [8, 6, 9], 0, false, isPlayer);
		animation.add('alexsunday', [30, 31, 30], 0, false, isPlayer);
		animation.add('smollalex', [30, 31, 30], 0, false, isPlayer);
		animation.add('notch', [33, 34, 35], 0, false, isPlayer);
		animation.add('endless', [15, 16, 17], 0, false, isPlayer);
		animation.add('bfeyes', [3, 2 , 4], 0, false, isPlayer);
		animation.add('tiago', [18, 19, 19], 0, false, isPlayer);
		animation.add('tiagoswag', [28, 29, 29], 0, false, isPlayer);
		animation.add('gabo', [26, 27, 27], 0, false, isPlayer);
		animation.add('jaziel', [39, 39, 39], 0, false, isPlayer);
		animation.add('bos', [40, 40, 40], 0, false, isPlayer);
		animation.add('jeb', [36, 37, 38], 0, false, isPlayer);
		animation.play(char);

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
