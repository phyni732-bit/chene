execute if score #t cs.v matches 659 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хотел спросить, как у тебя дела.","color":"white"}]
execute if score #t cs.v matches 665 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 666 run scoreboard players set #ax cs.v -200
execute if score #t cs.v matches 666 run scoreboard players set #ay cs.v 1750
execute if score #t cs.v matches 666 run scoreboard players set #az cs.v 2000
execute if score #t cs.v matches 666 run scoreboard players set #aw cs.v 13101
execute if score #t cs.v matches 666 run scoreboard players set #ap cs.v 469
execute if score #t cs.v matches 666 run scoreboard players set #bx cs.v -395
execute if score #t cs.v matches 666 run scoreboard players set #by cs.v 1750
execute if score #t cs.v matches 666 run scoreboard players set #bz cs.v 1844
execute if score #t cs.v matches 666 run scoreboard players set #bw cs.v 13122
execute if score #t cs.v matches 666 run scoreboard players set #bp cs.v 510
execute if score #t cs.v matches 666 run scoreboard players set #cn cs.v 78
execute if score #t cs.v matches 666 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 666 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 666 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:entity.villager.ambient master @s ~ ~ ~ 0.9 1
execute if score #t cs.v matches 667 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 10
execute if score #t cs.v matches 667 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":".","color":"white"}]
execute if score #t cs.v matches 668 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"..","color":"white"}]
execute if score #t cs.v matches 668 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.479
execute if score #t cs.v matches 669 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...","color":"white"}]
execute if score #t cs.v matches 670 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Т","color":"white"}]
execute if score #t cs.v matches 670 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.505
execute if score #t cs.v matches 671 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Тр","color":"white"}]
execute if score #t cs.v matches 672 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Три","color":"white"}]
execute if score #t cs.v matches 672 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.54
execute if score #t cs.v matches 672 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ 7
execute if score #t cs.v matches 673 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Трис","color":"white"}]
execute if score #t cs.v matches 674 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Трист","color":"white"}]
execute if score #t cs.v matches 674 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.447
execute if score #t cs.v matches 675 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Триста","color":"white"}]
execute if score #t cs.v matches 677 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Триста л","color":"white"}]
execute if score #t cs.v matches 678 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Триста ле","color":"white"}]
execute if score #t cs.v matches 678 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.529
execute if score #t cs.v matches 678 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ -3
execute if score #t cs.v matches 679 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"...Триста лет","color":"white"}]
