extends Node

# THIS FUNCTIONS AS A GAME MANAGER

@onready var player_max_health : float = 100
@onready var player_curremt_health : float
@onready var player_speed : int = 300
@onready var player_dash_speed : int = 400.0
@onready var shoot_wait_time : float = 0.35
@onready var dash_wait_time : float = 1

var enemy_bullet_scene = preload("res://scenes/enemybullet.tscn")
var damage_notif_scene = preload("res://scenes/ui/damage_notif.tscn")

const wavelenghts : Dictionary = {
	"radio" : [1],
	"microonde" : [1.5],
	"infrared" : [1.8],
	"visible" : [2],
	"ultraviolet" : [2.4],
	"x-rays": [2.7],
	"gammarays": [3]

}

# The player will have different bullets, from radio to gamma.
var bullet_nodes : Array[PackedScene] = [
	preload("res://scenes/radiobullet.tscn"),
	
	
]

var enemy_info : Dictionary = { # FIRST NUMBER: HEALTH, SECOND NUMBER: SPEED
	"enemy1": [100, 300], # Melee enemy
	"enemy2": [150, 150], # Gun enemy
	"enemy3": [300, 100], # Big melee enemy
}


func _process(_delta: float) -> void:
	# editing tools, turn this off on final release of game
	if Input.is_action_just_pressed("quit"): get_tree().quit()
	if Input.is_action_just_pressed("respawn"): get_tree().reload_current_scene()
