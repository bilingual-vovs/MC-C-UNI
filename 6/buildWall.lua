askP = require("/packets/ask")
buildWall = require("/functions/buildWall")

select = require("/modules/select")
digUp = require("/modules/digUpUntilClear")
fd = require("/modules/advancedForward")

x = tonumber(
    askP.ask("Enter length of wall ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

y = tonumber(
    askP.ask("Enter height of wall ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

if (x-1)*2*math.ceil(y/3)+y*2 > turtle.getFuelLevel() then
    error("Not enought fuel: fuel level is " .. turtle.getFuelLevel() .. ",but " .. (x-1)*2*math.ceil(y/3)+y*2 .. " is required, add " .. (x-1)*2*math.ceil(y/3)+y*2 - turtle.getFuelLevel() .. " more!!")
end

material = askP.ask("Enter a name of material ...")

askP.askForMaterial(material, x*y)

buildWall(x, y, material)

for i = 2, y do
    turtle.down()
    digUp()
    select(material)
    turtle.placeUp()
end


turtle.turnLeft()
turtle.turnLeft()
fd()
turtle.turnLeft()
turtle.turnLeft()
turtle.place()

print("Finished!!!")