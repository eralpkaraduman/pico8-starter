-- tests.lua - Test suite for the game
-- Only runs when test.p8 is executed

-- Save original _init
game_init = _init

-- Override _init for testing
function _init()
    -- Run game initialization
    if game_init then
        game_init()
    end

    -- Initialize test framework
    test_init({
        timeout_frames = 120,
        debug_level = "info"
    })

    test_log("=== Running Tests ===", "info")
end

-- Test update loop
function _update60()
    test_update_frame()
    local frame = test_get_frame_count()

    -- Run tests on first frame
    if frame == 1 then
        test_log("Testing _init function", "info")
        test_assert(type(game_init) == "function", "_init should be a function")
        test_log("PASS: _init works", "info")

        -- Add more tests here as you develop
        -- test_assert_equal(player_x, 64, "player starts at center")

        test_log("PASS: All tests passed", "info")
        test_complete()
    end
end
