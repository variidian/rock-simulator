extends Control
@onready var start_b = $"menu stuff/START"
@onready var credits_b = $"menu stuff/CREDITS"
@onready var quit_b = $"menu stuff/QUIT"
@onready var credits_panel = $"background stuff/Panel"
@onready var credits_text = $"background stuff/credits_Text"
@onready var credits_anim = $"background stuff/credits_anim"
func _ready() -> void:
	#the auto-selected first option focused
	start_b.grab_focus()
	#hide credits section; shows when credits button is triggered
	credits_text.hide()
	credits_panel.hide()
func _process(delta: float) -> void:
	#buttons resizing upon focus
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
func _on_quit_pressed() -> void: #quit game trigger
	get_tree().quit()
	Click.play()
func _on_credits_pressed() -> void: #credits trigger
	Click.play()
	if credits_text.is_visible_in_tree():
		credits_anim.play_backwards("credits_roll")
		await credits_anim.animation_finished
		credits_text.hide()
		credits_panel.hide()
	else:
		credits_text.show() 
		credits_panel.show()
		credits_anim.play("credits_roll")
	
func _on_start_pressed() -> void:
	Click.play()


#SFX
func startbutton_focused() -> void:
	Switch.play()
func _on_credits_focus_entered() -> void:
	Switch.play()
func quitbutton_focused() -> void:
	Switch.play()
