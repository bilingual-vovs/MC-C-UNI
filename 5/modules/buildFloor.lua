dig = require('./modules/digUntilClean')
forward = require("./modules/protectedFd")
turnPol = require("./modules/polarTurn")
select = require("./modules/select")



function buildFloor(x, y, material)

    function placeDown() 
        select(material)
        turtle.placeDown()
    end

        
        
    for b = 2, y do
        for c = 2, x do
            placeDown()
            forward()
        end
        placeDown()
        turnPol(b%2 == 1)
        forward()
        placeDown()
        turnPol(b%2 == 1)
        if y-b == 0 then
            for c = 2, x do
                placeDown()
                forward()
            end
            placeDown()
            if y%2 ==1 then
                turtle.turnLeft()
                turtle.turnLeft()
                for c = 2, x do
                    placeDown()
                    forward()
                end
                
            end
            turtle.turnRight()
                for bb = 2, y do
                    placeDown()
                    forward()
                end
                turtle.turnRight()
            
        end
    end
    
    
end
    
return buildFloor