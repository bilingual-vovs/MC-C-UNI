totalCount = require("/modules/totalCount")
ask = require("/modules/ask") 


function askForMaterial(material, count, text)
    if material == "ss" and turtle.getItemDetail() then
        data = turtle.getItemDetail()
        material = data.name
    elseif not turtle.getItemDetail() then
        material = ask("Selected slot is empty, enter a name of material ...")
    end

    if not  string.find(material, "minecraft:") then
        material = "minecraft:" .. material
    end

    oldCount = -1

    while count > totalCount(material) do
        os.queueEvent("randomEvent")
        os.pullEvent()
        newCount = totalCount(material)
        if oldCount ~= newCount then    
            if(count>newCount) then
                deference = count - newCount
                if deference <= 0 then
                    deference = 0
                end
                print((text or "Not enought " .. material) .. ", totalcount: " .. newCount .. ", needed count: ".. count .. ", add " .. (deference) .. " more " .. material .. "!")
            end
            oldCount = newCount
        end
    end
end

return askForMaterial