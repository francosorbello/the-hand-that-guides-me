extends Control
class_name ScreenshotTooltipManager

@export var tooltip_scene : PackedScene
@export var circle_manager : CircleManager

var tooltips_active : bool = false

func toggle_tooltip_screenshot() -> void:
    if tooltips_active:
        hide_tooltips()
    else:
        clear_and_show()

func clear_and_show():
    for tooltip in get_children():
        tooltip.queue_free()

    for circle in circle_manager.circles:
        var pos = circle.get_circle_tooltip_position()
        var tooltip = tooltip_scene.instantiate() as RichTextLabel
        
        add_child(tooltip)
        tooltip.text = circle.text
        tooltip.position = pos
    tooltips_active = true

func hide_tooltips():
    for tooltip in get_children():
        tooltip.queue_free()
    tooltips_active = false

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("show_tooltips"):
        toggle_tooltip_screenshot()

func _ready() -> void:
    circle_manager.circle_created.connect(_on_circle_created)

func _on_circle_created(_circle : Circle) -> void:
    print(tooltips_active)
    if tooltips_active:
        clear_and_show()