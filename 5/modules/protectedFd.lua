dig = require("./modules/digUntilClean")
function protectedFd()
    dig()
    turtle.forward()
end

return protectedFd