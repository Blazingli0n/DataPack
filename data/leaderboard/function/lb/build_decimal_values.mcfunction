$execute store result score #v money run scoreboard players get $(name) $(score)
scoreboard players operation #i money = #v money
scoreboard players operation #i money /= #c5 money
scoreboard players operation #i money /= #c2 money
scoreboard players operation #i money /= #c5 money
scoreboard players operation #i money /= #c2 money
scoreboard players operation #temp money = #i money
scoreboard players operation #temp money *= #c5 money
scoreboard players operation #temp money *= #c2 money
scoreboard players operation #temp money *= #c5 money
scoreboard players operation #temp money *= #c2 money
scoreboard players operation #f money = #v money
scoreboard players operation #f money -= #temp money
scoreboard players operation #t money = #f money
scoreboard players operation #t money /= #c5 money
scoreboard players operation #t money /= #c2 money
scoreboard players operation #temp money = #t money
scoreboard players operation #temp money *= #c5 money
scoreboard players operation #temp money *= #c2 money
scoreboard players operation #o money = #f money
scoreboard players operation #o money -= #temp money
execute store result storage leaderboard:line value_int int 1 run scoreboard players get #i money
execute store result storage leaderboard:line value_frac_tens int 1 run scoreboard players get #t money
execute store result storage leaderboard:line value_frac_ones int 1 run scoreboard players get #o money
