function selectNot(items)
    
    for i = 1, 16 do
        data = turtle.getItemDetail(i)
        bool = false
        if data then
            for a = 1, table.getn(items) do
                bool = bool or data.name == items[a]
            end
            if not bool then
                turtle.select(i)
                return true
            end
        end
        
    end
    return false 
end

return selectNot