extends Node

@onready var theme = $Theme
@onready var game_over = $GameOver

# Game over
func play_game_over():
	game_over.play()

# Theme
func play_theme():
	theme.play()

# Stop Theme
func stop_theme():
	theme.stop()
