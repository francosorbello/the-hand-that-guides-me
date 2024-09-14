extends Control
class_name CircleView

var min_radius: float = 0
var max_radius: float = 0
var mouse_inside : bool = false
var selected_color = get_random_color()

func _draw() -> void:
    draw_circle(Vector2.ZERO, max_radius, selected_color)
    pass

func get_random_color():
    return Color(randf(), randf(), randf())

func set_text(text : String):
    tooltip_text = text

func set_radius(min_r : float, max_r):
    min_radius = min_r
    max_radius = max_r


func _process(_delta: float) -> void:
    if not mouse_inside && inside_circle():
        mouse_inside = true
        # mouse_entered_circle.emit()
        print(get_global_mouse_position().distance_to(global_position),",",min_radius)
        mouse_entered.emit()
    else:
        if mouse_inside && not inside_circle():
            mouse_inside = false
            print(get_global_mouse_position().distance_to(global_position),",",max_radius,",",inside_circle())
            # mouse_exited_circle.emit()
            mouse_exited.emit()

func inside_circle() -> bool:
    var inside_max = get_global_mouse_position().distance_to(global_position) < max_radius
    var inside_min = get_global_mouse_position().distance_to(global_position) > min_radius
    return inside_max && true

func _on_mouse_entered() -> void:
    # print("mouse entered ", str(min_radius))
    pass # Replace with function body.


func _on_mouse_exited() -> void:
    # print("mouse exited ", str(min_radius))
    pass # Replace with function body.
