##
# debug_dump.mcfunction
# Runs sort on the nearest top board, then prints lists and the board core NBT.
##
tellraw @s [{"text":"[LB DEBUG] dump start","color":"aqua"}]
execute as @e[type=text_display,tag=top,limit=1,sort=nearest] run data modify storage leaderboard:update score set from entity @s score
execute as @e[type=text_display,tag=top,limit=1,sort=nearest] run data modify storage leaderboard:update max_players set from entity @s max_players
execute as @e[type=text_display,tag=top,limit=1,sort=nearest] run data modify storage leaderboard:update list set from entity @s list
execute as @e[type=text_display,tag=top,limit=1,sort=nearest] run function leaderboard:lb/sort_names with storage leaderboard:update
tellraw @s [{"text":"[LB DEBUG] board: ","color":"yellow"},{"nbt":"score","entity":"@e[type=text_display,tag=top,limit=1,sort=nearest]"},{"text":" , "},{"nbt":"max_players","entity":"@e[type=text_display,tag=top,limit=1,sort=nearest]"},{"text":" , decimal="},{"nbt":"decimal","entity":"@e[type=text_display,tag=top,limit=1,sort=nearest]"},{"text":" , time_mode="},{"nbt":"time_mode","entity":"@e[type=text_display,tag=top,limit=1,sort=nearest]"}]
tellraw @s [{"text":"[LB DEBUG] Names (unordered): ","color":"yellow"},{"storage":"leaderboard:temp_namelist","nbt":"names_unordered"}]
tellraw @s [{"text":"[LB DEBUG] Names (ordered):   ","color":"yellow"},{"storage":"leaderboard:temp_namelist","nbt":"names_ordered"}]
tellraw @s [{"text":"[LB DEBUG] storage names:     ","color":"yellow"},{"storage":"leaderboard:namelist","nbt":"names"}]
tellraw @s [{"text":"[LB DEBUG] dump end","color":"aqua"}]
