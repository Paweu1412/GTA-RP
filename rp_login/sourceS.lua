addEvent("GTARP:RegisterButtonTriggered", true)
addEventHandler("GTARP:RegisterButtonTriggered", root, function()
    if client then
        kickPlayer(client, "system", "Zarejestruj się w naszym panelu gracza, game.grandtheftauto-rp.pl; link został skopiowany do schowka.")
    end
end)