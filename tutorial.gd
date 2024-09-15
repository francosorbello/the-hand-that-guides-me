extends Control

func toggle_tutorial():
    visible = !visible

func _on_tutorial_btn_pressed() -> void:
    toggle_tutorial()

func _on_button_pressed() -> void:
    toggle_tutorial()
    pass # Replace with function body.
