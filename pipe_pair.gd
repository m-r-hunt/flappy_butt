extends Node2D

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "on_exited_screen")

func _physics_process(delta):
	transform = transform.translated(Vector2(-1.0, 0.0))

func on_exited_screen():
	transform = transform.translated(Vector2(400.0, 0.0))