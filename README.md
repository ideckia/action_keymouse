# Action for ideckia: KeyMouse

## Definition

Simulates some keyboard and mouse actions. Since this action uses [RobotJs](http://robotjs.io/) internally, potentially this can do anything RobotJs does, but it is not all implemented (yet).

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