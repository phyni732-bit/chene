# progress 0..10000 of the current shot, optionally eased, then a..b blended per channel
execute if score #ct cs.v < #cn cs.v run scoreboard players add #ct cs.v 1
scoreboard players operation #s cs.v = #ct cs.v
scoreboard players operation #s cs.v *= #c10000 cs.v
scoreboard players operation #s cs.v /= #cn cs.v
scoreboard players operation #e cs.v = #s cs.v
execute if score #lin cs.v matches 0 run function cutscene:cam/ease
scoreboard players operation #v cs.v = #bx cs.v
scoreboard players operation #v cs.v -= #ax cs.v
scoreboard players operation #v cs.v *= #e cs.v
scoreboard players operation #v cs.v /= #c10000 cs.v
scoreboard players operation #v cs.v += #ax cs.v
execute store result storage cutscene:cam x double 0.001 run scoreboard players get #v cs.v
scoreboard players operation #v cs.v = #by cs.v
scoreboard players operation #v cs.v -= #ay cs.v
scoreboard players operation #v cs.v *= #e cs.v
scoreboard players operation #v cs.v /= #c10000 cs.v
scoreboard players operation #v cs.v += #ay cs.v
execute store result storage cutscene:cam y double 0.001 run scoreboard players get #v cs.v
scoreboard players operation #v cs.v = #bz cs.v
scoreboard players operation #v cs.v -= #az cs.v
scoreboard players operation #v cs.v *= #e cs.v
scoreboard players operation #v cs.v /= #c10000 cs.v
scoreboard players operation #v cs.v += #az cs.v
execute store result storage cutscene:cam z double 0.001 run scoreboard players get #v cs.v
scoreboard players operation #v cs.v = #bw cs.v
scoreboard players operation #v cs.v -= #aw cs.v
scoreboard players operation #v cs.v *= #e cs.v
scoreboard players operation #v cs.v /= #c10000 cs.v
scoreboard players operation #v cs.v += #aw cs.v
execute store result storage cutscene:cam w double 0.01 run scoreboard players get #v cs.v
scoreboard players operation #v cs.v = #bp cs.v
scoreboard players operation #v cs.v -= #ap cs.v
scoreboard players operation #v cs.v *= #e cs.v
scoreboard players operation #v cs.v /= #c10000 cs.v
scoreboard players operation #v cs.v += #ap cs.v
execute store result storage cutscene:cam p double 0.01 run scoreboard players get #v cs.v
execute as @e[type=item_display,tag=cs.cam,limit=1] at @e[type=marker,tag=cs.origin,limit=1] run function cutscene:cam/apply with storage cutscene:cam
