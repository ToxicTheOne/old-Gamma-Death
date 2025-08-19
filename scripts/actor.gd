extends CharacterBody2D

# Nodes
@export var collision: CollisionShape2D 
@export var sprite_face: Sprite2D 

# Conponents
@export var gun_conponent : Node2D 
@export var movement_component : Node2D

# Variables
@export var max_health: float = 100
@onready var current_health: float
@onready var i_am_player : bool 


func _physics_process(_delta: float) -> void:
	sprite_face.look_at(get_global_mouse_position())
	move_and_slide()

func _ready() -> void:
	var parent = get_parent()
	if parent.name == "Player":
		i_am_player = true
		movement_component.speed = Autoload.player_speed

func _process(_delta: float) -> void:
	if i_am_player == true:
		assing_player_health()
		get_child(0).global_position = self.global_position

func assing_player_health():
	max_health = Autoload.player_max_health
