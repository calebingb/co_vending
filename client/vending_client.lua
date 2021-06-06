Citizen.CreateThread(function()
    local vendDrink = {}
    local vendSnack = {}
    local vendCoffee = {}
    local subOption = {}

    --[[
        Sorts through the Config for all drinks listed, and will set the label,
        the price will be set in the config, as well as the icon is set in the config for all drinks.

        After these options are set it sets the option on all models listed in the drink model table listed in the config,
        no job is required to use, and the distance the player needs to be from the machine is also set in the Config.
    ]]
    for i, x in pairs(Config.VendingDrinks) do
        subOption = {}
        subOption['event'] = x.name.."Sold"
        if Config.IconsEnabled then
            subOption['icon'] = Config.VendingDrinkIcon
        else
            subOption['icon'] = nil
        end
        subOption['label'] = x.name .. " - $" .. x.price -- Label is set with the value being the name and the price in one line.
        vendDrink[i] = subOption
    end

    exports['bt-target']:AddTargetModel(Config.VendingDrinkModels, {
        options = vendDrink,
        job = {"all"},
        distance = Config.VendingDistance
    })

    --[[
        Sorts through the Config for all snacks listed, and will set the label,
        the price will be set in the config, as well as the icon is set in the config for all snacks.

        After these options are set it sets the option on all models listed in the snack model table listed in the config,
        no job is required to use, and the distance the player needs to be from the machine is also set in the Config.
    ]]    
    for i, x in pairs(Config.VendingSnacks) do
        subOption = {}
        subOption['event'] = x.name.."Sold"
        if Config.IconsEnabled then
            subOption['icon'] = Config.VendingSnackIcon
        else
            subOption['icon'] = nil
        end
        subOption['label'] = x.name .. " - $" .. x.price
        vendSnack[i] = subOption
    end

    exports['bt-target']:AddTargetModel(Config.VendingSnackModels, {
        options = vendSnack,
        job = {"all"},
        distance = Config.VendingDistance
    })


    --[[
        Sorts through the Config for all coffees listed, and will set the label,
        the price will be set in the config, as well as the icon is set in the config for all coffees.

        After these options are set it sets the option on all models listed in the coffee model table listed in the config,
        no job is required to use, and the distance the player needs to be from the machine is also set in the Config.
    ]]
    for i, x in pairs(Config.VendingCoffee) do
        subOption = {}
        subOption['event'] = x.name.."Sold"
        if Config.IconsEnabled then
            print("Icons Enabled")
            subOption['icon'] = Config.VendingCoffeeIcon
        else
            subOption['icon'] = nil
        end
        subOption['label'] = x.name .. " - $" .. x.price
        vendCoffee[i] = subOption
    end

    exports['bt-target']:AddTargetModel(Config.VendingCoffeeModels, {
        options = vendCoffee,
        job = {"all"},
        distance = Config.VendingDistance
    })


    --[[
        Goes through every single item to be sold, creates an EventHandler specifically to deal with their own sales.
        Event is only really used by this client script and bt-target's client script, so it shouldn't need to be registered
        as a NetEvent.


        My solution to make it usable by only modifying the config. Not sure if this is the most efficient, but it was
        the solution that worked for me.

        Event name should be [name]+Sold. All events are passed into the 'event' option on each option available.
    ]]
    for i, x in pairs(Config.VendingDrinks) do
        AddEventHandler(x.name.."Sold", function()
            TriggerServerEvent('co_vending:buyItem', x.name, x.price, x.esx_name) -- Calls the buyItem script in ./server
        end)
    end

    for i, x in pairs(Config.VendingSnacks) do
        AddEventHandler(x.name.."Sold", function()
            TriggerServerEvent('co_vending:buyItem', x.name, x.price, x.esx_name) -- Calls the buyItem script in ./server
        end)
    end

    for i, x in pairs(Config.VendingCoffee) do
        AddEventHandler(x.name.."Sold", function()
            TriggerServerEvent('co_vending:buyItem', x.name, x.price, x.esx_name) -- Calls the buyItem script in ./server
        end)
    end
end)
