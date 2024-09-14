extends Control

@export var circle_scene : PackedScene
@export var start_radius : float
@export var radius_increment : float

var current_visibility_index : int = 0
var current_radius : float = start_radius
var circles : Array[Circle] = []

@export var circle_container : Node
@export var color_manager : ColorManager

signal circle_created(circle : Circle)

func _ready() -> void:
    current_radius = start_radius

func spawn_circle(text : String):
    var circle : Circle = circle_scene.instantiate()

    # circle.global_position = get_viewport_rect().size / 2
    circle.set_radius(current_radius, current_radius+radius_increment)
    circle.z_index = current_visibility_index
    circle.set_text(text)
    circle.selected_color = color_manager.get_color()
    
    current_radius = current_radius+radius_increment 
    current_visibility_index -= 1
    
    # circle_container.add_child(circle)
    add_child(circle)
    circle_created.emit(circle)
    
    circles.append(circle)



func _on_confirmation_dialog_text_confirmed(text:String) -> void:
    spawn_circle(text)
    pass # Replace with function body.
