extends CharacterBody2D

@export var SPEED = 400.0
@onready var anim = $AnimatedSprite2D
@onready var actionable_finder = $Direction/ActionableFinder
@onready var footstep_player = $footstep



# Get the gravity from the project settings to be synced with RigidBody nodes.
var screen_size

# Used to calculate idle sprite logic
var direction_facing
	
func _ready():
	screen_size = get_viewport_rect().size
	direction_facing = "down"

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("conversation_button"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			#$dialogue_sounds.play()
			actionables[0].action()
			return
		

func _process(delta):
	
	var is_moving = Input.is_action_pressed("move_up") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_right")

	
	if is_moving and !footstep_player.playing:
		footstep_player.play()
	elif !is_moving and footstep_player.playing:
		footstep_player.stop()
	
	
	
	
	
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	
	do_animations(velocity)
		
	move_and_collide(velocity * delta)
	

	# Removing for the moment so that the player can roam freely
	# position = position.clamp(Vector2.ZERO, screen_size)
	
# Handles animations and sets sprite according to the velocity
func do_animations(velocity):
	if velocity.y < 0:
		anim.play("up_walk")
		direction_facing = "up"
	elif velocity.y > 0:
		anim.play("down_walk")
		direction_facing = "down"
	elif velocity.x > 0:
		anim.play("side_walk")
		direction_facing = "right"
		anim.flip_h = false
	elif velocity.x < 0:
		anim.play("side_walk")
		direction_facing = "left"
		anim.flip_h = true
	


	
	
	
	if velocity.x == 0 and velocity.y == 0:
		match direction_facing:
			"up":
				anim.play("up_idle")
			"down":
				anim.play("down_idle")
			"left":
				anim.play("side_idle")
			"right":
				anim.play("side_idle")
			_:
				printerr("Line 64 in Player.gd, No direction found!")
				
