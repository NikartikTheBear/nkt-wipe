RegisterCommand("wipe", function (source, args, rawCommand)
    if source ~= nil then
        local xPlayer = ESX.GetPlayerFromId(source)  
        if xPlayer.GetGroup() == "admin" then
            if args ~= nil  then
                if args[1]  ~= nil then
                    MySQL.Async.fetchAll("SELECT identifier FROM users WHERE identifier =@id", {
                        ["@id"] = args[1]
                    }, function (result)
                        if #result ~= 0 then
                            MySQL.Async.execute("DELETE FROM users WHERE identifier=@identifier", { ["@identifier"] = result[1].identifier })

                            xPlayer.showNotification("Wipe avvenuto con successo")
                            
                        else
                            xPlayer.showNotification("ERRORE hai sbagliato qualche argomento riprova")
                        end
                    end)
                end
            end 
        else
            return
        end
    end
end, false)
