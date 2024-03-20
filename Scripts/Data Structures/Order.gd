class_name Order
extends RefCounted

var cup_size : Cup.CupSize
var ingredients_needed : Array[Ingredient]

func _init(temp_cup_size, temp_needed):
	cup_size = temp_cup_size
	for element in temp_needed:
		var ingredient_name = element[0]
		var ingredient_type = element[1]
		ingredients_needed.append(Ingredient.new(ingredient_name, ingredient_type))
