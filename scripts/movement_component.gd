extends Node2D

# Nodes
@export var actor : CharacterBody2D 


# Components
@export var dash_component : Node = null

# Variables
@onready var speed : int
@onready var can_dash : bool


func _ready() -> void:
	if dash_component == null:
		can_dash = false
	elif dash_component != null:
		can_dash = true

func _physics_process(_delta: float) -> void:
	actor.velocity.x = Input.get_axis("left", "right") * speed
	actor.velocity.y = Input.get_axis("up", "down") * speed
	
	actor.velocity = lerp(actor.get_real_velocity(), actor.velocity, 0.1)
	
	if Input.is_action_just_pressed("dash") and can_dash:
		if not Input.get_axis("left","right") and not Input.get_axis("up", "down"):
			return
		var direction : Vector2
		can_dash = false
		direction.x = Input.get_axis("left", "right") * 2
		direction.y = Input.get_axis("up", "down") * 2
		
		dash_component.dash(direction)
		await get_tree().create_timer(Autoload.dash_wait_time).timeout
		can_dash = true
	
