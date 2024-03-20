extends Node2D


func _ready():
	pass
	
func interact():
	push_error("UNIMPLEMENTED ERROR: There is no definition for interact() (What interaction needs to happen?)")


func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		body.get_node("PlayerInteractions").current_zone = self


func _on_area_2d_body_exited(body):
	if(body.name == "Player"):
		print("The player has left...")
		body.get_node("PlayerInteractions").current_zone = null
