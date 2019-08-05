extends Label

func _ready():
	get_node("../Butt").connect("score_change", self, "on_score_change")

func on_score_change(score):
	text = "Score: %s" % score
