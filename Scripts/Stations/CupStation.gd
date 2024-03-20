extends "res://Scripts/Data Structures/Station.gd"

@export var cup_size : Cup.CupSize

func _ready():
	pass
	
func interact() -> Cup:
	print("Got a new cup. Size is {}".format([cup_size], "{}"))
	$"../../GlassPickUp".play()
	return Cup.new(cup_size)


func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		body.get_node("PlayerInteractions").current_zone = self


func _on_area_2d_body_exited(body):
	if(body.name == "Player"):
		print("The player has left cups")
		body.get_node("PlayerInteractions").current_zone = null
