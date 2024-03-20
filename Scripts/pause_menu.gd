extends Control

var is_paused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		set_is_paused(!is_paused)

func set_is_paused(val):
	is_paused = val
	get_tree().paused = is_paused
	visible = is_paused

func _on_resume_button_pressed():
	set_is_paused(false)

func _on_quit_button_pressed():
	get_tree().quit()
