ask = require("/modules/ask")
askForMaterial = require("/modules/askForMaterial")

function askFull(text, count)
    material = askP.ask(text or "Entar a name of material")

    if material == "ss" and turtle.getItemDetail() then
        data = turtle.getItemDetail()
        material = data.name
    elseif not turtle.getItemDetail() then
        material = ask("Selected slot is empty, enter a name of material ...")
    end

    askP.askForMaterial(material, count)


    return material
end

return askFull