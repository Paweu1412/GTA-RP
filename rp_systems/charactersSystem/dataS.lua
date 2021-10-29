local charactersData = {}

function setCharacterData(uid, key, data)
    if uid and key and data then
        if not charactersData[uid] then 
            charactersData[uid] = {}
        end

        charactersData[uid][key] = data

        triggerClientEvent("GTARP:ClientUpdateCharacterData", root, charactersData)
        return true
    end
end

function getCharacterData(uid, key)
    if uid and key then
        if not charactersData[uid] or not charactersData[uid][key] then return end

        return charactersData[uid][key]
    end
end

-- setPlayerCurrentCharacterData()