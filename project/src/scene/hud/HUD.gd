extends Node2D

signal start_game

@onready var score_lbl = $ScoreLbl
@onready var msg_lbl = $MsgLbl
@onready var msg_timer = $MsgTimer
@onready var start_btn = $StartBtn
@onready var back_btn = $BackBtn

func show_message(text):
	msg_lbl.text = text
	msg_lbl.show()
	msg_timer.start()

func show_game_over():
	show_message("Game Over")
	await msg_timer.timeout
	msg_lbl.text = "Enjoy!!"
	msg_lbl.show()
	await get_tree().create_timer(1).timeout
	start_btn.show()
	back_btn.show()

func update_score(score):
	score_lbl.text = str(score)

func on_start_game():
	start_btn.hide()
	back_btn.hide()
	emit_signal("start_game")

func hide_msg():
	msg_lbl.hide()

func to_main():
	get_tree().change_scene_to_file(SCENE_CONST.MAIN)
