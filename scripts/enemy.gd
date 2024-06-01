extends Area2D

class_name Enemy

@export var horizontal_speed = 20
@export var vertical_speed = 100

@onready var ray_cast_2d = $RayCast2D as RayCast2D

func _process(delta):
	position.x -= delta * horizontal_speed
	
	if !ray_cast_2d.is_colliding():
		position.y += delta * vertical_speed
