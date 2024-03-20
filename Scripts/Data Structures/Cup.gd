class_name Cup
extends RefCounted

enum CupSize {SMALL, MEDIUM, LARGE}

var cup_size : CupSize
var ingredients_in_cup : Array[Ingredient]

func _init(temp_cup_size : CupSize):
	cup_size = temp_cup_size
	ingredients_in_cup = []
	
func add_ingredient(adding : Ingredient) -> void:
	ingredients_in_cup.append(adding)
