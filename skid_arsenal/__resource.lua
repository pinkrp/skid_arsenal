resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	"@vrp/lib/utils.lua",
    'client/client.lua',
}
server_scripts {
	"@vrp/lib/utils.lua",
    'server/server.lua',
}

ui_page('client/html/index.html')

files {
    'client/html/index.html',
    'client/html/style.css',
    'client/html/ui.js',
    'client/html/img/glocke.png',
    'client/html/img/mp5e.png',
    'client/html/img/m4a4e.png',
    'client/html/img/870e.png',
    'client/html/img/coletee.png',
    'client/html/img/equipe.png',
    'client/html/img/logoarsenal.png'
}
