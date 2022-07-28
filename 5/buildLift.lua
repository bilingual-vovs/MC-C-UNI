totalCount = require("./modules/totalCount")
select = require("./modules/select")
digUntilClean = require("./modules/digUntilClean")

clearSquere = require("./modules/clearSquere")
buildFloor = require("./modules/buildFloor")


function placeLadder()
    
end


print("Enter lift height ...")
height = io.read()

print("Build walls? [y/n]")
walls = string.lower(io.read())

while not (walls == "y" or walls == "n" or walls == "yes" or walls == "no") do
    print("Incorreact answear")
    walls = string.lower(io.read())
end

requiredStairs = tonumber(height)
oldCount = -1

while requiredStairs > totalCount("minecraft:ladder") do
    os.queueEvent("randomEvent")
    os.pullEvent()
    newCount = totalCount("minecraft:ladder")
    if oldCount ~= newCount then
        if(requiredStairs>newCount) then
            print("Required amount of ladders: " .. requiredStairs .."\n is in UNI: " .. newCount .. '\n add ' .. requiredStairs - newCount .. " more ladders")
        end
        oldCount = newCount
    end
end


print("Build room with standart sizes? [y/n]")
stRoom = string.lower(io.read())

while not (stRoom == "y" or stRoom == "n" or stRoom == "yes" or stRoom == "no") do
    print("Incorreact answear")
    stRoom = string.lower(io.read())
end

if stRoom == "n" or stRoom == "no" then
    print("Enter length of room")
    x = io.read()

    print("Enter width of room")
    y = io.read()

    print("Enter height of room")
    z = io.read()

else 
    x, y, z = 6, 6, 3
end

for i = 1, height do
    turtle.digDown()
    turtle.down()
end

-- GO to position
turtle.turnLeft()
turtle.turnLeft()


for i = 1, math.floor(x/2) do
    digUntilClean()
    turtle.forward()
end

turtle.turnRight()

for i = 1, math.floor(y/2) do
    digUntilClean()
    turtle.forward()
end

turtle.turnRight()

-- CLear


clearSquere(x, y, z)

buildFloor(x, y, "minecraft:cobblestone")

-- Return

for i = 1, math.floor(x/2) do
    digUntilClean()
    turtle.forward()
end

turtle.turnRight()

for i = 1, math.floor(y/2) do
    digUntilClean()
    turtle.forward()
end

turtle.turnLeft()

-- Building the ladders

for i = 1, height do
    if select("minecraft:cobblestone") then
        turtle.place()
    end
    select("minecraft:ladder")
    turtle.up()
    turtle.placeDown()

end

turtle.forward()
turtle.turnLeft()
turtle.turnLeft()
print("Finished")