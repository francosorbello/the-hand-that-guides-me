extends Button

var sound_on : bool = true
var music_bus : int = 0
@export var muted_color : Color

func _on_pressed() -> void:
    AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
    modulate = muted_color if AudioServer.is_bus_mute(music_bus) else Color.WHITE
    
