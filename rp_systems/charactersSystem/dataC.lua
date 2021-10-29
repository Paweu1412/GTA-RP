local charactersData = {}

addEvent("GTARP:ClientCharacterCharacterData", true)
addEventHandler("GTARP:ClientCharacterCharacterData", root, function(serverCharactersData)
    charactersData = serverCharactersData
end)

function getCharacterData(uid, key)
    if uid and key then
        if not charactersData[uid] or not charactersData[uid][key] then return end

        return charactersData[uid][key]
    end
end