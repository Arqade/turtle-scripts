-- Chunk floor
--
-- ^|^|^|^|^|^|^|^
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- xxxxxxxxxxxxxxx
-- Sxxxxxxxxxxxxxx
--
-- S: Start (should be one block above the layer to be filled)
-- Both layer should be clear!
--
-- floorchunk 


function waitEnter() 
    print("Press <Enter>")
    read()
end

function digItPlaceMove(last) 
    -- If something is down, remove it
    while turtle.detectDown() do
        print("Removing below!!")
        turtle.digDown()
        sleep(0.5)
    end
    
    local refill = 0
    local doRefill = false

    if turtle.getItemCount(16) == 1 then
        doRefill = true
        -- Look for another slot with the same block
        for i = 15, 1, -1 do
            if turtle.compareTo(i) then
                refill = i
                break
            end
        end
    end

    turtle.placeDown()

    -- Refill 
    if doRefill and not last then
        if refill ~= 0 then
            turtle.select(refill)
            turtle.transferTo(16)
            turtle.select(16)
        else
            print("Block type mismatch! Please refill slot 16")
            waitEnter()
        end
    end

    -- If something is in front, remove it
    while turtle.detect() do
        print("Removing forward!!")
        turtle.dig()
        sleep(0.5)
    end

    -- Commit move
    turtle.forward()
end

function fill(l, w) 
    turtle.select(16)
    -- Do one square
    for i = 1, w do
        for j = 1, l - 1 do
            digItPlaceMove(false)
        end

        if i ~= w then
            if i % 2 == 1 then
                turtle.turnRight()
                digItPlaceMove(false)
                turtle.turnRight()
            else
                turtle.turnLeft()
                digItPlaceMove(false)
                turtle.turnLeft()
            end
        else
            -- Last one
            turtle.turnRight()
            digItPlaceMove(true)
            -- Back to S
            for k = 1, w - 2 do
                turtle.forward()
            end
            turtle.turnRight()
        end
    end
end

function fuelCheck(l, w)
    while turtle.getFuelLevel() < (w * l + 20) do
        turtle.select(1)
        print("Fuel level is insufficient (Needs: ", (w * l  + 20) - turtle.getFuelLevel(), " more)")
        print("Please refuel slot 1")
        waitEnter()
        turtle.refuel(64)
    end
end


function itemsCheck(l, w)
    print("Checking for items, please ensure first 4 last slots are loaded with the right block type")
    waitEnter()

    local result = true

    for i = 13, 16 do
        if turtle.getItemCount(i) < 64 then
            result = false
            print("Slot ", i, " is incomplete")
        end
    end

    return result
end

--
local args = { ... }

if #args < 2 then
    print "floorplace <depth> <width>"
    error()
end

l = args[1]
w = args[2]

-- Check fuel
fuelCheck(l, w)

--while not itemsCheck() do
--end

fill(l, w)
