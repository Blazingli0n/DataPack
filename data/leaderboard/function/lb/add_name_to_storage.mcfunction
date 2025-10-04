##
 # add_name_to_storage.mcfunction
 # 1.21.9-safe: capture the executing player's name via a temporary chest minecart.
 # This avoids relying on item_display + container.0 (not reliable across versions).
 #
 # Steps:
 #  - summon chest minecart with tag lb_tmp_name
 #  - fill slot 0 with a player_head of @s via loot table
#  - read Items[0].components."minecraft:profile".name into storage list
 #  - tag player as tracked and clean up
 ##
execute at @s run summon chest_minecart ~ ~ ~ {Tags:["lb_tmp_name"],NoGravity:1b,Silent:1b,Invulnerable:1b}
loot replace entity @e[type=chest_minecart,tag=lb_tmp_name,limit=1,sort=nearest] container.0 loot leaderboard:entities/player_head
data modify storage leaderboard:namelist names append from entity @e[type=chest_minecart,tag=lb_tmp_name,limit=1,sort=nearest] Items[0].components."minecraft:profile".name
tag @s add lb_tracked
kill @e[type=chest_minecart,tag=lb_tmp_name,limit=1,sort=nearest]
