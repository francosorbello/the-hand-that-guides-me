extends Control
class_name Circle

var min_radius: float = 0
var max_radius: float = 0
var mouse_inside : bool = false
var selected_color = Color.WHITE
var text : String

@export var tooltip_scene : PackedScene

func _draw() -> void:
    draw_circle(Vector2.ZERO, max_radius, selected_color,true,-1,true)

func get_random_color() -> Color:
    return Color(randf(), randf(), randf())

func set_text(_text : String):
    self.text = _text

func set_radius(min_r : float, max_r):
    min_radius = min_r
    max_radius = max_r

func _process(_delta: float) -> void:
    if not mouse_inside && inside_circle():
        mouse_inside = true
        mouse_entered.emit()
    else:
        if mouse_inside && not inside_circle():
            mouse_inside = false
            mouse_exited.emit()

func inside_circle() -> bool:
    var inside_max = get_global_mouse_position().distance_to(global_position) < max_radius
    var inside_min = get_global_mouse_position().distance_to(global_position) > min_radius
    return inside_max && inside_min 

func _on_mouse_entered() -> void:
    TooltipManager.show_tooltip.call_deferred(text)
    pass # Replace with function body.


func _on_mouse_exited() -> void:
    TooltipManager.hide_tooltip()
    pass # Replace with function body.

func show_circle_tooltip() -> void:
    # var tooltip = $Tooltip as Tooltip2
    
    # tooltip.global_position = global_position
    # tooltip.position = Vector2(0,-max_radius/2); 

    # tooltip.show_tooltip(text)
    # tooltip.follow_mouse = false

    pass # Replace with function body.

func hide_circle_tooltip() -> void:
    pass
