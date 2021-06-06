fx_version 'cerulean'
game 'gta5'

author 'TooHot'
description 'A script to make those damn vending machines work'
version '1.0.0'

server_scripts {
    'config.lua',
    'server/vending_server.lua'
}

client_scripts {
    'client/vending_client.lua',
    'config.lua'
}