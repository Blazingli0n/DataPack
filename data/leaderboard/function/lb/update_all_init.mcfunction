##
 # update_all_init.mcfunction
 # 
 #
 # Created by DJT3.
##
execute unless data storage leaderboard:namelist names run data modify storage leaderboard:namelist names set value []
execute as @a[tag=!lb_tracked] run function leaderboard:lb/add_name_to_storage
execute as @e[type=text_display,tag=leaderboard,tag=top] run function leaderboard:lb/update_all_leaderboard
execute as @e[type=text_display,tag=leaderboard,tag=top,nbt={score:"money"}] run data modify entity @s text set value {"text":"Money Leaderboard"}

schedule function leaderboard:lb/update_all_init 1s replace