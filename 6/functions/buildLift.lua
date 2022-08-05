clearCubicZone = require("/functions/clearCubicZone")

function buildLift(height, room, buildWalls, buildRoomWals, materials)
    -- Fuel calculating

    -- Diging down
    for i = 1, height do
        turtle.digDown()
        turtle.down()
    end

    -- Going to position for cleaning

    for i = 1, room.x do
        turtle.forward()
    end
end