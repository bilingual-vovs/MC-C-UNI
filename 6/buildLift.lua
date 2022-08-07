askP = require("/packets/ask")

buildRectBox = require("/functions/buildRectBox")
buildFloor = require("/functions/buildFloor")
buildFloorBack = require("/functions/buildFloor-return")
clearCubicZone = require("/functions/clearCubicZone")
clearCubicZoneBack = require("/functions/clearCubicZone-return")

fd = require("/modules/advancedForward")
select = require("/modules/select")
digUntilClean = require("/modules/digUntilClean")

height = tonumber(
    askP.ask("Enter height of lift ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

askP.askForMaterial("ladder", height)

buildWallsLift = askP.askBool("Build walls for lift?")

digRoomStandart = askP.askBool("Dig the room on target point with standart sizes ?")

if not digRoomStandart then
    x = tonumber(
        askP.ask("Enter length of room ...", 
            function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
            "Your answear must be a number and must NOT be negative (-1), please, reenter")+2
    )

    y = tonumber(
        askP.ask("Enter width of room ...", 
            function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
            "Your answear must be a number and must NOT be negative (-1), please, reenter")+2
    )

    z = tonumber(
        askP.ask("Enter height of room ...", 
            function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
            "Your answear must be a number and must NOT be negative (-1), please, reenter")+2
    )
else
    x = 7
    y = 7
    z = 5
end

buildRoom = askP.askBool("Build walls and floor of digged room?")

if not buildRoom then
    buildFl = askP.askBool("Build floor of digged room?")
end

if not askP.askBool("Build from standart material ?") then

    if not buildRoom then
        if buildFl then
            floorMaterial = askP.askForMaterialFull("Enter a name of material for room floor ...", (x-2)*(y-2))
        end
    else
        roomMaterial = askP.askForMaterialFull("Enter a name of material for room walls ...", (x+y*2*z))

        floorMaterial = askP.askForMaterialFull("Enter a name of material for room floor ...", (x-2)*(y-2))

        ceilMaterial = askP.askForMaterialFull("Enter a name of material for room ceil ...", (x-2)*(y-2))
    end

else
    roomMaterial = "cobblestone"

    floorMaterial = "cobblestone"

    ceilMaterial = "cobblestone"
    if height * 3 < (x+y)*2*z then
        askP.askForMaterial("cobblestone", (x+y)*2*z - height * 3)
    end
end





if (x+y-2)*4*math.ceil(z/3)+z*2+((x-2)*(y-2)-1)*math.ceil((z-2)/3)+z-3 + 10 + z + ((x-2)*(y-2)-1)*2  > turtle.getFuelLevel() then
    error("Not enought fuel: fuel level is " .. turtle.getFuelLevel() .. ",but " .. (x-1)*2*math.ceil(y/3)+y*2 .. " is required, add " .. (x-1)*2*math.ceil(y/3)+y*2 - turtle.getFuelLevel() .. " more!!")
end

-- Digging down

for i = 2, height do
    turtle.digDown()
    turtle.down()
end
-- To position 
if buildRoom then
    fd((x-1)/2)
    turtle.turnRight()
    fd((y-1)/2)
    turtle.turnRight()
    buildRectBox(x, y, z, roomMaterial, floorMaterial, ceilMaterial)
    turtle.digDown()
    turtle.attackDown()
    turtle.down()
    turtle.digDown()
    turtle.attackDown()
    turtle.down()
    select(ceilMaterial)
    turtle.placeUp()
    for i = 2, z-2 do
        turtle.digDown()
        turtle.attackDown()
        turtle.down()
    end
else
    fd((x-2)/2)
    turtle.turnRight()
    fd((y-2)/2)
    turtle.turnRight()
    for i = 2, z-2 do
        turtle.digUp()
        turtle.up()
    end
    clearCubicZone(x-2, y-2, z-2)
    clearCubicZoneBack(x-2, y-2, z-2)
    if buildFl then
        buildFloor(x-2, y-2, floorMaterial)
        buildFloorBack(x-2, y-2)
    end
    
end

fd((x-2)/2)
turtle.turnRight()
fd((y-2)/2)
turtle.turnRight()

for i = 2, height do
    if buildWallsLift and i-2 > z-2 then
        for c = 1, 4 do
            digUntilClean()
            select("cobblestone")
            turtle.place()
            turtle.turnLeft()
        end
    end
    turtle.digUp()
    select("cobblestone")
    turtle.place()
    select("ladder")
    turtle.up()
    turtle.placeDown()
end

fd()

turtle.turnLeft()
turtle.turnLeft()

print("Finished!!!")
