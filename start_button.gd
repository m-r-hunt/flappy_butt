extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	get_tree().paused = true
	connect("button_down", self, "_on_button_pressed")

func _on_button_pressed():
	get_tree().paused = false
	queue_free()
