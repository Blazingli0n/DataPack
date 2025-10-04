##
 # update_all_leaderboard.mcfunction
 # 
 #
 # Created by DJT3.
##
data modify storage leaderboard:update score set from entity @s data.score
data modify storage leaderboard:update max_players set from entity @s data.max_players

execute store result score #bool.has_list leaderboard run data get entity @s data.list
execute if score #bool.has_list leaderboard matches 0 run data modify storage leaderboard:update list set value "leaderboard:namelist names"
execute unless score #bool.has_list leaderboard matches 0 run data modify storage leaderboard:update list set from entity @s data.list

execute as @s run function leaderboard:lb/update_leaderboard with storage leaderboard:update
