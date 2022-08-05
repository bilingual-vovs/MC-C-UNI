function select(item)
    for i = 1, 16 do
        data = turtle.getItemDetail(i)
        if not (data == nil) then
            if data.name == item then
                turtle.select(i)
                return true
            end
        end
    end
    return false 
end

return select