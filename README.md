# Action for ideckia: KeyMouse

## Definition

Simulates some keyboard and mouse actions. Since this action uses [RobotJs](http://robotjs.io/) internally, potentially this can do anything RobotJs does, but it is not all implemented (yet).

## Properties

| Name | Type | Description | Default | Possible values |
| ----- |----- | ----- | ----- | ----- |
| keyToTap | String | Key to be tapped. | null | 'backspace', 'delete', 'enter', 'tab', 'escape', 'up', 'down', 'right', 'left', 'home', 'end', 'pageup', 'pagedown', 'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'f10', 'f11', 'f12', 'command', 'alt', 'control', 'shift', 'right_shift', 'space', 'printscreen', 'insert', 'audio_mute', 'audio_vol_down', 'audio_vol_up', 'audio_play', 'audio_stop', 'audio_pause', 'audio_prev', 'audio_next', 'audio_rewind', 'audio_forward', 'audio_repeat', 'audio_random', 'numpad_0', 'numpad_1', 'numpad_2', 'numpad_3', 'numpad_4', 'numpad_5', 'numpad_6', 'numpad_7', 'numpad_8', 'numpad_9', 'lights_mon_up', 'lights_mon_down', 'lights_kbd_toggle', 'lights_kbd_up', 'lights_kbd_down' |
| modifiers | String | Comma separated modifier(s) ('alt', 'command / win', 'control', 'shift') | '' | null |
| typeString | String | Types the screen like the keyboard would. | 
| moveMouseTo | {x:Int, y:Int} | Move mouse to position. | null | null |
| mouseClickButton | String | Click mouse button." | null | ['left', 'right', 'middle'] | 
| mouseDoubleClick | Bool | Mouse double click. 'mouseClickButton' has to be set to this property work. | false | null |
| mouseDrag | {x:Float, y:Float} | Moves mouse to x, y instantly, with the mouse button held down. | null | null |
| getMousePos | Bool | Gets the mouse coordinates and writes to the console. | false | null |

## Example in layout file

### Keyboard

* Tap a key
```json
{
    "state": {
        "text": "ctrl+alt+del",
        "bgColor": "00ff00",
        "action": {
            "name": "keymouse",
            "props": {
                "keyToTap": "delete",
                "modifiers": "control,alt"
            }
        }
    }
}
```
* Type a string
```json
{
    "state": {
        "text": "write sudo password",
        "bgColor": "00ff00",
        "action": {
            "name": "keymouse",
            "props": {
                "typeString": "my_password"
            }
        }
    }
}
```

### Mouse

* Move mouse to screen position
```json
{
    "state": {
        "text": "move mouse to 100x100",
        "bgColor": "00ff00",
        "action": {
            "name": "keymouse",
            "props": {
                "moveMouseTo": {
                    "x": 100,
                    "y": 100
                }
            }
        }
    }
}
```
* Clicks mouse button (optionally double click)
```json
{
    "state": {
        "text": "double click",
        "bgColor": "00ff00",
        "action": {
            "name": "keymouse",
            "props": {
                "mouseClickButton": "left", // right, middle
                "mouseDoubleClick": "true" // default is false
            }
        }
    }
}
```
* Drag mouse
```json
{
    "state": {
        "text": "drag mouse to 100x100",
        "bgColor": "00ff00",
        "action": {
            "name": "keymouse",
            "props": {
                "mouseDrag": {
                    "x": 100,
                    "y": 100
                }
            }
        }
    }
}
```
* Get mouse position
```json
{
    "state": {
        "text": "move mouse to 100x100",
        "bgColor": "00ff00",
        "action": {
            "name": "keymouse",
            "props": {
                "getMousePos": true
            }
        }
    }
}
```