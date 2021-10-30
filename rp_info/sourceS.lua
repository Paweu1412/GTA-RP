function showInformation(player, text, type)
    if player then
        triggerClientEvent(player, "GTARP:ShowInformation", player, text, type)
    end
end