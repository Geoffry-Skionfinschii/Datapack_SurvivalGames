# Reset kills 
scoreboard players reset * kills
scoreboard players set #game PlayersAlive 0
scoreboard players reset * Deaths

# Revoke advancements
advancement revoke @a everything

effect clear @a

# Give all active players the InGameTag
tag @a add InGame

# Set time to day
time set 0
weather clear

# Set sec_timer to 0
scoreboard players set #game Sec_Timer 0
scoreboard players set #game Min_Timer 0

# Enable drops
gamerule doTileDrops true

# Clear winner tag from players
tag @a[tag=Winner] remove Winner

# Reset border
worldborder set 1500 0
execute at @e[type=minecraft:armor_stand, name=Anchor] run worldborder center ~ ~
worldborder warning distance 100

execute at @e[type=minecraft:armor_stand, name=Anchor] run spreadplayers ~ ~ 200 725 false @a[tag=InGame]

# Set players alive count
execute as @a[tag=InGame] run scoreboard players add #game PlayersAlive 1

gamemode survival @a[tag=InGame]

# Setup sidebar
scoreboard players reset * DisplayVariable
scoreboard objectives setdisplay sidebar DisplayVariable
team join INTERNAL_SIDEBAR PlayersAlive:
team join INTERNAL_SIDEBAR Minutes:

# Set shrinking value
worldborder set 10 1800