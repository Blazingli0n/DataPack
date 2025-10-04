##
 # sort_names.mcfunction
 # 
 #
 # Created by DJT3.
##
$data modify storage leaderboard:temp_player score set value $(score)

# Reset output

data remove storage leaderboard:temp_namelist names_ordered

$data modify storage leaderboard:temp_namelist names_unordered set from storage leaderboard:namelist names
execute store result score #int.unorderred_namelist_size leaderboard run data get storage leaderboard:temp_namelist names_unordered
execute store result score #int.namelist_size leaderboard run data get storage leaderboard:temp_namelist names_ordered

$execute as @s unless score #int.unorderred_namelist_size leaderboard matches 0 unless score #int.namelist_size leaderboard matches $(max_players) run function leaderboard:lb/append_max_players with storage leaderboard:update
