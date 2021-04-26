package;

using api.IdeckiaCmdApi;

typedef Props = {
	@:editable("Key to be tapped.", null, [
		'backspace', 'delete', 'enter', 'tab', 'escape', 'up', 'down', 'right', 'left', 'home', 'end', 'pageup', 'pagedown', 'f1', 'f2', 'f3', 'f4', 'f5',
		'f6', 'f7', 'f8', 'f9', 'f10', 'f11', 'f12', 'command', 'alt', 'control', 'shift', 'right_shift', 'space', 'printscreen', 'insert', 'audio_mute',
		'audio_vol_down', 'audio_vol_up', 'audio_play', 'audio_stop', 'audio_pause', 'audio_prev', 'audio_next', 'audio_rewind', 'audio_forward',
		'audio_repeat', 'audio_random', 'numpad_0', 'numpad_1', 'numpad_2', 'numpad_3', 'numpad_4', 'numpad_5', 'numpad_6', 'numpad_7', 'numpad_8',
		'numpad_9', 'lights_mon_up', 'lights_mon_down', 'lights_kbd_toggle', 'lights_kbd_up', 'lights_kbd_down'
	])
	var keyToTap:String;

	@:editable("Comma separated modifier(s) ('alt', 'command / win', 'control', 'shift')", '')
	var modifiers:String;

	@:editable("Types the screen like the keyboard would.", null)
	var typeString:String;
	
	@:editable("Move mouse to position.", null)
	var moveMouseTo:{x:Int, y:Int};
	
	@:editable("Click mouse button.", null, ['left', 'right', 'middle'])
	var mouseClickButton:String;
	
	@:editable("Mouse double click. 'mouseClickButton' has to be set to this property work.", false)
	var mouseDoubleClick:Bool;
}

class KeyMouse extends IdeckiaCmd {
	public function execute():ItemState {
		if (props.keyToTap != null)
			RobotJs.keyTap(props.keyToTap, props.modifiers.split(',').map(m -> StringTools.trim(m)));

		if (props.typeString != null)
			RobotJs.typeString(props.typeString);
	
		if (props.moveMouseTo != null)
			RobotJs.moveMouse(props.moveMouseTo.x, props.moveMouseTo.y);
		
		if (props.mouseClickButton != null)
			RobotJs.mouseClick(props.mouseClickButton, props.mouseDoubleClick);

		return state;
	}
}
