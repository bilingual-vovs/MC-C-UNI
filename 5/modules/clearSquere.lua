dig = require('./modules/digUntilClean')
forward = require("./modules/protectedFd")
turnPol = require("./modules/polarTurn")

function clearSquere(x, y, z)

    if y%2==0 then
        movemetAmount = x*y*z
    else
        movemetAmount = x*y*z+(x-1)*z
    end

    fuelLevel = turtle.getFuelLevel()
    if movemetAmount > fuelLevel then
        print("Not enouth fuel, fuelLevel: " .. fuelLevel .. ", needed level: " .. movemetAmount)
    else

        -- Start of cleaning
        for i = 2, z do
            turtle.digUp()
            turtle.up()
        end
        for a = 2, z do
            for b = 2, y do
                for c = 2, x do
                    turtle.digDown()
                    forward()
                end
                turtle.digDown()
                turnPol(b%2 == 1)
                forward()
                turtle.digDown()
                turnPol(b%2 == 1)
                if y-b == 0 then
                    for c = 2, x do
                        turtle.digDown()
                        forward()
                    end
                    turtle.digDown()
                    if y%2 ==1 then
                        turtle.turnLeft()
                        turtle.turnLeft()
                        for c = 2, x do
                            turtle.digDown()
                            forward()
                        end
                        
                    end
                    turtle.turnRight()
                        for bb = 2, y do
                            turtle.digDown()
                            forward()
                        end
                        turtle.turnRight()
                    
                end
            end
            if a<tonumber(z) then
                turtle.digDown()
                turtle.down()
            end
            
        end
    end

    if z == "1" then
        for b = 2, y do
            for c = 2, x do
                forward()
            end
            turnPol(b%2 == 1)
            forward()
            turnPol(b%2 == 1)
            if y-b == 0 then
                for c = 2, x do
                    forward()
                end
                if y%2 ==1 then
                    turtle.turnLeft()
                    turtle.turnLeft()
                    for c = 2, x do
                        forward()
                    end
                    
                end
                turtle.turnRight()
                    for bb = 2, y do
                        forward()
                    end
                    turtle.turnRight()
                
            end
        end
    end

    turtle.down()
end

return clearSquere