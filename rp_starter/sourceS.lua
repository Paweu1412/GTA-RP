local resourcesToStart = {
    "rp_util",
    "rp_database",
    "rp_systems",
    "rp_chat",
    "rp_names",
    "rp_login"
}

addEventHandler("onResourceStart", resourceRoot, function()
    for i = 1, #resourcesToStart do
        local resourceToStart = resourcesToStart[i]

        startResource(getResourceFromName(resourceToStart))
    end
end)