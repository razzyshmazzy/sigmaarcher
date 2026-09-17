extends Node

var score: int = 0

func update_score(amount: int) -> void:
	score += amount
	var score_label = get_tree().current_scene.find_child("ScoreLabel", true, false)
	if score_label:
		score_label.text = "Score: " + str(score)
