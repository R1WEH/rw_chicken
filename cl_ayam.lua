ESX  = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

local coordonate = {
    {2387.02, 5033.31, 44.96,"",290.66,-912318012,"a_m_y_business_01"}, --Ped Spawn Ayam
	{346.6, 3406.51, 35.51,"",15.0,1984382277,"u_m_m_bikehire_01"}
}

--=================================--
--=========== QTARGET =============--
--=================================--
local pedspawn = {
    -912318012
}
local ayamnya = {
    1794449327
}
local jualayam = {
	1984382277
}

exports.qtarget:AddTargetModel(ayamnya, {
    options = {
        {
            event = "rw:ngayam",
            icon = "far fas fa-laptop-medical",
            label = "Ambil Ayam",
        },
    },
    job = {"all"},
    distance = 2.5
})

exports.qtarget:AddTargetModel(jualayam, {
    options = {
        {
            event = "rw:jualayam21",
            icon = "far fas fa-laptop-medical",
            label = "Jual Ayam",
        },
    },
    job = {"all"},
    distance = 2.5
})

exports.qtarget:AddTargetModel(pedspawn, {
    options = {
        {
            event = "rw:spawnayam",
            icon = "far fas fa-laptop-medical",
            label = "Spawn Ayam",
        },
    },
    job = {"all"},
    distance = 2.5
})

exports.qtarget:AddBoxZone("rw:ngayam1", vector3(-86.2, 6226.74, 31.09), 5, 5, {
    name="BRANGKAS",
    heading=305,
    debugPoly=false,
	minZ=30.09,
	maxZ=34.09
    }, {
         options = {
            {
                  event = "rw:ngayam1",
                  icon = "far fas fa-archive",
                  label = "Motong Daging Ayam",
            },
         },
         job = {"all"},
         distance = 2.0
     })
--=================================--
--=========== QTARGET =============--
--=================================--

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
    end
end)

--=================================--
--========== Spawn Ayam ===========--
--=================================--

RegisterNetEvent('rw:spawnayamm')
AddEventHandler('rw:spawnayamm', function()
    TriggerEvent("rri-notify:Icon","Kamu Berhasil Spawnin Ayam","top-right",2500,"red-10","white",true,"")
    TriggerEvent('rw:spawnayam')
end)

RegisterNetEvent('rw:spawnayam')
AddEventHandler('rw:spawnayam', function()  
	RequestModel(GetHashKey("a_c_hen"))
	while not HasModelLoaded(GetHashKey("a_c_hen")) do
		Wait(155)
	end

	local ped =  CreatePed(4, GetHashKey("a_c_hen"), 2378.46, 5052.1, 46.44, -149.404, false, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
        while true do
            CreatePed(4, GetHashKey("a_c_hen"), 2378.46, 5052.1, 46.44, true, true)
			CreatePed(4, GetHashKey("a_c_hen"), 2383.61, 5059.62, 46.44, true, true)
			Citizen.Wait(10000)
		end
end)

--=================================--
--========= Action Ayam ===========--
--=================================--

RegisterNetEvent('rw:ngayam')
AddEventHandler('rw:ngayam', function()
	TriggerEvent("mythic_progbar:client:progress", {
		name = "stone_farm",
		duration = 2000,
		label = 'Melupas Kulit Ayam',
		useWhileDead = true,
		canCancel = false,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "random@domestic",
			anim = "pickup_low",
			flags = 63
		}
	}, function(status)
		if not status then
			-- Do Something If Event Wasn't Cancelled
		end
	end)
	TriggerServerEvent('rw:addAyam')
end)

RegisterNetEvent('rw:ngayam1')
AddEventHandler('rw:ngayam1', function()
	TriggerEvent("mythic_progbar:client:progress", {
		name = "stone_farm",
		duration = 2000,
		label = 'Memotong Daging Ayam',
		useWhileDead = true,
		canCancel = false,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
			anim = "machinic_loop_mechandplayer",
			flags = 63
		}
	}, function(status)
		if not status then
			-- Do Something If Event Wasn't Cancelled
		end
	end)
TriggerServerEvent('rw:addAyamne')
end)

RegisterNetEvent('rw:jualayam')
AddEventHandler('rw:jualayam', function()
	TriggerEvent("mythic_progbar:client:progress", {
		name = "stone_farm",
		duration = 2000,
		label = 'Memotong Daging Ayam',
		useWhileDead = true,
		canCancel = false,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "missfam4",
			anim = "base",
			flags = 63
		},
		prop = {
			model = "p_amb_clipboard_01",
		}
	}, function(status)
		if not status then
			-- Do Something If Event Wasn't Cancelled
		end
	end)
TriggerServerEvent('rw:jualayam1')
end)

RegisterNetEvent('rw:jualayam21')
AddEventHandler('rw:jualayam21', function()
    lib.registerContext({
        id = 'shop_ayame',
        title = 'Jual Bahan Ayam',
        options = {
            {
				title = 'Bahan Ayam',
				description = 'Jual Bahan Ayam',
				event = 'rw:jualayam',
			}
        }
    })
    lib.showContext('shop_ayame')
end)

--=================================--
--========= Action Ayam ===========--
--=================================--