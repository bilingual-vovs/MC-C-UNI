buildRoom = require("/functions/buildRectRoom")
buildFloor = require("/functions/buildFloor")
buildFloorBack = require("/functions/buildFloor-return")
clearCubicZone = require("/functions/clearCubicZone")
clearCubicZoneBack = require("/functions/clearCubicZone-return")

select = require("/modules/select")
digUp = require("/modules/digUpUntilClear")
fd = require("/modules/advancedForward")

function buildRectBox(x, y, z, roomMaterial, floorMaterial, ceilMaterial)
    
buildRectRoom(x, y, z, roomMaterial)

turtle.turnRight()
fd()
turtle.turnLeft()
fd()
turtle.digDown()
turtle.down()
turtle.digDown()
turtle.down()



clearCubicZone(x-2, y-2, z-2)

clearCubicZoneBack(x-2, y-2, z-2)

buildFloor(x-2, y-2, floorMaterial)

buildFloorBack(x-2, y-2)

for i = 2, z do
    turtle.digUp()
    turtle.up()
end

buildFloor(x-2, y-2, ceilMaterial)

buildFloorBack(x-2, y-2)
end

return buildRectBox