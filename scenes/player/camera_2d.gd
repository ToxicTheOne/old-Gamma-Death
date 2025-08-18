extends Camera2D

@export var player_node : Node
var lerp_speed = 4.0

func _physics_process(delta: float) -> void:
	
	global_position = lerp(global_position, player_node.get_node("ActorComponent").global_position, delta * lerp_speed)
	
	global_position = floor(global_position)
	
