extends "res://Scripts/Data Structures/Station.gd"

@export var ingredient_name : String
@export var type : Ingredient.IngredientType

func _ready():
	pass
	
func interact():
	print("Got a new Ingredient. Name is is {} and type is {}".format([ingredient_name, type], "{}"))
	if $"." or $"../Node2D5" or $"../Node2D6":
		$"../../MilkPour".play()
	elif $"../Node2D4" or $"../Node2D8" or $"../Node2D7" or $"../Node2D3":
		$"../../Syrups".play()
	return Ingredient.new(ingredient_name, type)


func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		print("Player has entered")
		body.get_node("PlayerInteractions").current_zone = self


func _on_area_2d_body_exited(body):
	if(body.name == "Player"):
		print("The player has left ingredient station")
		body.get_node("PlayerInteractions").current_zone = null
