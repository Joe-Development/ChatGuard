local cache = {}
local cooldownTime = Config.cooldownTime * 1000
local badWords = Config.blacklistedWords

AddEventHandler("chatMessage", function(source, name, message)
    local currentTime = GetGameTimer()
    
    if Config.spamProtection then
        if not cache[name] then
            cache[name] = {
                count = 1,
                lastMessageTime = currentTime
            }
        else
            local elapsedTime = currentTime - cache[name].lastMessageTime
            if elapsedTime < cooldownTime then
                cache[name].count = cache[name].count + 1
                if cache[name].count > Config.MessageActivation then
                    local remainingTime = (Config.cooldownTime * 1000) - elapsedTime
                    TriggerClientEvent("chat:addMessage", source, {args = {"~r~[ChatGuard]", "~w~Your message has been blocked due to spamming. Please wait ~b~[" .. math.floor(remainingTime / 1000) .. "]~w~ seconds before sending another message."}})
                    CancelEvent()
                    return
                end
            else
                cache[name].count = 1
                cache[name].lastMessageTime = currentTime
            end
        end
    end
    
    for _, word in ipairs(badWords) do
        if string.find(message:lower(), word:lower(), 1, true) then
            DropPlayer(source, "[ChatGuard] You have been kicked for using A Blacklisted Word. Please don't use it again.")
            CancelEvent()
            return
        end
    end
end)
