execute if score #t cs.v matches 361 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ 0
execute if score #t cs.v matches 379 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Хм-м. Ты снова здесь.","color":"white"}]
execute if score #t cs.v matches 392 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 393 run scoreboard players set #ax cs.v 200
execute if score #t cs.v matches 393 run scoreboard players set #ay cs.v 1800
execute if score #t cs.v matches 393 run scoreboard players set #az cs.v 2000
execute if score #t cs.v matches 393 run scoreboard players set #aw cs.v -13101
execute if score #t cs.v matches 393 run scoreboard players set #ap cs.v 375
execute if score #t cs.v matches 393 run scoreboard players set #bx cs.v 498
execute if score #t cs.v matches 393 run scoreboard players set #by cs.v 1800
execute if score #t cs.v matches 393 run scoreboard players set #bz cs.v 1762
execute if score #t cs.v matches 393 run scoreboard players set #bw cs.v -13134
execute if score #t cs.v matches 393 run scoreboard players set #bp cs.v 429
execute if score #t cs.v matches 393 run scoreboard players set #cn cs.v 119
execute if score #t cs.v matches 393 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 393 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 393 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:entity.zombie.ambient master @s ~ ~ ~ 0.9 1
execute if score #t cs.v matches 394 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 10
execute if score #t cs.v matches 394 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я","color":"white"}]
execute if score #t cs.v matches 396 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я в","color":"white"}]
execute if score #t cs.v matches 397 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я вс","color":"white"}]
execute if score #t cs.v matches 397 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.582
execute if score #t cs.v matches 398 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я все","color":"white"}]
execute if score #t cs.v matches 399 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я всег","color":"white"}]
execute if score #t cs.v matches 399 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.657
execute if score #t cs.v matches 399 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ ~ 7
