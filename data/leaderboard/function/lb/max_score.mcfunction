##
 # max_score.mcfunction
 # 
 #
 # Created by DJT3.
##

$execute if entity @s[nbt={data:{reverse_order:1}}] run scoreboard players operation #int.temp_score_display leaderboard < $(player) $(score)
$execute if entity @s[nbt={data:{reverse_order:0}}] run scoreboard players operation #int.temp_score_display leaderboard > $(player) $(score)