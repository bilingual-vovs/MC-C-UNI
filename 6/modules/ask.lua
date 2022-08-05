function ask(question, condition, alternative)
    print(question)
    ans = io.read()
    while condition and not condition(ans)do 
        print(alternative or question)
        ans = io.read()
    end
    return ans
end

return ask