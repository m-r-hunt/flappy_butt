extends Node

export var high_score = 0

func submit_score(score):
	if score > high_score:
		high_score = score
		return true
	return false
