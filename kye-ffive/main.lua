
--need to change this if i end up using esx-legacy
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--menu keybind and command
RegisterKeyMapping('menuf5', 'F5', 'keyboard', 'f5')
RegisterCommand('menuf5', function()
   lib.showMenu('main_menuff')
end)
TriggerEvent('chat:removeSuggestion', '/menuf5')
--menu keybind and command


--menu events triggers etc
RegisterCommand("oldclothing", function()  
   ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
   TriggerEvent('changetheplayer:loadSkin', skin)
end)
end)
RegisterCommand("fixhat", function()  
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
  TriggerEvent('changetheplayer:loadSkin', skin)
end)
end)
RegisterCommand("shirt", function()
  TriggerEvent('kye:shirt')
end)
RegisterCommand("hat", function()
   TriggerEvent('kye:hat')
end)
RegisterCommand("pants", function()
   TriggerEvent('kye:pants')
end)
RegisterCommand("shoes", function()
   TriggerEvent('kye:shoes')
end)
RegisterCommand("mask", function()
   TriggerEvent('kye:mask')
end)
RegisterCommand("naked", function()
   TriggerEvent('kye:naked')
end)
RegisterNetEvent('kye:shirt')
AddEventHandler('kye:shirt', function()
  TriggerEvent('changetheplayer:getSkin', function(skin)
      local clothesSkin = {
      ['tshirt_1'] = 15, ['tshirt_2'] = 0,
      ['torso_1'] = 15, ['torso_2'] = 0,
      ['arms'] = 15, ['arms_2'] = 0
      }
      TriggerEvent('changetheplayer:loadClothes', skin, clothesSkin)
  end)
end)
RegisterNetEvent('kye:naked')
AddEventHandler('kye:naked', function()
  TriggerEvent('changetheplayer:getSkin', function(skin)
      local clothesSkin = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 15,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 15,      ['arms2'] = 0,
      ['glasses_1'] = 0,  ['glasses_2'] = 0,
      ['bproof_1'] = 0,   ['bproof_2'] = 0, 
      ['mask_1'] = 0,     ['mask_2'] = 0,
      ['pants_1'] = 14,   ['pants_2'] = 0,
      ['shoes_1'] = 5,   ['shoes_2'] = 0,
      ['helmet_1'] = -1,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['bag_1'] = 0,      ['bag_2'] = 0,
      ['watch_1'] = 0,    ['watch_2'] = 0,
      ['bracelet_1'] = 0, ['bracelet_2'] = 0,
      ['ears_1'] = -1,    ['ears_2'] = 0
      }
      TriggerEvent('changetheplayer:loadClothes', skin, clothesSkin)
  end)
end)
RegisterNetEvent('kye:hat')
AddEventHandler('kye:hat', function()
  TriggerEvent('changetheplayer:getSkin', function(skin)
      local clothesSkin = {
      ['helmet_1'] = -1, ['helmet_2'] = 0
      }
      TriggerEvent('changetheplayer:loadClothes', skin, clothesSkin)
  end)
end)
RegisterNetEvent('kye:pants')
AddEventHandler('kye:pants', function()
  TriggerEvent('changetheplayer:getSkin', function(skin)
      local clothesSkin = {
      ['pants_1'] = 23, ['pants_2'] = 0
      }
      TriggerEvent('changetheplayer:loadClothes', skin, clothesSkin)
  end)
end)
RegisterNetEvent('kye:mask')
AddEventHandler('kye:mask', function()
  TriggerEvent('changetheplayer:getSkin', function(skin)
      local clothesSkin = {
      ['mask_1'] = 0, ['mask_2'] = 0
      }
      TriggerEvent('changetheplayer:loadClothes', skin, clothesSkin)
  end)
end)
RegisterNetEvent('kye:shoes')
AddEventHandler('kye:shoes', function()
  TriggerEvent('changetheplayer:getSkin', function(skin)
      local clothesSkin = {
      ['shoes_1'] = 64, ['shoes_2'] = 0
      }
      TriggerEvent('changetheplayer:loadClothes', skin, clothesSkin)
  end)
end)





