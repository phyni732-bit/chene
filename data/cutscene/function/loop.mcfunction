execute unless entity @e[type=marker,tag=cs.origin,limit=1] run return run function cutscene:stop
scoreboard players add #t cs.v 1
execute as @e[type=block_display,tag=cs.grow] run function cutscene:fx/grow
execute at @e[type=marker,tag=cs.origin,limit=1] run function cutscene:timeline
execute if score #run cs.v matches 1 run function cutscene:cam/step
execute if score #run cs.v matches 1 if score #t cs.v matches 4.. as @a[tag=cs.viewer] run spectate @e[type=item_display,tag=cs.cam,limit=1]
