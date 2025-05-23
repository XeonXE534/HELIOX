#PLAYER
class_name Player
extends CharacterBody2D

#variables
var attacking: bool = false
var jumping: bool = false
var direction2: bool = false

@onready var animation = $Animations

func _ready() -> void:
	print("PLAYER LOADED")
	animation.play("Idle")

func _process(_delta: float) -> void:
	_AnimationLogic()

func _physics_process(_delta: float) -> void:
	_Attack()
	_Gravity()
	_Jump()
	_Movement()

func _Attack(): #Attack logic
	if Input.is_action_just_pressed("SPACE") and attacking == false:	
		attacking = true
		$AtkTimer.start()

	elif Input.is_action_just_released('SPACE') and attacking == true:
		attacking = false
		$AtkTimer.stop()

func _Gravity(): #Gravity logic
	if not is_on_floor():
		velocity.y += G.P_GRAVITY

	if is_on_ceiling():
		velocity.y += G.P_GRAVITY * 2

	if is_on_floor():
		velocity.y = 0

func _Jump(): #Jump logic
	if Input.is_action_just_pressed("W") and is_on_floor() and attacking == false:
		velocity.y = G.P_JUMP_VELOCITY
		jumping = true

func _Movement(): #Movement logic
	var direction := Input.get_axis("A", "D")

	if direction:
		velocity.x = direction * G.P_SPEED

		if direction > 0:
			direction2 = false
		elif direction < 0:
			direction2 = true

	else:
		velocity.x = move_toward(velocity.x, 0, G.P_SPEED)

	move_and_slide()

func _AnimationLogic(): #Animation logic
	if attacking: #Attack animation logic
		animation.play("Atk-1")

	elif not is_on_floor(): #Jump and fall animation logic

		if jumping:
			animation.play("Jump")

		if velocity.y >= 10:
			animation.play("Fall")

	elif is_zero_approx(velocity.x): #Idle animation logic
		animation.play("Idle")

	else:
		animation.play("Run") #Run animation logic

	#Direction fliping animation thingy logic
	animation.flip_h = direction2
