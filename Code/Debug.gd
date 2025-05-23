#DEBUG
#*****REMOVE BEFORE LAUNCH/FINAL*****
#This script is used for debugging purposes
#It prints out the current state of the player and slime nodes
#btw i didnt write a single line, chatgpt did it all lol

class_name Debug
extends Node2D

# func _ready():
# 	print("--- Debugging process started ---")
# 	print("DEBUG LOADED")

# func _physics_process(_delta: float) -> void:
# 	var player = get_tree().get_first_node_in_group("Player")
# 	var slime = get_tree().get_first_node_in_group("Slime")

# 	# if !player or !slime:
# 	# 	printerr("Debug: Player/Slime nodes not found!")
# 	# 	return

# 	var player_velocity := Vector2.ZERO
# 	player_velocity = player.velocity

# 	var debug_output := """
# 	[Player]
# 	HP: {hp} | ATK: {atk} | RANGE: {range}
# 	Position: {pos} | Velocity: {vel}
	
# 	[Slime]
# 	Position: {slime_pos} | HP: {slime_hp}
# 	""".format({
# 		"hp": G.P_HP,
# 		"atk": G.P_ATK_DMG,
# 		"range": G.P_ATK_RANGE,
# 		"pos": player.position,
# 		"vel": player_velocity,
# 		"slime_pos": slime.position,
# 		"slime_hp": G.S_HP,

# 	})
# 	print(debug_output)
