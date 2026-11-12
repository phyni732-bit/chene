execute if score #run cs.v matches 1 run function cutscene:loop
# restores a viewer who left mid-cutscene and came back
execute unless score #run cs.v matches 1 as @a[tag=cs.viewer] run function cutscene:player/restore
