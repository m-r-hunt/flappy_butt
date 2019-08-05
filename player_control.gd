extends RigidBody2D

export var flap_power = 50.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("flap"):
		set_linear_velocity(Vector2(0.0, -flap_power))
		get_node("ImportSprite/AnimationPlayer").play("Flap")
	if linear_velocity.y > 0.0:
		get_node("ImportSprite/AnimationPlayer").play("Idle")
