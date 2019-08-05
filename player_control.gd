extends RigidBody2D

signal butt_died
signal butt_collision

export var flap_power = 50.0
var state = "playing"
var score = 0

func _ready():
	connect("body_entered", self, "on_collision")

func _physics_process(_delta):
	if transform.origin.y >= 260.0:
		emit_signal("butt_died")
		print(score)
	match state:
		"playing":
			if Input.is_action_just_pressed("flap") && transform.origin.y >= 0.0:
				set_linear_velocity(Vector2(0.0, -flap_power))
				get_node("ImportSprite/AnimationPlayer").play("Flap")
			if linear_velocity.y > 0.0:
				get_node("ImportSprite/AnimationPlayer").play("Idle")

func on_collision(_body):
	print("Colliding")
	set_collision_mask(0)
	set_collision_layer(0)
	apply_central_impulse(Vector2(50.0, -50.0))
	state = "dying"
	emit_signal("butt_collision")

func score_point():
	score += 1
