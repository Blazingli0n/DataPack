##
# === Per-rank vertical offset + slot tag mapping ===
# Write sep into storage based on rank so rows don't overlap
execute if data storage leaderboard:line {rank:1} run data modify storage leaderboard:line sep set value 0.0f
execute if data storage leaderboard:line {rank:2} run data modify storage leaderboard:line sep set value -0.30f
execute if data storage leaderboard:line {rank:3} run data modify storage leaderboard:line sep set value -0.60f
execute if data storage leaderboard:line {rank:4} run data modify storage leaderboard:line sep set value -0.90f
execute if data storage leaderboard:line {rank:5} run data modify storage leaderboard:line sep set value -1.20f
execute if data storage leaderboard:line {rank:6} run data modify storage leaderboard:line sep set value -1.50f
execute if data storage leaderboard:line {rank:7} run data modify storage leaderboard:line sep set value -1.80f
execute if data storage leaderboard:line {rank:8} run data modify storage leaderboard:line sep set value -2.10f

# Ensure the matching slot tag exists on the nearest line (or new summon will include it)
execute if data storage leaderboard:line {rank:1} at @s as @e[type=minecraft:text_display,tag=leaderboard,tag=!top,limit=1,sort=nearest] run tag @s add slot1
execute if data storage leaderboard:line {rank:2} at @s as @e[type=minecraft:text_display,tag=leaderboard,tag=!top,limit=1,sort=nearest] run tag @s add slot2
execute if data storage leaderboard:line {rank:3} at @s as @e[type=minecraft:text_display,tag=leaderboard,tag=!top,limit=1,sort=nearest] run tag @s add slot3
execute if data storage leaderboard:line {rank:4} at @s as @e[type=minecraft:text_display,tag=leaderboard,tag=!top,limit=1,sort=nearest] run tag @s add slot4
execute if data storage leaderboard:line {rank:5} at @s as @e[type=minecraft:text_display,tag=leaderboard,tag=!top,limit=1,sort=nearest] run tag @s add slot5
execute if data storage leaderboard:line {rank:6} at @s as @e[type=minecraft:text_display,tag=leaderboard,tag=!top,limit=1,sort=nearest] run tag @s add slot6
execute if data storage leaderboard:line {rank:7} at @s as @e[type=minecraft:text_display,tag=leaderboard,tag=!top,limit=1,sort=nearest] run tag @s add slot7
execute if data storage leaderboard:line {rank:8} at @s as @e[type=minecraft:text_display,tag=leaderboard,tag=!top,limit=1,sort=nearest] run tag @s add slot8

execute if data storage leaderboard:update {score:"money"} as @s run function leaderboard:lb/build_decimal_values with storage leaderboard:line
$execute if entity @s[nbt={decimal:1}] at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,$(sep)f,0f],scale:[1f,1f,1f]}}] run data modify entity @e[type=text_display,distance=..0.001,limit=1,sort=nearest] text set value [{"text":"$(rank). "},{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_int).$(value_frac)","color":"red"}]

 # update_line.mcfunction
 # 
 #
 # Created by DJT3.
##
$execute if entity @s[nbt={time_mode:0}] unless entity @s[nbt={decimal:1}] at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value)","color":"red"}]}

#Time
# XH Xm Xs XXms
$execute if entity @s[nbt={time_mode:2}] if score #int.value_3 leaderboard >= #const.1 leaderboard unless score #const.5 leaderboard >= #int.value_0 leaderboard at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_3)h $(value_2)m $(value_1).$(value_0)s","color":"red"}]}
# XH Xm Xs 0Xms
$execute if entity @s[nbt={time_mode:2}] if score #int.value_3 leaderboard >= #const.1 leaderboard if score #const.5 leaderboard >= #int.value_0 leaderboard at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_3)h $(value_2)m $(value_1).0$(value_0)s","color":"red"}]}

# XH Xm
$execute if entity @s[nbt={time_mode:1}] if score #int.value_3 leaderboard >= #const.1 leaderboard unless score #const.5 leaderboard >= #int.value_0 leaderboard at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_3)h $(value_2)m $(value_1)s","color":"red"}]}
# XH Xm
$execute if entity @s[nbt={time_mode:1}] if score #int.value_3 leaderboard >= #const.1 leaderboard if score #const.5 leaderboard >= #int.value_0 leaderboard at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_3)h $(value_2)m $(value_1)s","color":"red"}]}

# Xm Xs XXms
$execute unless entity @s[nbt={time_mode:0}] if score #int.value_2 leaderboard >= #const.1 leaderboard unless score #int.value_3 leaderboard >= #const.1 leaderboard unless score #const.5 leaderboard >= #int.value_0 leaderboard at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_2)m $(value_1).$(value_0)s","color":"red"}]}
# Xm Xs 0Xms
$execute unless entity @s[nbt={time_mode:0}] if score #int.value_2 leaderboard >= #const.1 leaderboard unless score #int.value_3 leaderboard >= #const.1 leaderboard if score #const.5 leaderboard >= #int.value_0 leaderboard at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_2)m $(value_1).0$(value_0)s","color":"red"}]}

# Xs XXms
$execute unless entity @s[nbt={time_mode:0}] unless score #int.value_2 leaderboard >= #const.1 leaderboard unless score #int.value_3 leaderboard >= #const.1 leaderboard unless score #const.5 leaderboard >= #int.value_0 leaderboard at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_1).$(value_0)s","color":"red"}]}
# Xs 0Xms
$execute unless entity @s[nbt={time_mode:0}] unless score #int.value_2 leaderboard >= #const.1 leaderboard unless score #int.value_3 leaderboard >= #const.1 leaderboard if score #const.5 leaderboard >= #int.value_0 leaderboard at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] text set value {"text":"","extra":[{"text":"#$(rank)","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)}," "," : "," ",{"text":"$(value_1).0$(value_0)s","color":"red"}]}
# background
$execute at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] background set value -1777069036
$execute at @s if entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run data modify entity @e[type=minecraft:text_display,tag=!top,limit=1,sort=nearest,tag=$(lines)] default_background set value $(close_background)
# Forced Money rendering
# Ensure a line entity exists at this slot (translation Y=$(sep)f)

# === Tag-per-slot ensure + render (robust) ===
# Ensure a unique line entity exists for this rank using tag slot$(rank)
$execute if data storage leaderboard:update {score:"money"} at @s unless entity @e[type=minecraft:text_display,tag=leaderboard,tag=!top,tag=slot$(rank),distance=..32] run summon minecraft:text_display ~ ~ ~ {Tags:["leaderboard","slot$(rank)"],billboard:"vertical",alignment:"left",line_width:2000,see_through:0,transformation:{translation:[0f,$(sep)f,0f],scale:[1f,1f,1f]}}
# Recompute decimals every update for Money
execute if data storage leaderboard:update {score:"money"} as @s run function leaderboard:lb/build_decimal_values with storage leaderboard:line
# Update that slot's text
$execute if data storage leaderboard:update {score:"money"} at @s run data modify entity @e[type=minecraft:text_display,tag=leaderboard,tag=!top,tag=slot$(rank),limit=1,sort=nearest] text set value [{"text":"$(rank). "},{"text":"$(name)","bold":$(bold_name)}," ",{"text":": "},{"text":"$(value_int).$(value_frac_tens)$(value_frac_ones)","color":"red"}]
