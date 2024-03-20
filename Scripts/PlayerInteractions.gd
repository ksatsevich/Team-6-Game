extends Node

var current_zone : Node2D
var cup_carrying : Cup
var order_doing : Order

@export var order_ui : Node
@export var cup_ui : Node

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		if current_zone != null:
			var returned_obj = current_zone.interact()
			do_interaction_logic(returned_obj)
		else:
			print("Not doing anything...")


func do_interaction_logic(object):
	if object == null: return
	if object is Cup:
		cup_carrying = object
		update_cup()
	if object is Ingredient and cup_carrying: 
		cup_carrying.add_ingredient(object)
		update_cup()
	if object is Order:
		if order_doing == null: 
			order_doing = object
			update_order()
		else:
			deliver(object)
			
func update_cup():
	var text_to_display = "Current Cup:\n"
	if cup_carrying == null: 
		cup_ui.get_node("TextEdit").text = text_to_display + "Nothing"
		return
	text_to_display += str(Cup.CupSize.keys()[cup_carrying.cup_size]) + " size\n"
	for ingredient in cup_carrying.ingredients_in_cup:
		text_to_display += ingredient.name + "\n"
	cup_ui.get_node("TextEdit").text = text_to_display

func update_order():
	var text_to_display = "Current Order:\n"
	text_to_display += str(Cup.CupSize.keys()[order_doing.cup_size]) + " size\n"
	for ingredient in order_doing.ingredients_needed:
		text_to_display += ingredient.name + "\n"
	order_ui.get_node("TextEdit").text = text_to_display

func deliver(requested : Order):
	var incorrect : bool
	if not cup_carrying or cup_carrying.cup_size != requested.cup_size:
		incorrect = true
	if not cup_carrying or len(cup_carrying.ingredients_in_cup) != len(requested.ingredients_needed):
		incorrect = true
	if not incorrect:
		for counter in len(cup_carrying.ingredients_in_cup):
			if cup_carrying.ingredients_in_cup[counter].name != requested.ingredients_needed[counter].name:
				incorrect = true
	if incorrect: order_ui.get_node("TextEdit").text = "Yuck! This isn't\nwhat I ordered!"
	else: order_ui.get_node("TextEdit").text = "Ah! Just what\nI ordered."
	order_doing = null
	cup_carrying = null
	update_cup()
	
