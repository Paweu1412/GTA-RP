addEventHandler("onPlayerChat", root, function(message, messageType)
    if messageType == 0 then
        outputMessage(source, 1, message)
    elseif messageType == 1 then
        outputMessage(source, 2, message)
    end

    cancelEvent()
end)

function correctText(text, uppercase)
    if text then
        local endLetter = string.sub(text, -1)

        if endLetter ~= "." and endLetter ~= "?" and endLetter ~= "!" then
            text = text.."."
        end

        if uppercase == true then
            return text
        end

        return text:gsub("^%l", string.upper)
    end
end

function getPlayersInRange(player, range)
    if player and range then
        local playerX, playerY, playerZ = getElementPosition(player)
        local playersInRange = getElementsWithinRange(playerX, playerY, playerZ, range, "player")

        if not playersInRange then return end

        return playersInRange
    end
end

local genderStrings = {
    ["man"] = {"zawiódł", "odniósł sukces"},
    ["woman"] = {"zawiodła", "odniosła sukces"}
}

function outputMessage(player, type, text)
    if player and type and text then
        local currentCharacter = exports.rp_systems:getPlayerData(player, "character_id")
        
        if currentCharacter then
            if type == 1 then -- mówienie
                outputChatBox(exports.rp_systems:getCharacterData(currentCharacter, "name").. " mówi: " ..correctText(text), getPlayersInRange(player, 10), 255, 255, 255)
            elseif type == 2 then -- /me
                outputChatBox("** " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. " " ..correctText(text, true), getPlayersInRange(player, 15), 220, 162, 244)
            elseif type == 3 then -- /do
                outputChatBox("** " ..correctText(text).. " (( " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. " )) **", getPlayersInRange(player, 15), 137, 130, 189)
            elseif type == 4 then -- szept
                outputChatBox(exports.rp_systems:getCharacterData(currentCharacter, "name").. " szepcze: " ..correctText(text), getPlayersInRange(player, 5), 255, 255, 255)
            elseif type == 5 then -- krzyk
                outputChatBox(exports.rp_systems:getCharacterData(currentCharacter, "name").. " krzyczy: " ..text:gsub("^%l", string.upper).. "!", getPlayersInRange(player, 20), 255, 255, 255)
            elseif type == 6 then -- ooc
                outputChatBox("(( " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. ": " ..text.. " ))", getPlayersInRange(player, 15), 171, 171, 171)
            elseif type == 7 then -- /sprobuj
                print(true)

                local characterUID = exports.rp_systems:getPlayerCurrentCharacter(player)
                local characterGender = exports.rp_systems:getCharacterGender(characterUID)
                iprint(characterUID, characterGender)

                outputChatBox("* " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. " " ..genderStrings[characterGender][math.random(#genderStrings[characterGender])].. " próbując "..correctText(text, true), getPlayersInRange(player, 15), 220, 162, 244)
            end
        end
    end
end

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