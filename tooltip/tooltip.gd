extends Control
class_name Tooltip

func _ready():
    hide_tooltip()

func show_tooltip(text : String):
    $RichTextLabel.text = text
    visible = true
    draw.emit()

func hide_tooltip():
    visible = false

func _physics_process(_delta: float) -> void:
    if visible:
        global_position = get_global_mouse_position() + Vector2(20, -10)

func _draw():
    if visible:
        var tooltip_rect = get_transform()
        print(tooltip_rect.size)
        var downLeftPoint = Vector2(-tooltip_rect.size.y,0);
        draw_rect(get_rect(), Color(1, 1, 1, 0.8))
        draw_circle(downLeftPoint, 5, Color(1, 1, 1, 0.8))
        draw_line(downLeftPoint,get_local_mouse_position(),Color(1, 1, 1, 0.8), 1, true)
