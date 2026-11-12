# jump forward to sunset (time only ever moves forward, the day counter is kept)
execute store result score #d cs.v run time query minecraft:day
scoreboard players set #neg cs.v -1
scoreboard players remove #d cs.v 12550
scoreboard players operation #d cs.v *= #neg cs.v
execute if score #d cs.v matches ..-1 run scoreboard players add #d cs.v 24000
execute store result storage cutscene:tmp d int 1 run scoreboard players get #d cs.v
function cutscene:util/time_add with storage cutscene:tmp
