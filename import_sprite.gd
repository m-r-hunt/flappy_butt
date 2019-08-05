extends Sprite

class_name ImportSprite

tool

export var seconds_per_frame = 1.0 / 30.0
export var my_filename = "" setget set_sprite
var animations = {}

func _ready():
	if !Engine.is_editor_hint():
		set_sprite(my_filename)

func set_sprite(filename):
	my_filename = filename
	var directory = Directory.new()
	if directory.file_exists("res://" + my_filename + ".png") && directory.file_exists("res://" + my_filename + ".json"):
		set_frame(0)
		var tx = load("res://" + my_filename + ".png")
		set_texture(tx)
		var file = File.new()
		file.open("res://" + my_filename + ".json", File.READ)
		var json = JSON.parse(file.get_as_text()).result
		set_hframes(json.frames.size())
		for anim in json.meta.frameTags:
			animations[anim.name] = [anim.from, anim.to]
		add_animations()

func add_animations():
	for key in animations:
		var anim_data = animations[key]
		var anim = Animation.new()
		anim.set_loop(false)
		var track_index = anim.add_track(Animation.TYPE_VALUE)
		anim.track_set_path(track_index, ".:frame")
		for i in range(0, anim_data[1] - anim_data[0]+1):
			anim.track_insert_key(track_index, i*seconds_per_frame, anim_data[0]+i)
		anim.set_length((anim_data[1]-anim_data[0] + 1)*seconds_per_frame)
		anim.value_track_set_update_mode(track_index, Animation.UPDATE_DISCRETE)
		if has_node("AnimationPlayer"):
			get_node("AnimationPlayer").add_animation(key, anim)
