execute if score #t cs.v matches 1600 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Зато мы построили её вмест","color":"white"}]
execute if score #t cs.v matches 1600 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.548
execute if score #t cs.v matches 1601 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Зато мы построили её вместе","color":"white"}]
execute if score #t cs.v matches 1602 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Зато мы построили её вместе.","color":"white"}]
execute if score #t cs.v matches 1602 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.628
execute if score #t cs.v matches 1604 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ ~ 0
execute if score #t cs.v matches 1622 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Зато мы построили её вместе.","color":"white"}]
execute if score #t cs.v matches 1635 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 1636 run scoreboard players set #ax cs.v -200
execute if score #t cs.v matches 1636 run scoreboard players set #ay cs.v 1750
execute if score #t cs.v matches 1636 run scoreboard players set #az cs.v 2000
execute if score #t cs.v matches 1636 run scoreboard players set #aw cs.v 13101
execute if score #t cs.v matches 1636 run scoreboard players set #ap cs.v 469
execute if score #t cs.v matches 1636 run scoreboard players set #bx cs.v -435
execute if score #t cs.v matches 1636 run scoreboard players set #by cs.v 1750
execute if score #t cs.v matches 1636 run scoreboard players set #bz cs.v 1812
execute if score #t cs.v matches 1636 run scoreboard players set #bw cs.v 13127
execute if score #t cs.v matches 1636 run scoreboard players set #bp cs.v 520
execute if score #t cs.v matches 1636 run scoreboard players set #cn cs.v 94
execute if score #t cs.v matches 1636 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 1636 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 1636 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:entity.villager.yes master @s ~ ~ ~ 0.9 1
execute if score #t cs.v matches 1637 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 10
execute if score #t cs.v matches 1637 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":".","color":"white"}]
execute if score #t cs.v matches 1638 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"..","color":"white"}]
execute if score #t cs.v matches 1638 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.47
execute if score #t cs.v matches 1639 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...","color":"white"}]
