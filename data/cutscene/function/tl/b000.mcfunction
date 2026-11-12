execute if score #t cs.v matches 1 run scoreboard players set #ax cs.v 6000
execute if score #t cs.v matches 1 run scoreboard players set #ay cs.v -55000
execute if score #t cs.v matches 1 run scoreboard players set #az cs.v 16000
execute if score #t cs.v matches 1 run scoreboard players set #aw cs.v 11271
execute if score #t cs.v matches 1 run scoreboard players set #ap cs.v 184
execute if score #t cs.v matches 1 run scoreboard players set #bx cs.v 7000
execute if score #t cs.v matches 1 run scoreboard players set #by cs.v 3500
execute if score #t cs.v matches 1 run scoreboard players set #bz cs.v 15000
execute if score #t cs.v matches 1 run scoreboard players set #bw cs.v 15498
execute if score #t cs.v matches 1 run scoreboard players set #bp cs.v 1027
execute if score #t cs.v matches 1 run scoreboard players set #cn cs.v 190
execute if score #t cs.v matches 1 run scoreboard players set #ct cs.v 0
execute if score #t cs.v matches 1 run scoreboard players set #lin cs.v 0
execute if score #t cs.v matches 2 run playsound minecraft:music_disc.mall record @a[tag=cs.viewer] ~0 ~0 ~0 9 1
execute if score #t cs.v matches 6 run data modify entity @e[type=item_display,tag=cs.cam,limit=1] teleport_duration set value 10
execute if score #t cs.v matches 34 run title @a[tag=cs.viewer] times 25 70 30
execute if score #t cs.v matches 34 run title @a[tag=cs.viewer] subtitle {"text":"разговор над облаками","color":"gray","italic":true}
execute if score #t cs.v matches 34 run title @a[tag=cs.viewer] title {"text":"ДВЕРЬ","color":"gold","bold":true}
