execute if score #t cs.v matches 262 run summon minecraft:zombie ~2.5 ~0 ~0 {NoAI:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Rotation:[90f,0f],CanPickUpLoot:0b,Tags:["cs.e","cs.actor","cs.zombie"]}
execute if score #t cs.v matches 262 run particle minecraft:large_smoke ~2.5 ~1 ~0 0.3 0.7 0.3 0.02 30 force @a[tag=cs.viewer]
execute if score #t cs.v matches 262 run particle minecraft:soul ~2.5 ~1 ~0 0.3 0.7 0.3 0.03 12 force @a[tag=cs.viewer]
execute if score #t cs.v matches 262 run playsound minecraft:entity.zombie.ambient master @a[tag=cs.viewer] ~2.5 ~1 ~0 3 0.7
execute if score #t cs.v matches 266 run execute as @e[type=villager,tag=cs.villager,limit=1] at @s run tp @s ~ ~ ~ -90 -8
