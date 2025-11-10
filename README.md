# PICO-8 Game Project

PICO-8 development with VS Code and automated testing using [picotestdriver](https://github.com/adamico/picotestdriver).

## Quick Start

**Run game:** `Cmd+Shift+B`
**Run tests:** `Cmd+Shift+P` → "Run Test Task"

## Files

- [game.p8](game.p8) - Main cartridge
- [test.p8](test.p8) - Test cartridge
- [src/main.lua](src/main.lua) - Game code
- [src/test.lua](src/test.lua) - Test code

## Development

1. Edit [src/main.lua](src/main.lua)
2. `Cmd+Shift+B` to run game
3. `Cmd+Shift+P` → "Run Test Task" to run tests

## Writing Tests

See [src/test.lua](src/test.lua) for examples:

```lua
function _update60()
    test_update_frame()
    local frame = test_get_frame_count()

    if frame == 1 then
        test_assert(condition, "message")
        test_assert_equal(actual, expected, "message")
        test_complete()
    end
end
```
