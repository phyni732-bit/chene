spectate
execute unless entity @e[type=marker,tag=cs.return] run effect give @s minecraft:slow_falling 40 0 true
execute at @e[type=marker,tag=cs.return,limit=1] run tp @s ~ ~ ~ ~ ~
gamemode survival @s[tag=cs.gm.survival]
gamemode creative @s[tag=cs.gm.creative]
gamemode adventure @s[tag=cs.gm.adventure]
gamemode spectator @s[tag=cs.gm.spectator]
tag @s remove cs.gm.survival
tag @s remove cs.gm.creative
tag @s remove cs.gm.adventure
tag @s remove cs.gm.spectator
tag @s remove cs.viewer
title @s actionbar ""
kill @e[type=marker,tag=cs.return]
