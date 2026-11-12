execute if score #t cs.v matches 779 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Ты ни разу не открыл.","color":"white"}]
execute if score #t cs.v matches 787 run title @a[tag=cs.viewer] actionbar ""
execute if score #t cs.v matches 798 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 799 run scoreboard players set #ax cs.v -3200
execute if score #t cs.v matches 799 run scoreboard players set #ay cs.v 3000
execute if score #t cs.v matches 799 run scoreboard players set #az cs.v 9500
execute if score #t cs.v matches 799 run scoreboard players set #aw cs.v 13719
execute if score #t cs.v matches 799 run scoreboard players set #ap cs.v 661
execute if score #t cs.v matches 799 run scoreboard players set #bx cs.v -4086
execute if score #t cs.v matches 799 run scoreboard players set #by cs.v 3197
execute if score #t cs.v matches 799 run scoreboard players set #bz cs.v 9008
execute if score #t cs.v matches 799 run scoreboard players set #bw cs.v 13870
execute if score #t cs.v matches 799 run scoreboard players set #bp cs.v 806
execute if score #t cs.v matches 799 run scoreboard players set #cn cs.v 197
execute if score #t cs.v matches 799 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 799 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 799 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:entity.villager.ambient master @s ~ ~ ~ 0.9 1
