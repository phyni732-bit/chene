execute if score #t cs.v matches 923 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"У меня был дом. Маленький. С окном на закат.","color":"white"}]
execute if score #t cs.v matches 926 run execute if block ~-12 ~1 ~0 minecraft:air run setblock ~-12 ~1 ~0 minecraft:light[level=14]
execute if score #t cs.v matches 926 run playsound minecraft:block.respawn_anchor.charge master @a[tag=cs.viewer] ~-12 ~1 ~0 4 1.4
execute if score #t cs.v matches 926 run particle minecraft:end_rod ~-12 ~1.5 ~0 1.5 1 1.5 0.02 30 force @a[tag=cs.viewer]
execute if score #t cs.v matches 942 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ -90 0
execute if score #t cs.v matches 943 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Житель","color":"gold","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"У меня был дом. Маленький. С окном на закат.","color":"white"}]
