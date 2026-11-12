execute if score #t cs.v matches 520 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"И каждую ночь ты стучишь в мою две","color":"white"}]
execute if score #t cs.v matches 520 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.513
execute if score #t cs.v matches 521 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"И каждую ночь ты стучишь в мою двер","color":"white"}]
execute if score #t cs.v matches 522 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"И каждую ночь ты стучишь в мою дверь","color":"white"}]
execute if score #t cs.v matches 522 run execute as @a[tag=cs.viewer] at @s run playsound minecraft:block.wooden_button.click_on master @s ~ ~ ~ 0.3 1.512
execute if score #t cs.v matches 522 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ -3
execute if score #t cs.v matches 523 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"И каждую ночь ты стучишь в мою дверь.","color":"white"}]
execute if score #t cs.v matches 524 run playsound minecraft:block.wood.place master @a[tag=cs.viewer] ~0 ~1 ~0 3 0.7
execute if score #t cs.v matches 524 run particle minecraft:cloud ~0 ~0.1 ~0 0.2 0.05 0.4 0.02 12 force @a[tag=cs.viewer]
execute if score #t cs.v matches 525 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ ~ 0
execute if score #t cs.v matches 541 run playsound minecraft:entity.zombie.attack_wooden_door master @a[tag=cs.viewer] ~0 ~1 ~0 2 0.9
execute if score #t cs.v matches 543 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"И каждую ночь ты стучишь в мою дверь.","color":"white"}]
execute if score #t cs.v matches 550 run playsound minecraft:entity.zombie.attack_wooden_door master @a[tag=cs.viewer] ~0 ~1 ~0 2 0.9
execute if score #t cs.v matches 559 run playsound minecraft:entity.zombie.attack_wooden_door master @a[tag=cs.viewer] ~0 ~1 ~0 2 0.9
