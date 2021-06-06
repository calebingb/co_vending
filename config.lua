Config = {}

Config.IconsEnabled = false

Config.VendingDrinkIcon = "fas fa-coffee"

Config.VendingSnackIcon = "cup-straw"

Config.VendingCoffeeIcon = "cup-straw"

Config.VendingDistance = 2.5

Config.VendingDrinkModels = {
    -1317235795, --prop_vend_fridge01 : https://gtahash.site/files/recreational/prop_vend_fridge01.jpg
    1114264700, --prop_vend_soda_02 : https://gtahash.site/files/recreational/prop_vend_soda_02.jpg
    992069095, --prop_vend_soda_01 : https://gtahash.site/files/recreational/prop_vend_soda_01.jpg
}

Config.VendingSnackModels = {
    -1034034125, --prop_vend_snak_01_tu : https://gtahash.site/files/files_last/prop_vend_snak_01_tu.jpg
    -654402915, --prop_vend_snak_01 : https://gtahash.site/files/recreational/prop_vend_snak_01.jpg
}

Config.VendingCoffeeModels = {
    690372739, --prop_vend_coffe_01 : https://gtahash.site/files/recreational/prop_vend_coffe_01.jpg
}


--[[
    Item's available in each machine are listed below, in the corresponding table.

    How to add an item to the vending machine:

    Set the name to be whatever you wish the label to display,
    the price is the desired price of the item,
    and the esx_name is the name used to identify the item in the `items` table in the database (MUST BE EXACT)

    label = {
        name = name of item,
        price = price of item,
        esx_name = database name of item
    },

    Insert this table into the desired Vending stock table, and the vending_client script will add it to the options available
    at the desired vending machine/s.

    **esx_name not being the correct name as listed in the `items` table will throw an error and will not be purchasable.**
]]



Config.VendingDrinks = {
    Cola = {
        name = "Cola",
        price = 25,
        esx_name = "cola",
    },

    Water = {
        name = "Water",
        price = 10,
        esx_name = "water"
    },
}


Config.VendingCoffee = {
    Coffee = {
        name = "Coffee",
        price = 5,
        esx_name = "shittycoffee"
    },
}


Config.VendingSnacks = {
    CandyBar = {
        name = "Snickers",
        price = 50,
        esx_name = "snickers"
    },
}

