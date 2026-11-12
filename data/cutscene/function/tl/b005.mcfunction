execute if score #t cs.v matches 214 run summon minecraft:villager ~-2.5 ~0 ~0 {NoAI:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Rotation:[-90f,0f],Tags:["cs.e","cs.actor","cs.villager"],VillagerData:{profession:"minecraft:librarian",type:"minecraft:plains",level:2}}
execute if score #t cs.v matches 214 run particle minecraft:poof ~-2.5 ~1 ~0 0.3 0.7 0.3 0.03 30 force @a[tag=cs.viewer]
execute if score #t cs.v matches 214 run particle minecraft:happy_villager ~-2.5 ~1 ~0 0.4 0.8 0.4 0 12 force @a[tag=cs.viewer]
execute if score #t cs.v matches 214 run playsound minecraft:entity.villager.celebrate master @a[tag=cs.viewer] ~-2.5 ~1 ~0 3 0.9
