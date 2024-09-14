extends Camera2D

var zoom_speed = 0.1

func _process(_delta: float) -> void:
    var new_zoom = Vector2(1,1) * zoom_speed
    var mod = 0
    if Input.is_action_just_released("zoom_in"):
        mod = 1
    if Input.is_action_just_released("zoom_out"):
        mod = -1

    if zoom + mod*new_zoom != Vector2(0,0):
        zoom += new_zoom * mod
