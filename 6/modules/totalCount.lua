
function totalCount(itemName)
    count = 0
    for i = 1, 16 do
        data = turtle.getItemDetail(i)
        if not (data == nil) then
            if data.name == itemName then
                count= count + data.count
            end
        end
    end
    return count
end
return totalCount