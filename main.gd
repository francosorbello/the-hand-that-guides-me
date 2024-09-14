extends Control

func _on_button_pressed() -> void:
    $ConfirmationDialog.popup_centered()
    pass # Replace with function body.


func show_all_dialogs() -> void:
    var circle_manager = $MainViewport/SubViewport/Circles/SubViewport/CircleManager as CircleManager
    for circle in circle_manager.circles:
        circle.show_circle_tooltip()

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("show_tooltips"):
        show_all_dialogs()
        pass # Replace with function body.