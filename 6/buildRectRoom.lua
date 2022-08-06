askP = require("/packets/ask")
buildRoom = require("/functions/buildRectRoom")

select = require("/modules/select")
digUp = require("/modules/digUpUntilClear")
fd = require("/modules/advancedForward")

x = tonumber(
    askP.ask("Enter length of room ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

y = tonumber(
    askP.ask("Enter width of room ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

z = tonumber(
    askP.ask("Enter height of room ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

if (x+y-2)*4*math.ceil(z/3)+z*2  > turtle.getFuelLevel() then
    error("Not enought fuel: fuel level is " .. turtle.getFuelLevel() .. ",but " .. (x-1)*2*math.ceil(y/3)+y*2 .. " is required, add " .. (x-1)*2*math.ceil(y/3)+y*2 - turtle.getFuelLevel() .. " more!!")
end

material = askP.ask("Enter a name of material ...")

askP.askForMaterial(material, x*y)

returning = askP.askBool("Return to start position after finishing?")

buildRectRoom(x, y, z, material)

if returning then
    turtle.turnLeft()
    turtle.turnLeft()
    fd()

    for i = 1, z do
        turtle.digDown()
        turtle.down()
    end
    turtle.turnLeft()
    turtle.turnLeft()
    
end

print("Finished!!!")