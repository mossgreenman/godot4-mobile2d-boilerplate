extends Node

var Creep1
var Creep2
# ----- scene -----
@onready var hud = $SafeAreaN2D/HUD
@onready var player = $Player
@onready var sound_effect = $SoundEffect
# ----- var -----
var score = 0
var mob_speed = 100
var mob_speed_config = {
	'init': 100,
	'step': 20,
	'max': 1000,
}
var mob_wait_time_config = {
	'init': 1,
	'step': 0.2,
	'min': 0.2,
}
# ----- position -----
@onready var start_pos = $SafeAreaN2D/StartPos
@onready var mob_spawn_location = $SafeAreaN2D/MobPath/MobSpawnLocation
# ----- timer -----
@onready var spawn_mob_timer = $Timer/SpawnMob
@onready var count_score_timer = $Timer/CountScore
@onready var start_game_timer = $Timer/StartGame

# ---------- lifecycle ----------
func _ready():
	randomize()
	hud.connect('start_game', Callable(self, 'new_game'))
	player.connect('hit', Callable(self, 'game_over'))
	Creep1 = load(SCENE_CONST.CREEP_1)
	Creep2 = load(SCENE_CONST.CREEP_2)

# ---------- function ----------
func new_game():
	reset()
	start_game_timer.start()
	hud.update_score(score)
	hud.show_message("Get Ready")
	sound_effect.play_theme()

func reset():
	score = 0
	mob_speed = mob_speed_config.init
	spawn_mob_timer.wait_time = 1
	player.start(start_pos.position)

func game_over():
	count_score_timer.stop()
	spawn_mob_timer.stop()
	save_high_score()
	hud.show_game_over()
	sound_effect.stop_theme()
	sound_effect.play_game_over()
	get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	player.hide()
	get_tree().paused = false
	get_tree().call_group("creep", "queue_free")

func increase_mob_speed():
	if mob_speed < mob_speed_config.max:
		mob_speed += mob_speed_config.step

func decrease_mob_wait_time():
	if spawn_mob_timer.wait_time > mob_wait_time_config.min:
		spawn_mob_timer.wait_time -= mob_wait_time_config.step

func save_high_score():
	var high_score_ls = HIGH_SCORE_LOCAL_STORAGE.new()
	var high_score = high_score_ls.load_high_score()
	if score > high_score:
		high_score_ls.save_high_score(score)

# ---------- timer ----------
func spawn_mob():
	mob_spawn_location.progress = randi()
	var creep
	var creep_rd = randi()%100
	if creep_rd%2 == 0:
		creep = Creep1.instantiate()
	else:
		creep = Creep2.instantiate()
	add_child(creep)
	var direction = mob_spawn_location.rotation + PI/2
	creep.position = mob_spawn_location.position
	direction += randf_range(-PI/4, PI/4)
	creep.rotation = direction
	creep.linear_velocity = Vector2(mob_speed, 0)
	creep.linear_velocity = creep.linear_velocity.rotated(direction)

func start_game():
	spawn_mob_timer.start()
	count_score_timer.start()

func count_score():
	score += 1
	hud.update_score(score)
	if score%5 == 0:
		increase_mob_speed()
		decrease_mob_wait_time()
