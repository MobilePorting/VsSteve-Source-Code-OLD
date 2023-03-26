package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class WarnCreditState extends MusicBeatState
{
	public static var leftStateWarn:Bool = false;
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('RevengeBG', 'shared'));
		bg.scale.x *= 5;
		bg.scale.y *= 5;
		bg.screenCenter();
		add(bg);
		
		var kadeLogo:FlxSprite = new FlxSprite(FlxG.width, 0).loadGraphic(Paths.image('logoBumpin'));
		kadeLogo.scale.y = 0.3;
		kadeLogo.scale.x = 0.3;
		kadeLogo.x -= kadeLogo.frameHeight;
		kadeLogo.y -= 180;
		kadeLogo.alpha = 0.8;
		add(kadeLogo);

		#if mobileC
                var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"This is Credits Menu"
			+ "Currently, this menu is uncomplete and Buggy, so please be patient."
			+ "Everything will be complete in the Full Release Update."
			+ "If you want to still check the current Menu then Press Enter."
			+ "Be aware that the text might be broken. Press Enter on an Icon to Visit their Social Media:"
			+ "Touch Your Screen to Proceed"
			);
                #elseif mobileCweb
                var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"This is Credits Menu"
			+ "Currently, this menu is uncomplete and Buggy, so please be patient."
			+ "Everything will be complete in the Full Release Update."
			+ "If you want to still check the current Menu then Press Enter."
			+ "Be aware that the text might be broken. Press Enter on an Icon to Visit their Social Media:"
			+ "Touch Your Screen or Press Enter to Proceed, Press Backspace to go Back."
			);
                #elseif (!mobileC || !mobileCweb)
                var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"This is Credits Menu"
			+ "Currently, this menu is uncomplete and Buggy, so please be patient."
			+ "Everything will be complete in the Full Release Update."
			+ "If you want to still check the current Menu then Press Enter."
			+ "Be aware that the text might be broken. Press Enter on an Icon to Visit their Social Media:"
			+ "Press Enter to Proceed, Press Escape/Backspace to go Back."
			);
                #end
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
		
		FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
		FlxTween.angle(kadeLogo, kadeLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
			if(colorRotation < (bgColors.length - 1)) colorRotation++;
			else colorRotation = 0;
		}, 0);
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			if(kadeLogo.angle == -10) FlxTween.angle(kadeLogo, kadeLogo.angle, 10, 2, {ease: FlxEase.quartInOut});
			else FlxTween.angle(kadeLogo, kadeLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		}, 0);
		
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		{
			if(kadeLogo.alpha == 0.8) FlxTween.tween(kadeLogo, {alpha: 1}, 0.8, {ease: FlxEase.quartInOut});
			else FlxTween.tween(kadeLogo, {alpha: 0.8}, 0.8, {ease: FlxEase.quartInOut});
		}, 0);
	}

	override function update(elapsed:Float)
	{
		if (#if !web controls.BACK #else FlxG.keys.justPressed.BACKSPACE #end)
		{
			leftStateWarn = true;
			FlxG.switchState(new MainMenuState());
		}
                else if (controls.ACCEPT)
		{
			leftStateWarn = true;
			FlxG.switchState(new Credits());
		}
                #if (mobileC || mobileCweb)
                        for (touch in FlxG.touches.list)
		        if (touch.justPressed)
		        {
		        leftStateWarn = true;
		        FlxG.switchState(new Credits());
		        }
                #end
		super.update(elapsed);
	}
}
