scoreboard objectives add money dummy {"text":"Money"}
execute store result score #tmp_amount money run data get storage leaderboard:cmd amount 100
execute if entity @s run scoreboard players set @s money 0
execute unless entity @s run scoreboard players set @p money 0
execute if entity @s run scoreboard players operation @s money += #tmp_amount money
execute unless entity @s run scoreboard players operation @p money += #tmp_amount money
scoreboard players reset #tmp_amount money
function leaderboard:commands/force_money_refresh
