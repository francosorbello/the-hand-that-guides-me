extends Camera2D

var zoom_speed = 0.1

func _process(delta: float) -> void:
    if Input.is_action_just_released("zoom_in"):
        zoom += Vector2(1, 1) * zoom_speed
    if Input.is_action_just_released("zoom_out"):
        zoom -= Vector2(1, 1) * zoom_speed