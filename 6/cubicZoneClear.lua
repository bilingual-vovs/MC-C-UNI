clearCubicZone = require("/functions/clearCubicZone")
returnBack = require('/functions/clearCubicZone-return')
ask = require("/modules/ask")
askBool = require("/modules/askBool")

-- Data input

x = tonumber(
    ask("Enter the length of zone ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

y = tonumber(
    ask("Enter the width of zone ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

z = tonumber(
    ask("Enter the height of zone ...", 
        function (data) return type(tonumber(data)) == "number" end, 
        "Your answear must be a number, please, reenter")
)

returnToStart = askBool("Return to start position after finishing?")

neededFuel = (x*y-1)*math.ceil(z/3)+z-1
if neededFuel > turtle.getFuelLevel() then
    print("It is not enought fuel, please refuel your turtle")
    error("Not enought fuel: " .. neededFuel .. " is required, but fuel level is " .. turtle.getFuelLevel())
end

-- Clearing
for i = 2, z do
    turtle.digUp()
    turtle.up()
end

clearCubicZone(x, y, math.abs(z))

-- Returning
if returnToStart then
    returnBack(x, y, z)
end

print("Finished!!!")