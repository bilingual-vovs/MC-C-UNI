function logTable(table)
    if type(table) == "table" then
        res = '{ \n'
        for key, value in pairs(table) do
            res = res .. "  " .. key .. ': ' .. logTable(value) .. ", \n"
        end
        return (res .. "}")
    else
        return (tostring(table))
    end
end

return logTable