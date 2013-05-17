-- Makes a turtle travel

local args = { ... } 

os.loadAPI("/lib/lib-coords")

local home = lib-coords.getHome()

if home == nil then
    print("No home set, please input x coord:")
    local x = read()
    print("y coord:")
    local y = read()
    print("z coord:")
    local z = read()

    local vector = new vector(x, y, z)

    coords.setHome(vector)
else
    print("Turtle home set to : " .. home.x .. "/" .. home.y .. "/" .. home.z)
end

