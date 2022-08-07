function askBool(question)
    print(question .. "[y/n]")
    ans = string.lower(io.read())

    while not (ans == "y" or ans == "n" or ans == "yes" or ans == "no") do
        print("Incorreact answear, answear could be only: 'y', 'n', 'yes' and 'no'")
        ans = string.lower(io.read())
    end

    if ans == "y" or ans == "yes" then
        ans = true
    else
        ans = false
    end
    return ans
end

return askBool