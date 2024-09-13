extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("frontidle")

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		play_anim(1)
		current_dir = "left"
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		play_anim(1)
		current_dir = "down"
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		play_anim(1)
		current_dir = "up"
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0

	move_and_slide()

func play_anim(movement):
	var anim = $AnimatedSprite2D

	if current_dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("sidewalk")
		else:
			anim.play("sideidle")
	elif current_dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("sidewalk")
		else:
			anim.play("sideidle")
	elif current_dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("backwalk")
		else:
			anim.play("backidle")
	elif current_dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("walk")
		else:
			anim.play("frontidle")
