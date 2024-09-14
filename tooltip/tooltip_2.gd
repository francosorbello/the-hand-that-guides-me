extends HBoxContainer
class_name Tooltip2

var follow_mouse : bool = true

func _ready():
    hide_tooltip()

func show_tooltip(text : String):
    $MarginContainer/RichTextLabel.text = text
    visible = true
    draw.emit()

func hide_tooltip():
    visible = false

func _physics_process(_delta: float) -> void:
    if visible and follow_mouse:
        global_position = get_global_mouse_position() + Vector2(20, -10)
        # position = get_local_mouse_position() + Vector2(20, -10)

func _draw():
    if visible:
        var tooltip_rect = get_rect()
        tooltip_rect.position = Vector2.ZERO
        draw_rect(tooltip_rect, Color(0, 0, 0, 0.8))
