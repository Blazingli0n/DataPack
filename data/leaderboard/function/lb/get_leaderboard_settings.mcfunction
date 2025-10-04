##
 # get_leaderboard_settings.mcfunction
 # 
 #
 # Created by DJT3.
##

data merge storage leaderboard:init_edit {reverse_order:0,no_zero:0,medal_color:0,always_show_closest_player:0,time_mode:0}

data modify storage leaderboard:init_edit display_name set from entity @s text
data modify storage leaderboard:init_edit billboard set from entity @s billboard
data modify storage leaderboard:init_edit see_through set from entity @s see_through
execute as @s if entity @s[nbt={brightness:{block:15}}] run data modify storage leaderboard:init_edit bright set value 1
execute as @s unless entity @s[nbt={brightness:{block:15}}] run data modify storage leaderboard:init_edit bright set value 0
data modify storage leaderboard:init_edit list set from entity @s list

data modify storage leaderboard:init_edit score set from entity @s score
data modify storage leaderboard:init_edit max_players set from entity @s max_players

data modify storage leaderboard:init_edit reverse_order set from entity @s reverse_order
data modify storage leaderboard:init_edit always_show_closest_player set from entity @s always_show_closest_player
data modify storage leaderboard:init_edit no_zero set from entity @s no_zero
data modify storage leaderboard:init_edit medal_color set from entity @s medal_color

data modify storage leaderboard:init_edit time_mode set from entity @s time_mode


