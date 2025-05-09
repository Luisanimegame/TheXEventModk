package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Kade Engine is Outdated!\n"
			+ MainMenuState.kadeEngineVer
			+ " is your current version\nwhile the most recent version is " + needVer
			+ "!\nPress Space to go to the github or ESCAPE to ignore this!!",
			32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT #if android || FlxG.android.justReleased.BACK #end)
		{
			FlxG.openURL("https://github.com/KadeDev/Kade-Engine/releases/latest");
		}
		
		#if mobile
        var jusTouched:Bool = false;

        for (touch in FlxG.touches.list)
          if (touch.justPressed)
            jusTouched = true;
        #end
		
		if (controls.BACK #if mobile || jusTouched #end)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
