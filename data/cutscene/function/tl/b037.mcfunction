execute if score #t cs.v matches 1492 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Лестницу. До самой луны.","color":"white"}]
execute if score #t cs.v matches 1510 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ 90 0
execute if score #t cs.v matches 1510 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ -90 0
execute if score #t cs.v matches 1512 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Лестницу. До самой луны.","color":"white"}]
execute if score #t cs.v matches 1519 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
