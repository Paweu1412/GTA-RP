function getCharacterName(charUID)
    if charUID then
        local characterName = getCharacterData(charUID, "name")

        if not characterName then return end

        return characterName
    end
end

local womenSkinsIDs = {
[9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [31] = true, [38] = true, [39] = true, [40] = true, [41] = true, [53] = true, [54] = true, [55] = true, [56] = true, [63] = true, [64] = true, [69] = true, [75] = true, [76] = true, [77] = true, [85] = true, [87] = true, 
[88] = true, [89] = true, [90] = true, [91] = true, [92] = true, [93] = true, [129] = true, [130] = true, [131] = true, [138] = true, [139] = true, [140] = true, [141] = true, [145] = true, [148] = true, [150] = true, [151] = true, [152] = true, [157] = true,
[169] = true, [172] = true, [178] = true, [190] = true, [191] = true, [192] = true, [193] = true, [194] = true, [195] = true, [196] = true, [197] = true, [198] = true, [199] = true, [201] = true, [205] = true, [207] = true, [211] = true, [214] = true,
[215] = true, [216] = true, [218] = true, [219] = true, [224] = true, [225] = true, [226] = true, [231] = true, [232] = true, [233] = true, [237] = true, [238] = true, [243] = true, [244] = true, [245] = true, [246] = true, [251] = true, [256] = true,
[257] = true, [263] = true, [298] = true, [304] = true
}

function getCharacterGender(charUID)
    if charUID then
        local characterSkin = getCharacterData(charUID, "skin")

        if not characterSkin then return end

        return womenSkinsIDs[characterSkin] and "woman" or "man"
    end
end