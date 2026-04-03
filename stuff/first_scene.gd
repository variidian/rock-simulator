extends Node2D
var dialogues = [
	preload("res://stuff/1.dialogue"),
	preload("res://2.dialogue"),
	preload("res://3.dialogue"),
	preload("res://4.dialogue"),
	preload("res://5.dialogue"),
	preload("res://6.dialogue"),
	preload("res://7.dialogue"),
	preload("res://8.dialogue"),
	preload("res://9.dialogue"),
	preload("res://10.dialogue"),
]
var start_time: int
var elapsed_time_seconds: float
var last_sec_triggered: int = -1
var rand
func _ready() -> void:
	start_time = Time.get_ticks_msec()

func _process(delta: float) -> void:
	var current_time = Time.get_ticks_msec() 
	elapsed_time_seconds = (current_time - start_time) / 1000.0
	var whole_seconds := int(elapsed_time_seconds)
	if whole_seconds > 0 and whole_seconds % 10 == 0 and whole_seconds != last_sec_triggered:
		last_sec_triggered = whole_seconds
		randomize()
		rand = randi_range(0, 5)
		DialogueManager.show_dialogue_balloon(dialogues[rand],"start")
