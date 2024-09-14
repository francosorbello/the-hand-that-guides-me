extends ColorRect


func _on_circle_manager_circle_created(circle:Circle) -> void:
    var new_color = circle.selected_color
    color = new_color.inverted()
    pass # Replace with function body.
