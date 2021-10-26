function getCharacterName(charUID)
    if charUID then
        local characterName = getCharacterData(charUID, "name")

        if not characterName then return end

        return characterName
    end
end
