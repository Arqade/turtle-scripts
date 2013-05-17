-- Makes a turtle travel
flyingAlt = 100

local args = { ... } 

os.loadAPI("/lib/libcoords")

local home = libcoords.getHome()

if home == nil then
    print("No home set, please input x coord:")
    local x = read()
    print("y coord:")
    local y = read()
    print("z coord:")
    local z = read()

    local t = {x, y, z} 

    libcoords.setHome(t)
else
    print("Turtle home set to : " .. home[1] .. "/" .. home[2] .. "/" .. home[3])
    local curr = libcoords.getCurrentCoords()
    print("Current position is : " .. curr[1] .. "/" .. curr[2] .. "/" .. curr[3])

    print("Going up to " .. flyingAlt)
    libcoords.takeoff(flyingAlt)
    print("Getting back to land")
    libcoords.land()
    
end

