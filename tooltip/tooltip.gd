extends Control
class_name tooltip

func set_text(text : String):
    $VBoxContainer/RichTextLabel.text = text

func _physics_process(delta: float) -> void:
    global_position = get_global_mouse_position() + Vector2(10, 10)
