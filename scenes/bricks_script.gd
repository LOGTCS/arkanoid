extends Node2D

@export var rows : int

@onready var brick_scene = preload("res://scenes/bricks.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_bricks()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_bricks() -> void:
	var spacing = 42
	var row_spacing = 28
	for r in rows:
		for i in 14:
			var instance = brick_scene.instantiate()
			instance.add_to_group("removable")
			add_child(instance)
			instance.global_position = Vector2(spacing * i, r * row_spacing)
		
		
