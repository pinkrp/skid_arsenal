-- ESSE RESOURCE FOI FEITO COM UM UNICO INTUÍTO DE APRENDIZADO
-- SENDO ASSIM, É PROÍBIDO A VENDA E COMERCIALIZAÇÃO :C
-- VOCÊ TEM TOTAL LIBERDADE PARA MODIFICAR O QUE QUISER, COMPARTILHAR COM QUEM QUISER, SÓ NÃO VENDA <3
-- FOI FEITO COM CARINHO E TÁ COMENTADO NAS PARTES MAIS DIFICIEIS
-- PRECISA ALTERAR AS NOTIFYS POIS ESTÁ CONFIGURADO PARA O MEU
-- ATÉ ONDE FOI TESTADO ESTAVA COMPLETAMENTE FUNCIONAL, QUALQUER BUG, RELATE PARA UM DOS DISCORDS ABAIXO 
-- DISCORD CRIADOR: @pink_rp#0803 (@Skerverus#0331 foi quem me instruiu na comunicação JS/CLIENT <3)

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("skid_arsenal",emP)



function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"policia.permissao")
end



