fx_version 'cerulean' 
game 'gta5'
lua54 'yes'

author 'perrituber'
description 'https://discord.gg/nqY4QNrXv3'

client_scripts {
  'Client/*.lua'
}

shared_scripts {
  '@es_extended/imports.lua',
  '@ox_lib/init.lua',
  'Config.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'Server/*.lua'
}


ui_page 'html/index.html'

files {
  'html/index.html',
  'html/script.js',
  'html/style.css'
}

dependency 'ox_lib' 