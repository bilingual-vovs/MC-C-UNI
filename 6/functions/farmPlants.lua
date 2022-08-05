select = require("/modules/select")
polarTurn = require("/modules/polarTurn")
forward = require("/modules/advancedForward")
getTotalCount = require("/modules/totalCount")
back = require("/functions/clearCubicZone-return")
selectNot = require("/modules/selectNot")

function farmPlants(x, y, plant, seeds)
    -- Functions 
    function replant()
        bool, data = turtle.inspectDown()
        if data.name == plant and data.metadata == 7 then
            turtle.digDown()
            select(seeds)
            turtle.placeDown()
        elseif not bool then
            select(seeds)
            turtle.placeDown()
        end
    end

    function inventoryBalance()
        turtle.turnLeft()
        turtle.turnLeft()
        while getTotalCount(seeds)>x*y do
            select(seeds)
            turtle.drop(math.min(getTotalCount(seeds)-x*y, 64))
        end
        bool = true
        while getTotalCount(seeds)<x*y and bool do
            select(seeds)
            bool = turtle.suck(math.min(x*y-   getTotalCount(seeds), 64), seeds)
        end
        while select(plant) do
            turtle.drop(64)
        end
        while selectNot({plant, seeds}) do
            turtle.drop(64)
        end
        turtle.turnRight()
        turtle.turnRight()
    end

    function checkPercantage()
        count = 0
        for i = 1, 3 do 
            bool, data = turtle.inspectDown()
            if data.metadata == 7 then
                count = count + 1
            end
            forward()
        end
        turtle.turnLeft()
        turtle.turnLeft()
        for i = 1, 3 do
            forward()
        end
        turtle.turnLeft()
        turtle.turnLeft()
        return count > 2
    end

    function clearPole()
        for b = 1, y-1 do
            for i = 1, x-1 do
                replant()
                forward()
            end
            polarTurn(b%2)

            replant()
            forward()
            polarTurn(b%2)
        end

        for i = 1, x-1 do
            replant()
            forward()
        end

        turtle.turnRight()
        replant()   
        if y%2 == 1 then
            turtle.turnRight()
        end
    end

    -- Main block


    while true do 
        inventoryBalance()
        clearPole()
        back(x, y, 1)
        while not checkPercantage() do
            os.sleep(60*40)
        end
    end

    
end

farmPlants(20, 30, "minecraft:potatoes", "minecraft:potato")