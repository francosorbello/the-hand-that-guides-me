extends Control
class_name ScreenshotTooltipManager

@export var tooltip_scene : PackedScene
@export var circle_manager : CircleManager

var tooltips_active : bool = false

func toggle_tooltip_screenshot() -> void:
    print(tooltips_active)
    if tooltips_active:
        for tooltip in get_children():
            tooltip.queue_free()
            tooltips_active = false
    else:
        for circle in circle_manager.circles:
            var pos = circle.get_circle_tooltip_position()
            var tooltip = tooltip_scene.instantiate() as RichTextLabel
            
            add_child(tooltip)
            tooltip.text = circle.text
            tooltip.position = pos
            tooltips_active = true


func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("show_tooltips"):
        toggle_tooltip_screenshot()