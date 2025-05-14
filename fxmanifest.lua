fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

description 'Warnwesten Script'
author 'NeroX Service (Owner: xrealchronosskt) (Invite: https://discord.gg/9aVsQtR8ew)'
version '1.0.2'

shared_scripts {
    'locales_int.lua',
    'locales/de.lua',
    'config.lua',
    'core.lua',
    '@ox_lib/init.lua'
}

--[[ shared_script '@ox_lib/init.lua' ]]

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

escrow_ignore {
    '*.lua',
    'locales/*.lua',
}
