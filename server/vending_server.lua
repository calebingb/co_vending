ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('co_vending:buyItem')
AddEventHandler('co_vending:buyItem', function(itemLabel, price, esx_name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= price then -- If player has the cash, then

        if xPlayer.canCarryItem(esx_name, 1) then -- If player can carry, then
            xPlayer.removeMoney(price)  -- Removes the cost of the item
            xPlayer.addInventoryItem(esx_name, 1) -- Adds to the player's inventory
            xPlayer.showNotification("You have bought one "..itemLabel.."!")
        else 
            -- If player cannot carry
            xPlayer.showNotification("Not Enough Space In Your Pockets!")
        end
    else
        --If player does not have the cash for the item, then
        xPlayer.showNotification("Not Enough Cash!",1) 
    end
end)