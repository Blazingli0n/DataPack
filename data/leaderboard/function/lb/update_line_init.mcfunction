##
 # update_line_init.mcfunction
 # 
 #
 # Created by DJT3.
##
execute if entity @s[nbt={decimal:1}] as @s run function leaderboard:lb/build_decimal_values with storage leaderboard:line
execute unless entity @s[nbt={time_mode:0}] unless data storage leaderboard:update {score:"money"} as @s run function leaderboard:lb/build_time_values with storage leaderboard:line
data modify storage leaderboard:line color set value "white"
$execute if entity @s[nbt={medal_color:1}] if score #const.1 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#D6AF36"
$execute if entity @s[nbt={medal_color:1}] if score #const.2 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#A7A7AD"
$execute if entity @s[nbt={medal_color:1}] if score #const.3 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#A77044"

data modify storage leaderboard:line bold_name set value "false"
data modify storage leaderboard:line close_background set value 1
$execute as @s at @s if entity @s[nbt={always_show_closest_player:1}] if entity @p[distance=..10,name='$(name)'] run data modify storage leaderboard:line bold_name set value "true"
$execute as @s at @s if entity @s[nbt={always_show_closest_player:1}] if entity @p[distance=..10,name='$(name)'] run data modify storage leaderboard:line close_background set value 0

$execute store result storage leaderboard:line value int 1 run scoreboard players get $(name) $(score)
execute as @s run function leaderboard:lb/update_line with storage leaderboard:line