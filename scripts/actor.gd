extends CharacterBody2D

# This component manages Health and collisions. Used for Enemies and player.
# It checks if it is connected to the player, and if it is it
# Does some animations and stuff.

# Nodes
@export var collision: CollisionShape2D 
@export var sprite_face: Sprite2D 
@export var sprite_legs : Sprite2D
@export var sprite_gun : Sprite2D

# Conponents
@export var gun_conponent : Node2D 
@export var movement_component : Node2D
var parent

# Variables
@export var max_health: int = 100
@onready var current_health: int
@onready var i_am_player : bool 


func _physics_process(_delta: float) -> void:
	
	if i_am_player:
		gun_conponent.i_am_player = true
		
		$body_node.look_at(get_global_mouse_position())
	
		if get_angle_to(get_global_mouse_position()) < -1.6:
			$legs.rotation_degrees = 180
		elif get_angle_to(get_global_mouse_position()) < 0:
			$legs.rotation_degrees = -90
		elif get_angle_to(get_global_mouse_position()) < 1.6:
			$legs.rotation_degrees = 0
		else:
			$legs.rotation_degrees = 90
	
		if $MovementComponent.is_walking == true:
			$legs/AnimationPlayer.play("walk")
		else:
			$legs/AnimationPlayer.play("RESET")
	
	
	
	move_and_slide()





func _ready() -> void:
	parent = get_parent()
	if parent.name == "Player":
		i_am_player = true
		movement_component.speed = Autoload.player_speed
	
	current_health = max_health
	

func _process(_delta: float) -> void:
	
	# If i am the player, give me the player health.
	if i_am_player == true:
		assing_player_health()

# The player health will get changed directly in the autoload. Not here.
func assing_player_health():
	max_health = Autoload.player_max_health
	current_health = max_health




func take_damage(amount):
	parent.get_node("AnimationPlayer").stop()
	parent.get_node("AnimationPlayer").play("hurt")
	
	if i_am_player:
		Autoload.player_curremt_health = clampi(current_health - amount, 0, 99999)
	else:
		current_health = clampi(current_health - amount, 0, 99999)
	
	if current_health <= 0 and i_am_player:
		defeat()
	else:
		queue_free()
	
	

func defeat():
	get_tree().reload_current_scene()
	
