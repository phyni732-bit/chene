# /function cutscene:stop — ends the cutscene at any moment and puts everything back
scoreboard players set #run cs.v 0
execute at @e[type=marker,tag=cs.origin,limit=1] run function cutscene:fx/lights_off
function cutscene:fx/remove_actors
kill @e[tag=cs.e]
stopsound @a[tag=cs.viewer] record
title @a[tag=cs.viewer] clear
title @a[tag=cs.viewer] reset
execute as @a[tag=cs.viewer] run function cutscene:player/restore
