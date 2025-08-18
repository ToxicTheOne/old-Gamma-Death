extends Node2D


# preloaded scenes
var enemy_bullet_scene = preload("res://scenes/enemy/enemy_bullet.tscn")
var player_bullet_scene = preload("res://scenes/player/radiobullet.tscn")
var damage_notif_scene = preload("res://scenes/ui/damage_notif.tscn")




func _process(_delta: float) -> void:
	# editing tools, turn this off on final release of game
	if Input.is_action_just_pressed("quit"): get_tree().quit()
	if Input.is_action_just_pressed("respawn"): get_tree().reload_current_scene()
