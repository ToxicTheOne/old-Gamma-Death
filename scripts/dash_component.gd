extends Node2D


@onready var dash_speed : int = Autoload.player_dash_speed 
@export var parent : Node2D

func _ready():
	parent = get_parent().get_parent().get_parent()


func dash(direction):
	var parent = get_parent().get_parent()
	parent.remove_from_group("player")
	
	parent.velocity.x = direction.x * dash_speed
	parent.velocity.y = direction.y * dash_speed
	
	await get_tree().create_timer(0.15).timeout
	parent.add_to_group("player")
	
