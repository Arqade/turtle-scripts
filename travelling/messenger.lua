-- Makes a turtle travel

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

    local vector = vector.new(x, y, z)

    libcoords.setHome(vector)
else
    print("Turtle home set to : " .. home.x .. "/" .. home.y .. "/" .. home.z)
end

