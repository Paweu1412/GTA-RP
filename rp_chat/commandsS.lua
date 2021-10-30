addCommandHandler("do", function(player, command, ...)
    if player then
        local text = {...}
        text = table.concat(text, " ")

        if not text or string.len(text) < 1 then return end

        outputMessage(player, 3, text)
    end
end)

addCommandHandler("c", function(player, command, ...)
    if player then
        local text = {...}
        text = table.concat(text, " ")

        if not text or string.len(text) < 1 then return end

        outputMessage(player, 4, text)
    end
end)

addCommandHandler("k", function(player, command, ...)
    if player then
        local text = {...}
        text = table.concat(text, " ")

        if not text or string.len(text) < 1 then return end

        outputMessage(player, 5, text)
    end
end)

addCommandHandler("b", function(player, command, ...)
    if player then
        local text = {...}
        text = table.concat(text, " ")

        if not text or string.len(text) < 1 then return end

        outputMessage(player, 6, text)
    end
end)

addCommandHandler("sprobuj", function(player, command, ...)
    if player then
        local text = {...}
        text = table.concat(text, " ")
        
        if not text or string.len(text) < 1 then return end

        outputMessage(player, 7, text)
    end
end)

addCommandHandler("w", function(player, command, id, ...)
    if id then
        local text = {...}
        text = table.concat(text, " ")

        if not text or string.len(text) < 1 then return end

        outputMessage(player, 8, text, id)
    end
end)