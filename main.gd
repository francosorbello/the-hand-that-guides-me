extends Control

func _on_button_pressed() -> void:
    $ConfirmationDialog.popup_centered()
    pass # Replace with function body.

func _ready():
    $MainViewport/SubViewport.canvas_item_default_texture_filter = Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST
    $MainViewport/SubViewport/BG/SubViewport.canvas_item_default_texture_filter = Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST
    $MainViewport/SubViewport/Circles/SubViewport.canvas_item_default_texture_filter = Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST
    $MainViewport/SubViewport/AddButton/SubViewport.canvas_item_default_texture_filter = Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST