extends Node

@onready var high_score_value = $SafeAreaN2D/HighScoreValue

func _ready():
	load_high_score()

func load_high_score():
	var high_score_ls = HIGH_SCORE_LOCAL_STORAGE.new()
	var high_score = high_score_ls.load_high_score()
	high_score_value.text = str(high_score)

func to_level_1():
	get_tree().change_scene_to_file(SCENE_CONST.LEVEL_1)

func to_guide():
	get_tree().change_scene_to_file(SCENE_CONST.GUIDE)
