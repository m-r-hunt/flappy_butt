extends Area2D

func _ready():
	connect("body_entered", self, "on_butt_entered")

func on_butt_entered(body):
	print("Score 1")
	body.score_point()
