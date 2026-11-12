execute if score #t cs.v matches 680 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Триста лет?","color":"white"}]
execute if score #t cs.v matches 680 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.548
execute if score #t cs.v matches 682 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ 0
execute if score #t cs.v matches 700 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Триста лет?","color":"white"}]
execute if score #t cs.v matches 717 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 718 run scoreboard players set #ax cs.v 200
execute if score #t cs.v matches 718 run scoreboard players set #ay cs.v 1800
execute if score #t cs.v matches 718 run scoreboard players set #az cs.v 2000
execute if score #t cs.v matches 718 run scoreboard players set #aw cs.v -13101
execute if score #t cs.v matches 718 run scoreboard players set #ap cs.v 375
execute if score #t cs.v matches 718 run scoreboard players set #bx cs.v 438
execute if score #t cs.v matches 718 run scoreboard players set #by cs.v 1800
execute if score #t cs.v matches 718 run scoreboard players set #bz cs.v 1810
execute if score #t cs.v matches 718 run scoreboard players set #bw cs.v -13127
execute if score #t cs.v matches 718 run scoreboard players set #bp cs.v 417
execute if score #t cs.v matches 718 run scoreboard players set #cn cs.v 95
execute if score #t cs.v matches 718 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 718 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 718 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:entity.zombie.ambient master @s ~ ~ ~ 0.9 1
execute if score #t cs.v matches 719 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 10
execute if score #t cs.v matches 719 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Т","color":"white"}]
