execute if score #t cs.v matches 1690 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Приходи завтра. Я открою дверь.","color":"white"}]
execute if score #t cs.v matches 1703 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 1704 run scoreboard players set #ax cs.v 700
execute if score #t cs.v matches 1704 run scoreboard players set #ay cs.v 1900
execute if score #t cs.v matches 1704 run scoreboard players set #az cs.v 7800
execute if score #t cs.v matches 1704 run scoreboard players set #aw cs.v 17487
execute if score #t cs.v matches 1704 run scoreboard players set #ap cs.v 402
execute if score #t cs.v matches 1704 run scoreboard players set #bx cs.v 70
execute if score #t cs.v matches 1704 run scoreboard players set #by cs.v 1900
execute if score #t cs.v matches 1704 run scoreboard players set #bz cs.v 7530
execute if score #t cs.v matches 1704 run scoreboard players set #bw cs.v 17947
execute if score #t cs.v matches 1704 run scoreboard players set #bp cs.v 418
execute if score #t cs.v matches 1704 run scoreboard players set #cn cs.v 180
execute if score #t cs.v matches 1704 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 1704 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 1705 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 10
execute if score #t cs.v matches 1718 run execute as @e[type=block_display,tag=cs.door] run data merge entity @s {block_state:{Properties:{open:"true"}}}
execute if score #t cs.v matches 1718 run playsound minecraft:block.wooden_door.open master @a[tag=cs.viewer] ~0 ~1 ~0 3 0.8
execute if score #t cs.v matches 1718 run particle minecraft:end_rod ~0 ~1 ~0 0.1 0.8 0.4 0.02 20 force @a[tag=cs.viewer]
