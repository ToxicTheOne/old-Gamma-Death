extends Node2D

 # Nodes
@export var legs : Sprite2D
@export var actor : CharacterBody2D 

# Variables
@onready var speed : int
@export var dash_component : Node = null

func _physics_process(_delta: float) -> void:
	actor.velocity.x = Input.get_axis("left", "right") * speed
	actor.velocity.y = Input.get_axis("up", "down") * speed
	
	actor.velocity = lerp(actor.get_real_velocity(), actor.velocity, 0.1)
	
