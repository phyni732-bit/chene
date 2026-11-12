execute if score #t cs.v matches 1084 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"А у меня была колокольня. Я звонил в неё, когда ещё был живым.","color":"white"}]
execute if score #t cs.v matches 1085 run execute if block ~0 ~6 ~-9 minecraft:air run setblock ~0 ~6 ~-9 minecraft:light[level=13]
execute if score #t cs.v matches 1085 run playsound minecraft:block.bell.use master @a[tag=cs.viewer] ~0 ~6 ~-11 5 1
execute if score #t cs.v matches 1085 run playsound minecraft:block.bell.resonate master @a[tag=cs.viewer] ~0 ~6 ~-11 5 1
execute if score #t cs.v matches 1085 run particle minecraft:end_rod ~0 ~6.5 ~-10.5 1 0.6 1 0.03 25 force @a[tag=cs.viewer]
execute if score #t cs.v matches 1104 run title @a[tag=cs.viewer] actionbar [{"text":""},{"text":"Зомби","color":"dark_green","bold":true},{"text":"  »  ","color":"dark_gray"},{"text":"А у меня была колокольня. Я звонил в неё, когда ещё был живым.","color":"white"}]
execute if score #t cs.v matches 1107 run playsound minecraft:block.bell.use master @a[tag=cs.viewer] ~0 ~6 ~-11 5 0.8
