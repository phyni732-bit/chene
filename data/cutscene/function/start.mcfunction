# /function cutscene:start — plays the cutscene for the player who runs it
scoreboard objectives add cs.v dummy
scoreboard players set #c10000 cs.v 10000
execute if score #run cs.v matches 1 run return run tellraw @s {"text":"Катсцена уже идёт. Прервать: /function cutscene:stop","color":"red"}
execute unless entity @s[type=minecraft:player] run return run tellraw @a {"text":"Катсцену должен запускать игрок: /function cutscene:start","color":"red"}
execute store result score #diff cs.v run difficulty
execute if score #diff cs.v matches 0 run return run tellraw @s {"text":"На мирной сложности зомби исчезает. Поставь /difficulty easy и запусти снова.","color":"red"}

kill @e[tag=cs.e]
kill @e[type=marker,tag=cs.return]
tag @a remove cs.viewer
tag @s add cs.viewer
tag @s[gamemode=survival] add cs.gm.survival
tag @s[gamemode=creative] add cs.gm.creative
tag @s[gamemode=adventure] add cs.gm.adventure
tag @s[gamemode=spectator] add cs.gm.spectator

# where the player returns to afterwards (position and rotation)
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["cs.return"]}
execute at @s as @e[type=marker,tag=cs.return,limit=1] run tp @s ~ ~ ~ ~ ~
# the stage floats above the clouds, straight over the player
execute at @s align xyz positioned ~ 230 ~ run summon minecraft:marker ~ ~ ~ {Tags:["cs.e","cs.origin"]}
execute at @e[type=marker,tag=cs.origin,limit=1] run summon minecraft:item_display ~6 ~-55 ~16 {Tags:["cs.e","cs.cam"],teleport_duration:0}

gamemode spectator @s
execute at @e[type=marker,tag=cs.origin,limit=1] run tp @s ~6 ~-55 ~16
stopsound @s music

function cutscene:util/sunset

scoreboard players set #t cs.v 0
scoreboard players set #run cs.v 1