------------------------------------------------------------------start of lib menu-----------------------------------------------------
lib.registerMenu({
    id = 'main_menuff',
    title = 'Welcome, Player',
    subtitle = 'Menace F5 Menu',
    position = 'bottom-right',
    options = {
        {
            label = 'Misc Options',
            args = { submenu = 'menus' },
            icon = 'https://cdn.discordapp.com/attachments/944092742894624789/1112629277188444160/watermark.png',
        },
        {
            label = 'Weather',
            args = { submenu = 'weather' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112944472414748712/png-transparent-weather-forecasting-severe-weather-storm-weather-free-text-heart-logo-thumbnail-removebg-preview.png',
        },
        {
            label = 'time',
            args = { submenu = 'time' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112944458036686971/pngtree-alarm-clock-icon-alarm-clock-that-sounds-loudly-in-the-morning-png-image_5299951-removebg-preview.png',
        },
        {
            label = 'Clothing Commands',
            args = { submenu = 'cc' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112945353096974446/Clothing-PNG-Pic.png',
        },
        {
            label = 'Settings',
            args = { submenu = 'sm' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112944493545656341/settings-icon.png',
        },
        {
            label = 'Close',
            args = { closeMenu = true },
            icon = 'fa-solid fa-angles-left',
        },
    }
}, function(selected, scrollIndex, args)
    if args.submenu then
        lib.showMenu(args.submenu)
    elseif args.closeMenu then
        lib.hideMenu()
    end
end)

-- Create submenus

lib.registerMenu({
    id = 'menus',
    title = 'Misc Options',
    position = 'bottom-right',
    options = {
        {
            label = 'Gang Turf Leader Board',
            args = { command = 'lb' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112942043921125386/5035447-middle-removebg-preview.png',
            close = false
        },
        {
            label = 'Crosshair Menu',
            args = { command = 'crosshair' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112944284690301028/images-removebg-preview.png',
            close = false
        },
        --[[
        {
            label = 'Holsters & Aim',
            args = { command = 'wam' },
        },
        --]]
        {
            label = 'Back',
            icon = 'fa-solid fa-angles-left',
            args = { submenu = 'main_menuff' },
        },
    }
}, function(selected, scrollIndex, args)
    if args.command then
        ExecuteCommand(args.command)
    elseif args.submenu then
        lib.showMenu(args.submenu)
    end
end)

lib.registerMenu({
    id = 'weather',
    title = 'Client Sided Weather',
    position = 'bottom-right',
    options = {
        {label = 'Clear', args = { weather = "CLEAR" }, close = false},
        {label = 'Overcast', args = { weather = "OVERCAST" }, close = false},
        {label = 'Cloudy', args = { weather = "CLOUDY" }, close = false},
        {label = 'Extrasunny', args = { weather = "EXTRASUNNY" }, close = false},
        {label = 'Smog', args = { weather = "SMOG" }, close = false},
        {label = 'Clearing', args = { weather = "CLEARING" }, close = false},
        {label = 'Rain', args = { weather = "RAIN" }, close = false},
        {label = 'Thunder', args = { weather = "THUNDER" }, close = false},
        {label = 'Snow', args = { weather = "SNOW" }, close = false},
        {label = 'Blizzard', args = { weather = "BLIZZARD" }, close = false},
        {label = 'Xmas', args = { weather = "XMAS" }, close = false},
        {label = 'Halloween', args = { weather = "HALLOWEEN" }, close = false},
        {
            label = 'Back',
            args = { backmenu = 'main_menuff'},
            icon = 'fa-solid fa-angles-left',
        },
    }
}, function(selected, scrollIndex, args)
    if args.weather then
        ClearWeatherTypePersist()
        SetWeatherTypePersist(args.weather)
        SetWeatherTypeNow(args.weather)
        SetWeatherTypeNowPersist(args.weather)
    elseif args.backmenu then
        lib.showMenu(args.backmenu)
    end
end)

lib.registerMenu({
    id = 'time',
    title = 'Client Side Time',
    position = 'bottom-right',
    options = {
        {label = 'Morning', icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112937058261020802/image_processing20210301-32078-1t1hmc2.png', args = { time = {hour = 9, minute = 9, second = 9} }, close = false},
        {label = 'Noon', icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112942172103266344/9-90644_sunshine-clipart-noon-sun-cartoon-sun-with-black-background-removebg-preview.png', args = { time = {hour = 12, minute = 12, second = 12} }, close = false},
        {label = 'Evening', icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112942247000932443/png-clipart-graphics-evening-illustration-morning-games-night-morning-afternoon-evening-times-evening-morning-removebg-preview.png', args = { time = {hour = 18, minute = 18, second = 18} }, close = false},
        {label = 'Night', icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112937600165085195/1809597.png', args = { time = {hour = 23, minute = 23, second = 23} }, close = false},
        {
            label = 'Back',
            args = { backmenu = 'main_menuff'},
            icon = 'fa-solid fa-angles-left',
        },
    }
}, function(selected, scrollIndex, args)
    if args.time then
        local time = args.time
        NetworkOverrideClockTime(time.hour, time.minute, time.second)
    elseif args.backmenu then
        lib.showMenu(args.backmenu)
    end
end)

lib.registerMenu({
    id = 'cc',
    title = 'Clothing Commands',
    position = 'bottom-right',
    options = {
        {
            label = 'Remove Hat',
            args = { event = 'kye:hat' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112942283415887923/pngtree-blue-baseball-cap-cap-image_1468417-removebg-preview.png',
            close = false,
        },
        {
            label = 'Remove Mask',
            args = { event = 'kye:mask' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112939689142403132/maskpng.parspng.com-11.png',
            close = false,
        },
        {
            label = 'Remove Shirt',
            args = { event = 'kye:shirt' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112942378043576360/90-906412_larger-clipart-t-shirt-blue-green-t-shirt-plain-removebg-preview.png',
            close = false,
        },
        {
            label = 'Remove Pants',
            args = { event = 'kye:pants' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112942356430336061/pants-clipart-2018-6-removebg-preview.png',
            close = false,
        },
        {
            label = 'Remove Shoes',
            args = { event = 'kye:shoes' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112942413695176865/png-clipart-nike-air-max-sneakers-nike-air-force-1-mid-07-mens-shoe-nike-white-outdoor-shoe-removebg-preview.png',
            close = false,
        },
        {
            label = 'Fully Naked',
            args = { event = 'kye:naked' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112939688521629696/naked_donald_duck_by_porygon2z_df1b4jg-pre.png',
            close = false,
        },
        {
            label = 'Old Clothing',
            args = { command = 'oldclothing' },
            icon = 'https://cdn.discordapp.com/attachments/1112935945822547989/1112942395244433408/png-transparent-boy-dressing-sweater-glasses-wear-shirt-child-outfit-slip-top-removebg-preview.png',
            close = false,
        },
        {
            label = 'Back',
            icon = 'fa-solid fa-angles-left',
            args = { submenu = 'main_menuff' },
        },
    }
}, function(selected, scrollIndex, args)
    if args.event then
        TriggerEvent(args.event)
    elseif args.command then
        ExecuteCommand(args.command)
    elseif args.submenu then
        lib.showMenu(args.submenu)
    end
end)

lib.registerMenu({
    id = 'sm',
    title = 'Settings Menu',
    position = 'bottom-right',
    onCheck = function(selected, checked, args)
        if args.command then
            ExecuteCommand(args.command)
        elseif checked == true then
            DisplayRadar(false)
        else
            DisplayRadar(true)
        end
    end,
    options = {
        {
            label = 'Change Weapon Wheel Color',
            args = { submenu = 'wheelcolors' },
        },
        {
            label = 'Change Waypoint Color',
            args = { submenu = 'waypointcolor' },
        },
        {
            label = 'Toggle Mini Map',
            checked = false,
            args = { map = 'minimap' },
            close = false,
        },
        {
            label = 'Toggle Music',
            checked = false,
            args = { command = 'streamermode' },
            close = false, 
        },
        {
            label = 'Toggle Chat',
            checked = false,
            args = { command = 'togglechat' },
            close = false
        },
        {
            label = 'Toggle Player IDS',
            checked = false,
            args = { command = 'ids' },
            close = false
        },
        {
            label = 'Clear Chat',
            args = { command = 'clear' },
            close = false
        },
        {
            label = 'Back',
            icon = 'fa-solid fa-angles-left',
            args = { submenu = 'main_menuff' },
        },
    }
}, function(selected, scrollIndex, args)
    if args.submenu then
        lib.showMenu(args.submenu)
    elseif args.command then
        ExecuteCommand(args.command)
    elseif args.map then
        local minimap = not minimap
        if minimap then
            DisplayRadar(false)
        else
            DisplayRadar(true)
        end
    end
end)

lib.registerMenu({
    id = 'waypointcolor',
    title = 'WayPoint Colors',
    position = 'bottom-right',
    options = {
        {label = 'Red Waypoint', args = { color = {142, 255, 0, 0, 255} }, close = false},
        {label = 'Green Waypoint', args = { color = {142, 0, 255, 0, 255} }, close = false},
        {label = 'Blue Waypoint', args = { color = {142, 0, 0, 255, 255} }, close = false},
        {label = 'Yellow Waypoint', args = { color = {142, 255, 255, 0, 255} }, close = false},
        {label = 'Orange Waypoint', args = { color = {142, 255, 127, 80, 255} }, close = false},
        {label = 'Pink Waypoint', args = { color = {142, 255, 105, 180, 255} }, close = false},
        {label = 'Purple Waypoint', args = { color = {142, 75, 0, 130, 255} }, close = false},
        {label = 'White Waypoint', args = { color = {142, 255, 255, 255, 255} }, close = false},
        {label = 'Black Waypoint', args = { color = {142, 0, 0, 0, 255} }, close = false},
        {label = 'Grey Waypoint', args = { color = {142, 128, 128, 128, 255} }, close = false},
        {label = 'Brown Waypoint', args = { color = {142, 101, 67, 33, 255} }, close = false},
        {label = 'Light Blue Waypoint', args = { color = {142, 0, 255, 255, 255} }, close = false},
        {
            label = 'Back',
            args = { backmenu = 'main_menuff'},
            icon = 'fa-solid fa-angles-left',
        },
    }
}, function(selected, scrollIndex, args)
    if args.color then
        local color = args.color
        ReplaceHudColourWithRgba(color[1], color[2], color[3], color[4], color[5])
    elseif args.backmenu then
        lib.showMenu(args.backmenu)
    end
end)

lib.registerMenu({
    id = 'wheelcolors',
    title = 'Wheel Colors',
    position = 'bottom-right',
    options = {
        {label = 'Red Weapon Wheel', args = { color = {116, 255, 0, 0, 255} }, close = false},
        {label = 'Green Weapon Wheel', args = { color = {116, 0, 255, 0, 255} }, close = false},
        {label = 'Blue Weapon Wheel', args = { color = {116, 0, 0, 255, 255} }, close = false},
        {label = 'Yellow Weapon Wheel', args = { color = {116, 255, 255, 0, 255} }, close = false},
        {label = 'Orange Weapon Wheel', args = { color = {116, 255, 127, 80, 255} }, close = false},
        {label = 'Pink Weapon Wheel', args = { color = {116, 255, 105, 180, 255} }, close = false},
        {label = 'Purple Weapon Wheel', args = { color = {116, 75, 0, 130, 255} }, close = false},
        {label = 'White Weapon Wheel', args = { color = {116, 255, 255, 255, 255} }, close = false},
        {label = 'Black Weapon Wheel', args = { color = {116, 0, 0, 0, 255} }, close = false},
        {label = 'Grey Weapon Wheel', args = { color = {116, 128, 128, 128, 255} }, close = false},
        {label = 'Brown Weapon Wheel', args = { color = {116, 101, 67, 33, 255} }, close = false},
        {label = 'Light Blue Weapon Wheel', args = { color = {116, 0, 255, 255, 255} }, close = false},
        {
            label = 'Back',
            args = { backmenu = 'main_menuff'},
            icon = 'fa-solid fa-angles-left',
        },
    }
}, function(selected, scrollIndex, args)
    if args.color then
        local color = args.color
        ReplaceHudColourWithRgba(color[1], color[2], color[3], color[4], color[5])
    elseif args.backmenu then
        lib.showMenu(args.backmenu)
    end
end)

