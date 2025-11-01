class_name MovingCamera 
extends Camera2D


@export var _move_speed: float = 200
@export var _zoom_speed: float = 2.0
@export var _min_max_zoom: Vector2 = Vector2(0.4, 4)


func _physics_process(delta: float) -> void:
	var dir: Vector2 = Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down")
	global_position += dir * _move_speed * delta
	zoom.x += Input.get_axis("zoom_out", "zoom_in") * _zoom_speed * delta
	zoom.x = clampf(zoom.x, _min_max_zoom.x, _min_max_zoom.y)
	zoom.y = zoom.x
