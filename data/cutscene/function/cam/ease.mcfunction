# smoothstep: e = s*s*(3-2s)
scoreboard players operation #e cs.v *= #s cs.v
scoreboard players operation #e cs.v /= #c10000 cs.v
scoreboard players set #k cs.v 30000
scoreboard players operation #k cs.v -= #s cs.v
scoreboard players operation #k cs.v -= #s cs.v
scoreboard players operation #e cs.v *= #k cs.v
scoreboard players operation #e cs.v /= #c10000 cs.v
