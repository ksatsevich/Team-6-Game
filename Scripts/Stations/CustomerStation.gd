extends "res://Scripts/Data Structures/Station.gd"

var has_given_order : bool
var has_received_drink : bool

var order_waiting_on : Order

func _ready():
	pass
	
func interact():
	if not has_given_order: 
		has_given_order = true
		print("Customer has made an order!")
		return create_order()
	else:
		has_given_order = false
		return order_waiting_on

func create_order():
	var cup_size = RandomNumberGenerator.new().randi_range(0, 2)
	print(cup_size)
	var milks = ["2% Milk", "Oat Milk", "Nonfat Milk"]
	var syrups = ["Vanilla", "Caramel", "Brown Sugar", "Matcha"]
	var ingredients = []
	ingredients.append([milks[RandomNumberGenerator.new().randi_range(0, 2)], Ingredient.IngredientType.MILK])
	ingredients.append([syrups[RandomNumberGenerator.new().randi_range(0, 3)], Ingredient.IngredientType.SYRUP])
	ingredients.append(["Espresso", Ingredient.IngredientType.ESPRESSO])
	order_waiting_on = Order.new(cup_size, ingredients)
	return order_waiting_on

func _on_speaking_area_body_entered(body):
	if(body.name == "Player"):
		print("The player has entered the interaction zone with the customer")
		body.get_node("PlayerInteractions").current_zone = self

func _on_speaking_area_body_exited(body):
	if(body.name == "Player"):
		print("The player has left customer")
		body.get_node("PlayerInteractions").current_zone = null
