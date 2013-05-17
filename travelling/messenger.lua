-- Makes a turtle travel
flyingAlt = 100

function reach(v)
    local curr = libcoords.getCurrentCoords()

    if v[1] == curr[1] and v[2] == curr[2] then
        print("Destination is current")
        libcoords.land()
    else
        print("Reaching flying altitude: " .. flyingAlt)
        libcoords.takeoff(flyingAlt)

        print("Moving to X/Y")
        libcoords.pathfindingXthenY(v[1], v[2])

        print("Getting back to land")
        libcoords.land()
    end
end

local args = { ... } 

os.loadAPI("/lib/libcoords")

local home = libcoords.getHome()
local ori = libcoords.getOrientation()
local curr = libcoords.getCurrentCoords()

if home == nil then
    print("No home set, please input x coord:")
    local x = read()
    print("y coord:")
    local y = read()
    print("z coord:")
    local z = read()

    local t = {x, y, z} 

    libcoords.setHome(t)
    home = libcoords.getHome()
end

if ori == nil then
    print("Which direction am I facing? north 1, east 2, south 3, west 4")
    o = read()
    libcoords.setOrientation(o)
    ori = libcoords.getOrientation()
end

if curr == nil then
    libcoords.setCurrentCoords(libcoords.getCurrentCoords())
end

print("Turtle home set to : " .. home[1] .. "/" .. home[2] .. "/" .. home[3])
local curr = libcoords.getCurrentCoords()
print("Current position is : " .. curr[1] .. "/" .. curr[2] .. "/" .. curr[3])

print("Turtle is facing : " .. ori)

print("Please input dest x :")
local xdest = tonumber(read())

print("Please input dest y :")
local ydest = tonumber(read())

local dest = {xdest, ydest}

print("proceed ?")
read()
reach(dest)

