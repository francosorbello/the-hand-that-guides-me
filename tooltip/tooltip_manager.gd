extends Control

@export var tooltip_scene : PackedScene
var current_tooltip : Tooltip2

var tooltip_enabled : bool = true

func show_tooltip(text : String):
    current_tooltip.show_tooltip(text)

func hide_tooltip():
    current_tooltip.hide_tooltip()

func _ready() -> void:
    current_tooltip = tooltip_scene.instantiate()
    get_tree().get_root().add_child.call_deferred(current_tooltip)

func enable():
    current_tooltip.set_enabled(true)

func disable():
    current_tooltip.set_enabled(false)