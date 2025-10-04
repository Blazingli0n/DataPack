##
# reindex_names.mcfunction
# Clear and rebuild the leaderboard name list safely.
##
data modify storage leaderboard:namelist names set value []
tag @a remove lb_tracked
execute as @a run function leaderboard:lb/add_name_to_storage
