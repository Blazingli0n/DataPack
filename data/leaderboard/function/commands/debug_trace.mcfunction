##
# debug_trace.mcfunction
# Runs the sort/update pipeline on the nearest TOP board and prints lists and first-line name.
##
tellraw @s [{"text":"[LB DEBUG] === TRACE START ===","color":"aqua"}]
execute as @e[type=text_display,tag=top,limit=1,sort=nearest] run data modify storage leaderboard:update score set from entity @s score
execute as @e[type=text_display,tag=top,limit=1,sort=nearest] run data modify storage leaderboard:update max_players set from entity @s max_players
execute as @e[type=text_display,tag=top,limit=1,sort=nearest] run data modify storage leaderboard:update list set from entity @s list
execute as @e[type=text_display,tag=top,limit=1,sort=nearest] run function leaderboard:lb/sort_names with storage leaderboard:update
tellraw @s [{"text":"[LB DEBUG] Names (unordered): ","color":"yellow"},{"storage":"leaderboard:temp_namelist","nbt":"names_unordered"}]
tellraw @s [{"text":"[LB DEBUG] Names (ordered):   ","color":"yellow"},{"storage":"leaderboard:temp_namelist","nbt":"names_ordered"}]
# peek first name chosen for line 1
execute store result score #int.namelist_size leaderboard run data get storage leaderboard:temp_namelist names_ordered
execute if score #int.namelist_size leaderboard matches 1.. run data modify storage leaderboard:line name set from storage leaderboard:temp_namelist names_ordered[0]
tellraw @s [{"text":"[LB DEBUG] First name: ","color":"yellow"},{"storage":"leaderboard:line","nbt":"name"}]
tellraw @s [{"text":"[LB DEBUG] === TRACE END ===","color":"aqua"}]
