extends Node2D

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()



func bounce(direction, magnitude):
	
	var bounce_tween = get_tree().create_tween()
	bounce_tween.tween_property(self, "global_position", global_position + (direction * magnitude), 1.0).set_trans(Tween.TRANS_CIRC)
	
	
	
	
