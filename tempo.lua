print("Running")

local interface1 = peripheral.wrap("refinedstorage:interface_0")
local interface2 = peripheral.wrap("refinedstorage:interface_1")
local interface3 = peripheral.wrap("refinedstorage:interface_2")

local crafter3 = peripheral.wrap("rftoolsutility:crafter3_1")

local enviroment = peripheral.wrap("environmentDetector_0")

-- Interface 1
local black_dye = 15
local bone = 16
local white_bed = 17
local ghast_tear = 18
local yellow_dye = 10
local wheat = 11
local torch = 12
local oak_sapling = 13
local rotten_flesh = 14

-- interface 2
local potato = 15
local wheat = 16
local beetroot = 17
local carrot = 18
local gunpowder = 10
local diamond = 11
local cactus = 12
local dead_bush = 13
local sand = 14

-- crafter 
local book_of_binding_bound_djinni = 37
local book_of_binding_bound_afrit = 38

-- router
local routerSlot = 1

-- bow
local bowSlot = 1

----------------------------------------------------------------------------
-- Ritual 1
----------------------------------------------------------------------------

local bow1Ritual1 = peripheral.wrap("occultism:sacrificial_bowl_0")
local bow2Ritual1 = peripheral.wrap("occultism:sacrificial_bowl_1")
local bow3Ritual1 = peripheral.wrap("occultism:sacrificial_bowl_2")
local bow4Ritual1 = peripheral.wrap("occultism:sacrificial_bowl_3")

local routerRitual1 = peripheral.wrap("modularrouters:modular_router_0")
local integratorRitual1 = peripheral.wrap("redstoneIntegrator_7")


local function clearWether()
    interface2.pushItems(peripheral.getName(bow1Ritual1), beetroot, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow2Ritual1), wheat, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow3Ritual1), potato, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow4Ritual1), carrot, bowSlot, 1)

    crafter3.pushItems(peripheral.getName(routerRitual1), book_of_binding_bound_djinni, routerSlot, 1)

    integratorRitual1.setOutput("east", true) 
    os.sleep(0.5)
    integratorRitual1.setOutput("east", false) 
end

local function makeDay()
    interface1.pushItems(peripheral.getName(bow1Ritual1), oak_sapling, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow2Ritual1), wheat, bowSlot, 1)
    interface1.pushItems(peripheral.getName(bow3Ritual1), torch, bowSlot, 1)
    interface1.pushItems(peripheral.getName(bow4Ritual1), yellow_dye, bowSlot, 1)

    crafter3.pushItems(peripheral.getName(routerRitual1), book_of_binding_bound_djinni, routerSlot, 1)

    integratorRitual1.setOutput("east", true) 
    os.sleep(0.5)
    integratorRitual1.setOutput("east", false) 
end

local function makeNigth()
    interface1.pushItems(peripheral.getName(bow1Ritual1), white_bed, bowSlot, 1)
    interface1.pushItems(peripheral.getName(bow2Ritual1), rotten_flesh, bowSlot, 1)
    interface1.pushItems(peripheral.getName(bow3Ritual1), bone, bowSlot, 1)
    interface1.pushItems(peripheral.getName(bow4Ritual1), black_dye, bowSlot, 1)

    crafter3.pushItems(peripheral.getName(routerRitual1), book_of_binding_bound_djinni, routerSlot, 1)

    integratorRitual1.setOutput("east", true) 
    os.sleep(0.5)
    integratorRitual1.setOutput("east", false) 
end

----------------------------------------------------------------------------
-- Ritual 2
----------------------------------------------------------------------------

local bow1Ritual2 = peripheral.wrap("occultism:sacrificial_bowl_4")
local bow2Ritual2 = peripheral.wrap("occultism:sacrificial_bowl_5")
local bow3Ritual2 = peripheral.wrap("occultism:sacrificial_bowl_6")
local bow4Ritual2 = peripheral.wrap("occultism:sacrificial_bowl_7")

local routerRitual2 = peripheral.wrap("modularrouters:modular_router_1")
local integratorRitual2 = peripheral.wrap("redstoneIntegrator_8")

local spawCawRitual2 = peripheral.wrap("redstoneIntegrator_9")


local function makeThunder()
    interface1.pushItems(peripheral.getName(bow1Ritual2), bone, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow2Ritual2), gunpowder, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow3Ritual2), gunpowder, bowSlot, 1)
    interface1.pushItems(peripheral.getName(bow4Ritual2), ghast_tear, bowSlot, 1)

    crafter3.pushItems(peripheral.getName(routerRitual2), book_of_binding_bound_afrit, routerSlot, 1)

    integratorRitual2.setOutput("west", true) 
    os.sleep(0.5)
    integratorRitual2.setOutput("west", false)  

    spawCawRitual2.setOutput("west", true) 
    os.sleep(0.5)
    spawCawRitual2.setOutput("west", false) 
end

local function makeRain()
    interface2.pushItems(peripheral.getName(bow1Ritual2), diamond, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow2Ritual2), dead_bush, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow3Ritual2), sand, bowSlot, 1)
    interface2.pushItems(peripheral.getName(bow4Ritual2), cactus, bowSlot, 1)

    crafter3.pushItems(peripheral.getName(routerRitual2), book_of_binding_bound_afrit, routerSlot, 1)

    integratorRitual2.setOutput("west", true) 
    os.sleep(0.5)
    integratorRitual2.setOutput("west", false) 

    spawCawRitual2.setOutput("west", true) 
    os.sleep(5)
    spawCawRitual2.setOutput("west", false) 
end

local function mainLoop()
    while true do 
    
        if enviroment.isThunder() or enviroment.isRaining() then
            clearWether()
        end
    
        if enviroment.getTime() > 36000 then
            makeDay()
        end
    
        os.sleep(60)
    
    end
end

mainLoop()
