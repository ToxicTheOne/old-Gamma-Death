extends Area2D

# Nodes
#@onready var collision_shape : CollisionShape2D = $collisionshape
#@onready var sprite : Sprite2D = $sprite


# Variables
var bullet_damage = 10
var bullet_speed = 420
var bullet_direction = Vector2.ZERO

var destroy_timer = 20.0


func construct(damage, speed, direction, source, g_man):
	bullet_damage = damage
	bullet_speed = speed
	bullet_direction = direction
	
	match source:
		"player":
			set_collision_layer_value(4, true)
		"enemy":
			set_collision_layer_value(5, true)
	
	



func _physics_process(delta: float) -> void:
	global_position += bullet_direction * bullet_speed * delta
	global_position = floor(global_position)
	
	destroy_timer -= delta
	if destroy_timer <= 0.0: destroy()
	

# UI hit notification
func notify_bullet_hit(direction = bullet_direction):
	var new_notif = Autoload.damage_notif_scene.instantiate()
	new_notif.get_node("Label").text = str(bullet_damage)
	new_notif.global_position = global_position
	
	Autoload.add_child(new_notif)
	await get_tree().process_frame
	new_notif.bounce(direction, 0.4)
	
	


# when hitting player, destroy
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.take_damage(bullet_damage)
		destroy()
	


func destroy():
	$AnimationPlayer.play("explode")
	await  $AnimationPlayer.animation_finished
	queue_free()
