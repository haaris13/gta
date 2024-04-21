fx_version 'cerulean'

game 'gta5'

author 'okokscripts'
description 'okokTextUI'
version '1.0.0'

ui_page 'web/ui.html'

files {
    'web/*.*'
}

client_scripts {
    'config.lua',
    'client.lua'
}

lua54 'yes'

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'