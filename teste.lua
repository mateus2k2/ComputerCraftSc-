-- local controller = peripheral.wrap("sophisticatedstorage:controller_0")
local controller = peripheral.wrap("minecraft:barrel_1")
local blockReader = peripheral.wrap("blockReader_3")
local dataChest = peripheral.wrap("minecraft:barrel_0")

local itenList = controller.list()
local numberOfSlots = #itenList

local file = fs.open("output.txt", "w")

for slot, item in pairs(controller.list()) do
  print(tostring(slot) .. " | " .. tostring(numberOfSlots))

  controller.pushItems(peripheral.getName(dataChest), slot, 1, 1)

  data = blockReader.getBlockData()
  file.write(textutils.serialise(dataChest.getItemDetail(1)) .. "\n")
  -- file.write(textutils.serialise(item) .. "\n")
  -- file.write(textutils.serialise(data) .. "\n")

  dataChest.pushItems(peripheral.getName(controller), 1)
  
  break
  -- print(("%d x %s in slot %d"):format(item.count, item.name, slot))
end