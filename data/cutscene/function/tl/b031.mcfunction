execute if score #t cs.v matches 1240 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Между нами всегда была дверь. И ноч","color":"white"}]
execute if score #t cs.v matches 1241 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Между нами всегда была дверь. И ночь","color":"white"}]
execute if score #t cs.v matches 1241 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.543
execute if score #t cs.v matches 1241 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ ~ -3
execute if score #t cs.v matches 1242 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Между нами всегда была дверь. И ночь.","color":"white"}]
execute if score #t cs.v matches 1244 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ ~ 0
execute if score #t cs.v matches 1262 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Между нами всегда была дверь. И ночь.","color":"white"}]
execute if score #t cs.v matches 1278 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 1279 run scoreboard players set #ax cs.v -200
execute if score #t cs.v matches 1279 run scoreboard players set #ay cs.v 1750
execute if score #t cs.v matches 1279 run scoreboard players set #az cs.v 2000
execute if score #t cs.v matches 1279 run scoreboard players set #aw cs.v 13101
execute if score #t cs.v matches 1279 run scoreboard players set #ap cs.v 469
execute if score #t cs.v matches 1279 run scoreboard players set #bx cs.v -488
execute if score #t cs.v matches 1279 run scoreboard players set #by cs.v 1750
execute if score #t cs.v matches 1279 run scoreboard players set #bz cs.v 1770
execute if score #t cs.v matches 1279 run scoreboard players set #bw cs.v 13133
execute if score #t cs.v matches 1279 run scoreboard players set #bp cs.v 533
execute if score #t cs.v matches 1279 run scoreboard players set #cn cs.v 115
execute if score #t cs.v matches 1279 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 1279 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 1279 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:entity.villager.ambient master @s ~ ~ ~ 0.9 1
