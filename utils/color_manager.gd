extends Node
class_name ColorManager

@export var palette : Array[Color] = []

var picked_colors : Array[Color] = []

func get_color() -> Color:
    if picked_colors.size() == palette.size():
        picked_colors = []
    
    var color = palette[randi() % palette.size()]
    
    if color in picked_colors:
        return get_color()
    
    picked_colors.append(color)
    return color.inverted()