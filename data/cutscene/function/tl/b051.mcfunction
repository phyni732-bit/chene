execute if score #t cs.v matches 2072 run playsound minecraft:block.beacon.deactivate master @a[tag=cs.viewer] ~0 ~2 ~0 9 0.7
execute if score #t cs.v matches 2072 run function cutscene:fx/dissolve_some
execute if score #t cs.v matches 2073 run function cutscene:fx/dissolve_some
execute if score #t cs.v matches 2074 run function cutscene:fx/dissolve_some
execute if score #t cs.v matches 2075 run function cutscene:fx/dissolve_some
execute if score #t cs.v matches 2076 run particle minecraft:poof ~-1.4 ~1 ~0 0.3 0.7 0.3 0.03 25 force @a[tag=cs.viewer]
execute if score #t cs.v matches 2076 run particle minecraft:poof ~1.4 ~1 ~0 0.3 0.7 0.3 0.03 25 force @a[tag=cs.viewer]
execute if score #t cs.v matches 2076 run function cutscene:fx/remove_actors
execute if score #t cs.v matches 2076 run function cutscene:fx/dissolve_some
execute if score #t cs.v matches 2077 run function cutscene:fx/dissolve_some
execute if score #t cs.v matches 2078 run function cutscene:fx/dissolve_some
execute if score #t cs.v matches 2079 run function cutscene:fx/dissolve_some
