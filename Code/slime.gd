#SLIME
class_name Slime
extends CharacterBody2D

#Variables
var player_position
var target
var direction: int = 1
var is_dead: bool = false

@onready var player = get_parent().get_node('Player')
@onready var animation = $Animation
@onready var raycast = $RayCast2D
@onready var body_area = $BodyArea  

func _ready() -> void:
	print("SLIME LOADED")
	animation.play("Idle")
	player_position = player.position

func _physics_process(delta: float) -> void:
	_Movement(delta)
	_InRangeToTakeDamage()
	_PlayerTracking()

func _Movement(delta: float) -> void: #Movement,collision and direction
	if not is_on_floor():
		velocity += get_gravity() * delta  

	if velocity.x > 0:
		animation.flip_h = false

	elif velocity.x < 0:
		animation.flip_h = true
	
	else:
		animation.play("Idle")
		animation.flip_h = false

	move_and_slide()

func _InRangeToTakeDamage() -> void: #Damage logic-1
	if position.distance_to(player_position) <= G.P_ATK_RANGE and player.attacking:
		_TakeDamage(10)

func _TakeDamage(damage: int) -> void: #Damage logic-2
	G.S_HP -= damage
	print("---------------------------------")
	print("Slime health:", G.S_HP)
	print("---------------------------------")

	if G.S_HP <= 0 and not is_dead:
		is_dead = true
		velocity = Vector2.ZERO
		animation.play("Death") 
		queue_free()

func _PlayerTracking(): #Player position tracking
	player_position = player.position
	target = (player_position - position).normalized()

	if position.distance_to(player_position) > 3:
		velocity.x = target.x * G.S_SPEED  
		animation.play("Run")

	else:
		velocity.x = 0  
		animation.play("Idle")
