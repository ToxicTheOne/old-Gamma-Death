extends Area2D

# Data from Autoload
@onready var wavelenghts: Array = Autoload.wavelenghts.keys()
@onready var wave_multiplier : Array = Autoload.wavelenghts.values()

# Nodes
@onready var collision_shape : CollisionShape2D = $collisionshape
@onready var sprite : Sprite2D = $sprite

# Variables
@onready var my_wave : String = wavelenghts.get(0)
@onready var my_multiplier = wave_multiplier.get(0)
@onready var damage : float = 10.0 * my_multiplier[0]
@onready var speed : float = 7.0 * my_multiplier[0]
@onready var direction : Vector2


func _ready():
	pass
func _physics_process(delta: float) -> void:
	global_position += direction * speed
