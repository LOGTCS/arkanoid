extends CharacterBody2D
class_name Paddle

@export var move_speed = 300

@export var launch_angle = 30

enum {STATE_SERVE, STATE_PLAY}

var current_state = STATE_SERVE

func _ready() -> void:
	$Ball.set_physics_process(false)
	
func _physics_process(delta: float) -> void:
	#Input.
	var dir = Input.get_axis("ui_left", "ui_right")
	
	#Movement.
	self.velocity.x = dir * move_speed
	
	move_and_slide()

func serve() -> void:
	if current_state == STATE_PLAY: return
	
	var choice_angles : Array = [-launch_angle, launch_angle]
	current_state = STATE_PLAY
	
	#Enable ball.
	$Ball.set_physics_process(true)
	
	$Ball.top_level = true
	$Ball.global_position = $Marker2D.global_position
	
	#left or right
	$Ball.global_rotation_degrees = -90 +\
	choice_angles.pick_random()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		serve()
