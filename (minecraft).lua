-- obly a recreation

-- Initialize the world grid (10x5 grid)
WIDTH = 10
HEIGHT = 5
world = {}

-- Initialize the world with empty spaces
for x = 0, WIDTH - 1 do
    world[x] = {}
    for y = 0, HEIGHT - 1 do
        world[x][y] = " "  -- Empty space
    end
end

-- Function to draw the world
function draw_world()
    os.execute("cls")  -- Clear screen (works on Windows)
    for y = 0, HEIGHT - 1 do
        for x = 0, WIDTH - 1 do
            io.write(world[x][y])  -- Print the block at position (x, y)
        end
        print()  -- Newline
    end
end

-- Function to place a block
function place_block(x, y, block_type)
    if x >= 0 and x < WIDTH and y >= 0 and y < HEIGHT then
        world[x][y] = block_type
    end
end

-- Function to remove a block
function remove_block(x, y)
    if x >= 0 and x < WIDTH and y >= 0 and y < HEIGHT then
        world[x][y] = " "  -- Empty space
    end
end

-- Main game loop
function main()
    while true do
        draw_world()

        print("\nCommands:")
        print("P = Place Block | R = Remove Block | Q = Quit")
        io.write("Enter command: ")
        local command = io.read()

        if command == "Q" then
            break
        elseif command == "P" then
            io.write("Enter X coordinate (0-" .. WIDTH - 1 .. "): ")
            local x = tonumber(io.read())
            io.write("Enter Y coordinate (0-" .. HEIGHT - 1 .. "): ")
            local y = tonumber(io.read())
            place_block(x, y, "#")  -- Place a block
        elseif command == "R" then
            io.write("Enter X coordinate (0-" .. WIDTH - 1 .. "): ")
            local x = tonumber(io.read())
            io.write("Enter Y coordinate (0-" .. HEIGHT - 1 .. "): ")
            local y = tonumber(io.read())
            remove_block(x, y)  -- Remove the block
        end
    end

    print("Goodbye!")
end

main()
