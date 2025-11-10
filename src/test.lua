-- Save original _init to test it
original_init = _init

-- Override _init to initialize both game and tests
function _init()
    -- Initialize game code first
    if original_init then
        original_init()
    end

    -- Initialize test framework
    test_init({
        timeout_frames = 120, -- 2 seconds
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
        test_assert(type(original_init) == "function", "_init should be a function")
        test_log("✓ _init works", "info")

        -- Add more tests here as you develop
        -- test_assert_equal(player_x, 64, "player starts at center")

        test_log("✓ All tests passed", "info")
        test_complete()
    end
end