local badWords = Config.badwords
local discordWebhook = Config.badwords.discord.discordWebhook

AddEventHandler('chatMessage', function(source, name, message)
    for _, word in ipairs(badWords) do
        if string.find(message, word, 1, true) then
            local player = GetPlayerIdentifiers(source)
            local playerName = GetPlayerName(source)
            local playerDiscordId = nil
            local playerFiveMId = nil

            for _, identifier in ipairs(player) do
                if string.find(identifier, "discord:") then
                    playerDiscordId = string.gsub(identifier, "discord:", "")
                elseif string.find(identifier, "fivem:") then
                    playerFiveMId = string.gsub(identifier, "fivem:", "")
                end
            end

            local embed = {
                title = "Language Filter Alert",
                fields = {
                    { name = "Player: ", value = playerName or "Unknown" },
                    { name = "Discord ID: ", value = playerDiscordId or "Unknown" },
                    { name = "FiveM ID: ", value = playerFiveMId or "Unknown"},
                    { name = "Word/Sentence: ", value = word or "Unknown"}
                },
                color = 16711680,
                footer = {
                    text = "Language Filter - Made by JoeV2"
                }
            }

            PerformHttpRequest(discordWebhook, function(statusCode, response, headers) end, 'POST', json.encode({embeds = {embed}}), { ['Content-Type'] = 'application/json' })
            DropPlayer(source, "[LanguageFilter] You have been kicked for using [ " .. word .. " ] Please don't use it again.")
            CancelEvent()
            return
        end
    end
end)
