package;

enum abstract MouseBtn(String) to String from String {
	var left;
	var right;
	var middle;
}

@:jsRequire('./robotjs')
extern class RobotJs {
	// Keyboard

	/**
		Press a single key.
	**/
	static function keyTap(key:String, ?modifier:Array<String>):Void;

	static function typeString(string:String):Void;
	static function typeStringDelayed(string:String, charactersPerMinute:UInt):Void;

	// Mouse

	/**
		Moves mouse to x, y instantly, with the mouse button up.
	**/
	static function moveMouse(x:Float, y:Float):Void;

	/**
		Moves mouse to x, y human like, with the mouse button up.
	**/
	static function moveMouseSmooth(x:Float, y:Float):Void;

	/**
		Clicks the mouse.
	**/
	static function mouseClick(button:MouseBtn = left, double:Bool = false):Void;

	/**
		Moves mouse to x, y instantly, with the mouse button held down.
	**/
	static function dragMouse(x:Float, y:Float):Void;

	/**
		Gets the mouse coordinates.
	**/
	static function getMousePos():{x:Float, y:Float};
}
