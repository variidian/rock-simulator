extends Control
@onready var start_b = $"menu stuff/START"
@onready var credits_b = $"menu stuff/CREDITS"
@onready var quit_b = $"menu stuff/QUIT"
func _ready() -> void:
	start_b.grab_focus()
func _process(delta: float) -> void:
	if start_b.has_focus():
		start_b.position.x = 1040
		start_b.size.x = 895
	if not start_b.has_focus():
		start_b.size.x = 722
		start_b.position.x = 1200
	if credits_b.has_focus():
		credits_b.size.x = 656
		credits_b.position.x = 1268
	if not credits_b.has_focus():
		credits_b.size.x = 423
		credits_b.position.x = 1501
	if quit_b.has_focus():
		quit_b.size.x = 908
		quit_b.position.x = 1015
	if not quit_b.has_focus():
		quit_b.size.x = 512
		quit_b.position.x = 1411
	
