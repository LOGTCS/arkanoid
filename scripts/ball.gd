extends CharacterBody2D
class_name Ball

@export var ball_speed = 400

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	#Set rotation to a fixed value.
	readjust_graphics()
	
	#Movement.
	var movement = Vector2.RIGHT.rotated(self.rotation) * ball_speed * delta
	
	var collision = move_and_collide(movement)
	
	if collision:
		#Bounce.
		self.rotation = Vector2.from_angle(self.rotation)\
		.bounce(collision.get_normal()).angle()
		readjust_graphics()
		print("충돌한 객체: ", collision.get_collider_id())
		if collision.get_collider().is_in_group("removable"):
			print("파괴 가능 객체이므로 파괴합니다.")
			collision.get_collider().queue_free()
			# 파괴 가능 객체의 점수를 점수에 추가함.
			

func readjust_graphics() -> void:
	$graphics.global_rotation = 0
