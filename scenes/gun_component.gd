extends Node2D

@onready var bullet_component : PackedScene
@export var raycast : RayCast2D
@onready var wavelenghts: Array = Autoload.wavelenghts.keys()
@onready var current_wavelenght = wavelenghts[0]
@onready var can_shoot : bool = true

var game_manager
var bullet_damage = 10
var bullet_speed = 4.0


func _ready():
	get_bullet()
	game_manager = get_tree().root.get_child(get_tree().root.get_child_count() - 1)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot or Input.is_action_pressed("shoot") and can_shoot:
		
		can_shoot = false
		var bullet = game_manager.player_bullet_scene.instantiate()
		bullet.global_position = self.global_position
		$/root/Main.add_child(bullet)
		bullet.construct(bullet_damage, bullet_speed, get_global_mouse_position() - global_position, "player", game_manager)
		
		#bullet.bullet_direction = (get_global_mouse_position() - global_position).normalized()
		
		await get_tree().create_timer(Autoload.shoot_wait_time).timeout
		can_shoot = true



func get_bullet():
	match current_wavelenght:
		"radio":
			pass
			#bullet_component = Autoload.bullet_nodes[0]
		"microonde":
			pass
		"infrared":
			pass
		"visible":
			pass
		"ultraviolet":
			pass
		"x-rays":
			pass
		"gammarays":
			pass
