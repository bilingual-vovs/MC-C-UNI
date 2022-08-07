askP = require("/packets/ask")
buildRectBox = require("/functions/buildRectBox")


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

if (x+y-2)*4*math.ceil(z/3)+z*2+((x-2)*(y-2)-1)*math.ceil((z-2)/3)+z-3 + 10 + z + ((x-2)*(y-2)-1)*2  > turtle.getFuelLevel() then
    error("Not enought fuel: fuel level is " .. turtle.getFuelLevel() .. ",but " .. (x-1)*2*math.ceil(y/3)+y*2 .. " is required, add " .. (x-1)*2*math.ceil(y/3)+y*2 - turtle.getFuelLevel() .. " more!!")
end

roomMaterial = askP.askForMaterialFull("Enter a name of material fo room walls ...", (x+y*2*z))

floorMaterial = askP.askForMaterialFull("Enter a name of material fo room floor ...", (x-2)*(y-2))

ceilMaterial = askP.askForMaterialFull("Enter a name of material fo room ceil ...", (x-2)*(y-2))

buildRectBox(x, y, z, roomMaterial, floorMaterial, ceilMaterial)

print("Finished!!!")