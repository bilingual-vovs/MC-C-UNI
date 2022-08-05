askForMaterial = require("/modules/askForMaterial")
askBool = require("/modules/askBool")
ask = require("/modules/ask")

buildFloor = require("/functions/buildFloor")
returnBack = require("/functions/buildFloor-return")

x = tonumber(
    ask("Enter length of floor ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

y = tonumber(
    ask("Enter width of floor ...", 
        function (data) return type(tonumber(data)) == "number" and math.abs(tonumber(data)) == tonumber(data) end, 
        "Your answear must be a number and must NOT be negative (-1), please, reenter")
)

material = ask("Enter a name of material ...")

askForMaterial(material, x*y)

returning = askBool("Return to start position after finishing?")



buildFloor(x, y, material)

if returning then
    returnBack(x, y)
end

print("Finished!!!")