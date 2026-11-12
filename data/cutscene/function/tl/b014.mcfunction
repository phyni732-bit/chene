execute if score #t cs.v matches 563 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"И каждую ночь ты стучишь в мою дверь.","color":"white"}]
execute if score #t cs.v matches 570 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 0
execute if score #t cs.v matches 571 run scoreboard players set #ax cs.v -4100
execute if score #t cs.v matches 571 run scoreboard players set #ay cs.v 2000
execute if score #t cs.v matches 571 run scoreboard players set #az cs.v 2300
execute if score #t cs.v matches 571 run scoreboard players set #aw cs.v -10921
execute if score #t cs.v matches 571 run scoreboard players set #ap cs.v 409
execute if score #t cs.v matches 571 run scoreboard players set #bx cs.v -3918
execute if score #t cs.v matches 571 run scoreboard players set #by cs.v 2000
execute if score #t cs.v matches 571 run scoreboard players set #bz cs.v 2602
execute if score #t cs.v matches 571 run scoreboard players set #bw cs.v -11207
execute if score #t cs.v matches 571 run scoreboard players set #bp cs.v 413
execute if score #t cs.v matches 571 run scoreboard players set #cn cs.v 121
execute if score #t cs.v matches 571 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 571 run scoreboard players set #lin cs.v 1
execute if score #t cs.v matches 571 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:entity.zombie.ambient master @s ~ ~ ~ 0.9 1
execute if score #t cs.v matches 572 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 10
execute if score #t cs.v matches 572 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я","color":"white"}]
execute if score #t cs.v matches 574 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я н","color":"white"}]
execute if score #t cs.v matches 575 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не","color":"white"}]
execute if score #t cs.v matches 575 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.597
execute if score #t cs.v matches 577 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не л","color":"white"}]
execute if score #t cs.v matches 577 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.652
execute if score #t cs.v matches 577 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ ~ 7
execute if score #t cs.v matches 578 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ло","color":"white"}]
execute if score #t cs.v matches 579 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не лом","color":"white"}]
execute if score #t cs.v matches 579 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.559
execute if score #t cs.v matches 580 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломи","color":"white"}]
execute if score #t cs.v matches 581 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломил","color":"white"}]
execute if score #t cs.v matches 581 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.606
execute if score #t cs.v matches 582 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломилс","color":"white"}]
execute if score #t cs.v matches 583 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился","color":"white"}]
execute if score #t cs.v matches 583 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.543
execute if score #t cs.v matches 583 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ ~ -3
execute if score #t cs.v matches 584 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился.","color":"white"}]
execute if score #t cs.v matches 586 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я","color":"white"}]
execute if score #t cs.v matches 588 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я х","color":"white"}]
execute if score #t cs.v matches 589 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хо","color":"white"}]
execute if score #t cs.v matches 589 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.636
execute if score #t cs.v matches 589 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ ~ 7
execute if score #t cs.v matches 590 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хот","color":"white"}]
execute if score #t cs.v matches 591 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хоте","color":"white"}]
execute if score #t cs.v matches 591 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.627
execute if score #t cs.v matches 592 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хотел","color":"white"}]
execute if score #t cs.v matches 594 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хотел с","color":"white"}]
execute if score #t cs.v matches 595 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хотел сп","color":"white"}]
execute if score #t cs.v matches 595 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.552
execute if score #t cs.v matches 595 run execute as @e[type=zombie,tag=cs.zombie,limit=1] at @s run tp @s ~ ~ ~ ~ -3
execute if score #t cs.v matches 596 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хотел спр","color":"white"}]
execute if score #t cs.v matches 597 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хотел спро","color":"white"}]
execute if score #t cs.v matches 597 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.63
execute if score #t cs.v matches 598 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хотел спрос","color":"white"}]
execute if score #t cs.v matches 599 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"Я не ломился. Я хотел спроси","color":"white"}]
execute if score #t cs.v matches 599 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 0.3 0.557
