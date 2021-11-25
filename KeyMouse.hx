package;

using api.IdeckiaApi;

typedef Props = {
	@:editable("Key to be tapped.", '', [
		'', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2',
		'3', '4', '5', '6', '7', '8', '9', '0', 'backspace', 'delete', 'enter', 'tab', 'escape', 'up', 'down', 'right', 'left', 'home', 'end', 'pageup',
		'pagedown', 'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'f10', 'f11', 'f12', 'command', 'alt', 'control', 'shift', 'right_shift', 'space',
		'printscreen', 'insert', 'audio_mute', 'audio_vol_down', 'audio_vol_up', 'audio_play', 'audio_stop', 'audio_pause', 'audio_prev', 'audio_next',
		'audio_rewind', 'audio_forward', 'audio_repeat', 'audio_random', 'numpad_0', 'numpad_1', 'numpad_2', 'numpad_3', 'numpad_4', 'numpad_5', 'numpad_6',
		'numpad_7', 'numpad_8', 'numpad_9', 'lights_mon_up', 'lights_mon_down', 'lights_kbd_toggle', 'lights_kbd_up', 'lights_kbd_down'
	])
	var keyToTap:String;

	@:editable("Comma separated modifier(s) ('alt', 'command / win', 'control', 'shift')", '')
	var modifiers:String;
	@:editable("Types the screen like the keyboard would.", null)
	var typeString:String;
	@:editable("Move mouse to position.", null)
	var moveMouseTo:{x:Int, y:Int};
	@:editable("Click mouse button.", '', ['', 'left', 'right', 'middle'])
	var mouseClickButton:String;
	@:editable("Mouse double click. 'mouseClickButton' has to be set to this property work.", false)
	var mouseDoubleClick:Bool;
	@:editable("Moves mouse to x, y instantly, with the mouse button held down.", null)
	var mouseDrag:{x:Float, y:Float};
	@:editable("Gets the mouse coordinates and writes to the console.", false)
	var getMousePos:Bool;
}

@:name('keymouse')
@:description('Create hotkeys, write strings, move the mouse... A wrapper for RobotJs')
class KeyMouse extends IdeckiaAction {
	public function execute(currentState:ItemState):js.lib.Promise<ItemState> {
		if (props.keyToTap != '')
			RobotJs.keyTap(props.keyToTap.toLowerCase(), props.modifiers.split(',').map(m -> StringTools.trim(m)));

		if (props.typeString != null)
			RobotJs.typeString(props.typeString);

		if (props.moveMouseTo != null)
			RobotJs.moveMouse(props.moveMouseTo.x, props.moveMouseTo.y);

		if (props.mouseClickButton != '')
			RobotJs.mouseClick(props.mouseClickButton, props.mouseDoubleClick);

		if (props.mouseDrag != null)
			RobotJs.dragMouse(props.mouseDrag.x, props.mouseDrag.y);

		if (props.getMousePos)
			server.log.debug(RobotJs.getMousePos());

		return new js.lib.Promise((resolve, reject) -> resolve(currentState));
	}
}
