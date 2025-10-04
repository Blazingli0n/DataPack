##
 # update_line_init.mcfunction
 # 
 #
 # Created by DJT3.
##
execute unless entity @s[nbt={data:{time_mode:0}}] as @s run function leaderboard:lb/build_time_values with storage leaderboard:line
data modify storage leaderboard:line color set value "white"
$execute if entity @s[nbt={data:{medal_color:1}}] if score #const.1 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#D6AF36"
$execute if entity @s[nbt={data:{medal_color:1}}] if score #const.2 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#A7A7AD"
$execute if entity @s[nbt={data:{medal_color:1}}] if score #const.3 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#A77044"

data modify storage leaderboard:line bold_name set value "false"
data modify storage leaderboard:line close_background set value 1
$execute as @s at @s if entity @s[nbt={data:{always_show_closest_player:1}}] if entity @p[distance=..10,name='$(name)'] run data modify storage leaderboard:line bold_name set value "true"
$execute as @s at @s if entity @s[nbt={data:{always_show_closest_player:1}}] if entity @p[distance=..10,name='$(name)'] run data modify storage leaderboard:line close_background set value 0

$execute store result score #int.money_total leaderboard run scoreboard players get $(name) $(score)
scoreboard players set #int.money_dollars leaderboard 0
scoreboard players set #int.money_cents leaderboard 0
scoreboard players set #int.money_cents_tens leaderboard 0
scoreboard players set #int.money_cents_ones leaderboard 0
scoreboard players operation #int.money_dollars leaderboard = #int.money_total leaderboard
scoreboard players operation #int.money_dollars leaderboard /= #const.100 leaderboard
scoreboard players operation #int.money_cents leaderboard = #int.money_total leaderboard
scoreboard players operation #int.money_cents leaderboard %= #const.100 leaderboard
scoreboard players operation #int.money_cents_tens leaderboard = #int.money_cents leaderboard
scoreboard players operation #int.money_cents_tens leaderboard /= #const.10 leaderboard
scoreboard players operation #int.money_cents_ones leaderboard = #int.money_cents leaderboard
scoreboard players operation #int.money_cents_ones leaderboard %= #const.10 leaderboard
execute store result storage leaderboard:line money_dollars int 1 run scoreboard players get #int.money_dollars leaderboard
execute store result storage leaderboard:line money_cents_tens int 1 run scoreboard players get #int.money_cents_tens leaderboard
execute store result storage leaderboard:line money_cents_ones int 1 run scoreboard players get #int.money_cents_ones leaderboard

$execute store result storage leaderboard:line value int 1 run scoreboard players get $(name) $(score)
execute as @s run function leaderboard:lb/update_line with storage leaderboard:line
