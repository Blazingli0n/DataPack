##
 # add_line.mcfunction
 # 
 #
 # Created by DJT3.
##
$execute at @s unless entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)] run summon text_display ~ ~ ~ {Tags:["$(lines)","leaderboard"],data:{score:$(score)},billboard:$(billboard),brightness:{block:$(bright),sky:$(bright)},see_through:$(see_through),transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-$(sep)f,0f],scale:[1f,1f,1f]},alignment:"left",line_width:2000f}
$execute at @s run data modify entity @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines),limit=1] Rotation set from entity @n[tag=top,nbt={data:{score:$(score)}}] Rotation
