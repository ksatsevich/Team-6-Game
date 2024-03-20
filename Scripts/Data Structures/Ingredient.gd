class_name Ingredient
extends RefCounted

enum IngredientType {MILK, SYRUP, TOPPING, ESPRESSO, OTHER}

var name : String
var type : IngredientType

func _init(temp_name : String, temp_type : IngredientType):
	name = temp_name
	type = temp_type
