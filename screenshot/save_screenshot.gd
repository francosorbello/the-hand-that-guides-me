extends Node

@export var viewport : Viewport
@export var screenshot_tooltip_manager : ScreenshotTooltipManager


func _on_file_dialog_dir_selected(dir:String) -> void:
    var img = viewport.get_texture().get_data()
    img.save_png(dir + "/screenshot.png")

func _on_button_pressed() -> void:
    $FileDialog.popup()

func _on_file_dialog_file_selected(path:String) -> void:
    screenshot_tooltip_manager.toggle_tooltip_screenshot()
    await get_tree().create_timer(0.5).timeout
    var img = viewport.get_texture().get_image() 
    var result = img.save_png(path)
    if result == OK:
        print("Screenshot saved to: " + path)
    else:
        print("Error saving screenshot to: " + path)
