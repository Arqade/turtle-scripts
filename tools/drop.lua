local args = { ... }

if #args < 1 then
    ori = "front"
else 
    ori = args[1]
end

for i = 1, 16 do
    turtle.select(i)
    if ori == "front" then
        turtle.drop()
    elseif ori = "down" then
        turtle.dropDown()
    elseif ori = "up" then
        turtle.dropUp()
    else
        print("Wrong parameter")
    end
end
