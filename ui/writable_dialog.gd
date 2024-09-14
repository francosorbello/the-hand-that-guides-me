extends ConfirmationDialog

@export var titles : Array[String]

var current_text : String
signal text_confirmed(text : String)
signal text_cancelled()

func _on_text_edit_text_changed() -> void:
    current_text = $TextEdit.text

func _on_confirmed() -> void:
    if current_text.is_empty():
        return
    emit_signal("text_confirmed", current_text)
    clear_text()
    pass # Replace with function body.

func _on_canceled() -> void:
    clear_text()
    emit_signal("text_cancelled")
    pass # Replace with function body.

func clear_text():
    $TextEdit.text = ""

func _on_visibility_changed() -> void:
    var selected_title = titles[randi() % titles.size()]
    $TextEdit.placeholder_text = "Hint: "+selected_title
    pass # Replace with function body.
