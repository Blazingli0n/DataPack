execute as @e[type=text_display,tag=leaderboard,tag=top] run function leaderboard:lb/update_all_init
data modify storage leaderboard:update score set value "money"
data modify storage leaderboard:update max_players set value 8
data modify storage leaderboard:update list set value "leaderboard:namelist names"
function leaderboard:lb/update_leaderboard with storage leaderboard:update
