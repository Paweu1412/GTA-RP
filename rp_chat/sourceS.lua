addEventHandler("onPlayerChat", root, function(message, messageType)
    if messageType == 0 then
        outputMessage(source, 1, message)
    elseif messageType == 1 then
        outputMessage(source, 2, message)
    end

    cancelEvent()
end)

local upperCasedCharacters = {
    ["a"] = "A", ["ą"] = "Ą",
    ["b"] = "B", ["c"] = "C",
    ["d"] = "D", ["e"] = "E",
    ["ę"] = "Ę", ["f"] = "F",
    ["g"] = "G", ["h"] = "H",
    ["i"] = "I", ["j"] = "J",
    ["k"] = "K", ["l"] = "L",
    ["ł"] = "Ł", ["m"] = "M",
    ["n"] = "N", ["ń"] = "Ń",
    ["o"] = "O", ["ó"] = "Ó",
    ["p"] = "P", ["q"] = "Q",
    ["r"] = "R", ["s"] = "S",
    ["ś"] = "Ś", ["t"] = "T",
    ["u"] = "U", ["v"] = "V",
    ["w"] = "W", ["x"] = "X",
    ["y"] = "Y", ["z"] = "Z",
    ["ż"] = "Ż", ["ź"] = "Ź"
}

function correctText(text, extra)
    if text then
        local endLetter = string.sub(text, -1)

        if extra ~= 2 then
            if endLetter ~= "." and endLetter ~= "?" and endLetter ~= "!" then
                text = text.."."
            end
        end

        if extra == 1 then
            return text
        end

        local upperCasedFirstLetter = upperCasedCharacters[utf8.sub(text, 1, 1)]
        if upperCasedFirstLetter ~= nil then
            return upperCasedFirstLetter..utf8.sub(text, 2)
        end

        upperCasedFirstLetter = upperCasedCharacters[string.sub(text, 1, 1)]
        if upperCasedFirstLetter then
            return upperCasedFirstLetter..utf8.sub(text, 2)
        end

        return text
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

function outputMessage(player, type, text, id)
    if player and type and text then
        local currentCharacter = exports.rp_systems:getPlayerData(player, "character_id")
        
        if currentCharacter then
            if type == 1 then -- mówienie
                outputChatBox(exports.rp_systems:getCharacterData(currentCharacter, "name").. " mówi: " ..correctText(text), getPlayersInRange(player, 10), 255, 255, 255)
            elseif type == 2 then -- /me
                outputChatBox("** " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. " " ..correctText(text, 1), getPlayersInRange(player, 15), 220, 162, 244)
            elseif type == 3 then -- /do
                outputChatBox("** " ..correctText(text).. " (( " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. " )) **", getPlayersInRange(player, 15), 137, 130, 189)
            elseif type == 4 then -- szept
                outputChatBox(exports.rp_systems:getCharacterData(currentCharacter, "name").. " szepcze: " ..correctText(text), getPlayersInRange(player, 5), 255, 255, 255)
            elseif type == 5 then -- krzyk
                outputChatBox(exports.rp_systems:getCharacterData(currentCharacter, "name").. " krzyczy: " ..correctText(text, 2).. "!", getPlayersInRange(player, 20), 255, 255, 255)
            elseif type == 6 then -- ooc
                outputChatBox("(( " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. ": " ..text.. " ))", getPlayersInRange(player, 15), 171, 171, 171)
            elseif type == 7 then -- /sprobuj
                local characterUID = exports.rp_systems:getPlayerCurrentCharacter(player)
                local characterGender = exports.rp_systems:getCharacterGender(characterUID)

                if not characterUID or not characterGender then return end

                outputChatBox("* " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. " " ..genderStrings[characterGender][math.random(#genderStrings[characterGender])].. " próbując "..correctText(text, 1), getPlayersInRange(player, 15), 220, 162, 244)
            elseif type == 8 then -- /w
                if id then
                    id = tonumber(id)

                    if not id then return end

                    local targetPlayer = exports.rp_systems:getPlayerByID(id)

                    if not targetPlayer then
                        exports.rp_info:showInformation(player, "Wskazany gracz nie istnieje!", "failure")
                        
                        return false
                    end

                    local sendingPlayerID = exports.rp_systems:getPlayerData(player, "id")

                    if id == sendingPlayerID then return end

                    outputChatBox("(( < " ..string.gsub(getPlayerName(player), "_", " ").. " (" ..sendingPlayerID.. "): " ..text.. " ))", targetPlayer, 230, 138, 25)
                    outputChatBox("(( > " ..string.gsub(getPlayerName(targetPlayer), "_", " ").. " (" ..id.. "): " ..text.. " ))", player, 230, 138, 25)
                end
            end
        end
    end
end