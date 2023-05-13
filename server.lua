

RegisterCommand("wipe", function (source, args, rawCommand)
    local source = source
        local xPlayer = ESX.GetPlayerFromId(source)  
        if xPlayer.GetGroup() == "admin" then
            if args ~= nil  then
                if args[1]  ~= nil then
                    MySQL.query("SELECT identifier FROM users WHERE identifier =@id", {
                        ["@id"] = args[1]
                    }, function (result)
                        if #result ~= 0 then
                            MySQL.query("DELETE FROM users WHERE identifier=@identifier", { ["@identifier"] = result[1].identifier })

                            xPlayer.showNotification("Wipe avvenuto con successo")
                            
                        else
                            xPlayer.showNotification("ERRORE hai sbagliato qualche argomento riprova")
                        end
                    end)
                end
            end 
        else
            xPlayer.showNotification('Specifica un id')
        end
end, false)
