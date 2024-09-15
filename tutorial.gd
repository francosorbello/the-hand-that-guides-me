extends Control

func toggle_tutorial():
    visible = !visible

func _on_tutorial_btn_pressed() -> void:
    toggle_tutorial()
