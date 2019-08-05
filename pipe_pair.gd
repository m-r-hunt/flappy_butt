extends Node2D

var state = "playing"

func _ready():
	pass

func _physics_process(delta):
	match state:
		"playing":
			transform = transform.translated(Vector2(-1.0, 0.0))
			if transform.origin.x < -50.0:
				transform = transform.translated(Vector2(400.0, 0.0))
				transform.origin.y = 80.0 + randf() * 50.0 - 25.0
