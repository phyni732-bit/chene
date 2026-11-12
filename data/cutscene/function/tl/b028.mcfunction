execute if score #t cs.v matches 1121 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ 90 0
execute if score #t cs.v matches 1124 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"А у меня была колокольня. Я звонил в неё, когда ещё был живым.","color":"white"}]
execute if score #t cs.v matches 1129 run playsound minecraft:block.bell.use master @a[tag=cs.viewer] ~0 ~6 ~-11 5 0.67
execute if score #t cs.v matches 1134 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 1135 run scoreboard players set #ax cs.v 4100
execute if score #t cs.v matches 1135 run scoreboard players set #ay cs.v 2100
execute if score #t cs.v matches 1135 run scoreboard players set #az cs.v 2300
execute if score #t cs.v matches 1135 run scoreboard players set #aw cs.v 10921
execute if score #t cs.v matches 1135 run scoreboard players set #ap cs.v 572
execute if score #t cs.v matches 1135 run scoreboard players set #bx cs.v 3956
execute if score #t cs.v matches 1135 run scoreboard players set #by cs.v 2100
execute if score #t cs.v matches 1135 run scoreboard players set #bz cs.v 2540
execute if score #t cs.v matches 1135 run scoreboard players set #bw cs.v 11148
execute if score #t cs.v matches 1135 run scoreboard players set #bp cs.v 576
execute if score #t cs.v matches 1135 run scoreboard players set #cn cs.v 96
execute if score #t cs.v matches 1135 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 1135 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 1135 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:entity.villager.ambient master @s ~ ~ ~ 0.9 1
execute if score #t cs.v matches 1136 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 10
execute if score #t cs.v matches 1136 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"П","color":"white"}]
execute if score #t cs.v matches 1137 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"По","color":"white"}]
execute if score #t cs.v matches 1137 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.544
execute if score #t cs.v matches 1138 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Поч","color":"white"}]
execute if score #t cs.v matches 1139 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Поче","color":"white"}]
execute if score #t cs.v matches 1139 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.52
execute if score #t cs.v matches 1140 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почем","color":"white"}]
execute if score #t cs.v matches 1141 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему","color":"white"}]
execute if score #t cs.v matches 1141 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.474
execute if score #t cs.v matches 1141 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ 7
execute if score #t cs.v matches 1143 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему ж","color":"white"}]
execute if score #t cs.v matches 1143 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.469
execute if score #t cs.v matches 1144 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же","color":"white"}]
execute if score #t cs.v matches 1146 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же м","color":"white"}]
execute if score #t cs.v matches 1147 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы","color":"white"}]
execute if score #t cs.v matches 1147 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.475
execute if score #t cs.v matches 1147 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ -3
execute if score #t cs.v matches 1149 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы н","color":"white"}]
execute if score #t cs.v matches 1149 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.495
execute if score #t cs.v matches 1150 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы ни","color":"white"}]
execute if score #t cs.v matches 1152 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы ни р","color":"white"}]
execute if score #t cs.v matches 1153 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы ни ра","color":"white"}]
execute if score #t cs.v matches 1153 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.459
execute if score #t cs.v matches 1153 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ 7
execute if score #t cs.v matches 1154 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы ни раз","color":"white"}]
execute if score #t cs.v matches 1155 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы ни разу","color":"white"}]
execute if score #t cs.v matches 1155 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.493
execute if score #t cs.v matches 1157 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы ни разу н","color":"white"}]
execute if score #t cs.v matches 1157 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.472
execute if score #t cs.v matches 1158 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Почему же мы ни разу не","color":"white"}]
