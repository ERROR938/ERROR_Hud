local hunger, thirst = nil, nil
local effectScreen = false

AddEventHandler('esx_status:onTick', function(data)
  local healthh = math.floor((GetEntityHealth(PlayerPedId()) - 100))
  if Config.displayEffect then
    if healthh < Config.percentScreenEffect then
      if not effectScreen then
        StartScreenEffect(Config.screenFX, 3000, true)
        effectScreen = true
      end
    else
      if effectScreen then
        StopScreenEffect(Config.screenFX)
        effectScreen = false
      end
    end
  end
  local hunger, thirst
  for i = 1, #data do
    if data[i].name == 'thirst' then thirst = math.floor(data[i].percent) end
    if data[i].name == 'hunger' then hunger = math.floor(data[i].percent) end
  end
  SendNUIMessage({
    showui = true,
    health = healthh,
    hunger = hunger,
    thirst = thirst,
    armour = GetPedArmour(PlayerPedId())
  })
end)