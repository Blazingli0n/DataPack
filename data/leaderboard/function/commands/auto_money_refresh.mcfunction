# capture new players
execute as @a unless entity @s[tag=lb_tracked] run function leaderboard:lb/add_name_to_storage
# seed unordered names each tick
data modify storage leaderboard:temp_namelist names_unordered set from storage leaderboard:namelist names
# force config into storage (ignore entity NBT)
data modify storage leaderboard:update score set value "money"
data modify storage leaderboard:update max_players set value 8
data modify storage leaderboard:update list set value "leaderboard:namelist names"
# update the leaderboard
execute as @e[type=text_display,tag=leaderboard,tag=top] run function leaderboard:lb/update_all_init
function leaderboard:lb/update_leaderboard with storage leaderboard:update
# reschedule every 1s
schedule function leaderboard:commands/auto_money_refresh 1s replace
