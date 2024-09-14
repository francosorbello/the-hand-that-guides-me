extends Control

@export var circle_scene : PackedScene
@export var start_radius : float
@export var radius_increment : float

var current_visibility_index : int = 0
var current_radius : float = start_radius

func spawn_circle():
    var circle : CircleView = circle_scene.instantiate()
    
    add_child(circle)

    circle.global_position = get_viewport_rect().size / 2
    print(current_radius,",",current_radius+radius_increment)
    circle.set_radius(current_radius, current_radius+radius_increment)
    circle.z_index = current_visibility_index
    
    current_radius = current_radius+radius_increment 
    current_visibility_index -= 1

func _ready() -> void:
    current_radius = start_radius
    spawn_circle()
    spawn_circle()
    spawn_circle()
