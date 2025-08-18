extends Node2D

var game_manager = null


var attack_cooldown = 1.0
var cooldown_timer = 1.0
@export var player_target : Node = null

var bullet_damage = 10
var bullet_speed = 1.0

var max_health = 50
var current_health


func construct(target):
	player_target = target
	
	
	
	

func _ready() -> void:
	game_manager = get_tree().root.get_child(get_tree().root.get_child_count() - 1)
	cooldown_timer = attack_cooldown
	
	
	construct(game_manager.get_node("Player"))
	
	current_health = max_health
	

func _process(delta: float) -> void:
	
	if player_target != null:
		look_at(player_target.get_node("ActorComponent").global_position)
		
		
		# fire a bullet every time cooldown ends
		cooldown_timer -= delta
		if cooldown_timer < 0.0:
			var new_bullet = game_manager.enemy_bullet_scene.instantiate()
			new_bullet.construct(bullet_damage, bullet_speed, player_target.get_node("ActorComponent").global_position - global_position, "enemy", game_manager)
			new_bullet.global_position = global_position
			game_manager.add_child(new_bullet)
			
			cooldown_timer = attack_cooldown
	
	
	
	


func _on_enemy_hurtbox_area_entered(area: Area2D) -> void:
	takeDamage(area.bullet_damage)
	
	area.notify_bullet_hit()


func takeDamage(amount):
	$AnimationPlayer.stop()
	$AnimationPlayer.play("hurt")
	
	current_health = clampi(current_health - amount, 0, 99999)
	if current_health <= 0:
		destroy()
	

func destroy():
	queue_free()
	
