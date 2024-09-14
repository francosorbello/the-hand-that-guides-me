extends AudioStreamPlayer

@export var notes : Array[AudioStream]

var played_notes : Array[AudioStream]

func play_random_note() -> void:
    var random_note = notes[randi() % notes.size()]
    if played_notes.size() == notes.size():
        played_notes.clear()
    
    if random_note in played_notes:
        play_random_note()
        return
    stream = random_note
    play()
    played_notes.append(random_note)
    pass # Replace with function body.