extends AnimatedSprite2D

class_name PlayerAnimatedSprite

func trigger_animation(velocity: Vector2, direction: int, player_mode: Player.PlayerMode):
	var animation_prefix = Player.PlayerMode.keys()[player_mode].to_snake_case()
	
	if not get_parent().is_on_floor():
		play("%s_jump" % animation_prefix)
#Handle slide animation
	elif sign(velocity.x) != sign(direction) && velocity.x != 0 && direction != 0:
		play("%s_slide" % animation_prefix)
		scale.x = direction
	else:
#Handle sprite direction
		if sign(velocity.x) == -1 || sign(velocity.x) == 1:
			scale.x = sign(velocity.x)
#Handle run and idle animations
		if velocity.x != 0:
			play("%s_run" % animation_prefix)
			speed_scale = clamp(abs(velocity.x * 0.03), 1, 2)
		else:
			play("%s_idle" % animation_prefix)
		
	
	
	
