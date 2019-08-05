extends Sprite

export var speed = 0.5
var stop = false

func _physics_process(delta):
	if stop:
		return
	transform.origin.x -= speed
	if transform.origin.x < -120:
		transform.origin.x += 240
