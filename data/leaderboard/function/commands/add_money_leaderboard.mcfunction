##
# add_money_leaderboard.mcfunction
#
# Place a floating Money leaderboard (top 8) using the 'money' objective.
# Assumes 'money' stores tenths (e.g., 5 => 0.5).
##
summon text_display ~ ~2.5 ~ {Tags:["top","leaderboard"],text:{text:"Money Leaderboard"},line_width:2000,alignment:"left",billboard:"vertical",see_through:0,transformation:{translation:[0f,0f,0f],scale:[1f,1f,1f]},score:"money",max_players:8,reverse_order:0,always_show_closest_player:0,no_zero:0,medal_color:1,time_mode:0,decimal:1,list:"leaderboard:namelist names",data:{score:"money",max_players:8,reverse_order:0,always_show_closest_player:0,no_zero:0,medal_color:1,time_mode:0,decimal:1,list:"leaderboard:namelist names"}}
function leaderboard:lb/set_rotation
schedule function leaderboard:lb/update_all_init 1t replace