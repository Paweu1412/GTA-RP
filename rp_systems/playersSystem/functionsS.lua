function getPlayerCurrentCharacter(player)
    if player then
        local currentCharacter = getPlayerData(player, "character_id")

        if not currentCharacter then return end

        return currentCharacter
    end
end