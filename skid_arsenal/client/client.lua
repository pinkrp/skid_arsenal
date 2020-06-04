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
emP = Tunnel.getInterface("skid_arsenal")

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD PARA CRIAR O BLIP NO CHÃO
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 1, ['x'] = -1098.84, ['y'] = -826.03, ['z'] = 14.28 },
	
}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local crds = GetEntityCoords(ped)
			local distance = GetDistanceBetweenCoords(crds,v.x,v.y,v.z,true)
			if distance <= 5 then
			DrawMarker(23,v.x,v.y,v.z-0.95,0,0,0,0,0,0,1.0,1.0,0.5,77,0,75,30,0,0,0,0)
				if distance <= 0.5 then
					drawTxt("Pressione [E] para acessar o arsenal da polícia",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and emP.checkPermission() then
						ToggleActionMenu()
					end
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION DISPLAY - SHOW/HIDE NUI
-----------------------------------------------------------------------------------------------------------------------------------------
local display = false

function ToggleActionMenu()

	SetDisplay(not display)
end

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool,bool)
    SendNUIMessage({  --envia informações para o javascript, no caso Message
        type = "ui",
        status = bool
    })
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- NUI CALLBACK - CALLBACK DO JAVASCRIPT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('gun', function(data)
	local ped = PlayerPedId()
	local arma = ""
	if emP.checkPermission() then

		if data.arma == "colete" then
			SetPedArmour(ped,100)
			TriggerEvent("Notify","Você vestiu um colete.","Bom patrulhamento","Azul")

		elseif data.arma == "equip" then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,false,false)
			GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,false,false)
			GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,false,false)
			TriggerEvent("Notify","Você pegou seus itens essenciais.","Bom patrulhamento","Azul")

		elseif data.arma == "COMBATPISTOL" then
			arma = "Glock G18"			
			GiveWeaponToPed(ped,GetHashKey("WEAPON_"..data.arma),250,false,false)	
			TriggerEvent("Notify","Você se equipou com "..arma..".","Bom patrulhamento","Azul")

		elseif data.arma ~= "COMBATPISTOL" and data.arma ~= "colete" and data.arma ~= "equip" then

				if data.arma == "PUMPSHOTGUN_MK2" then
					arma = "Remington .870"
				elseif data.arma == "SMG" then
					arma = "HK MP5"
				elseif data.arma == "CARBINERIFLE_MK2" then
					arma = "HK M416"
				end

			GiveWeaponToPed(ped,GetHashKey("WEAPON_"..data.arma),250,false,true)	
			TriggerEvent("Notify","Você se equipou com "..arma..".","Bom patrulhamento","Azul")
		end

	else
		TriggerEvent("Notify","Você não é faz parte do Departamento.","Acesso Negado","Vermelho")
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- NUICALLBACK DO JS - FECHAR A NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('fechar',function()
	SetDisplay(false)
end)


function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
