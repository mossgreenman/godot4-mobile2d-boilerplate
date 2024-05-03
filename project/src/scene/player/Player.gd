extends Area2D

signal hit

@onready var anim_sprite = $AnimSprite
@onready var coll = $Coll
@export var speed = 400
var screen_size
var target = Vector2()
const ux_player_vector = Vector2(0, -50)

# ---------- lifecycle ----------
func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		target = event.position + ux_player_vector

func _process(delta):
	var velocity = Vector2()
	if position.distance_to(target) > 10:
		velocity = target - position

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		anim_sprite.play()
	else:
		anim_sprite.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

#	anim_sprite.flip_v = false
	
#	if velocity.x != 0:
#		anim_sprite.animation = "leftright"
#		anim_sprite.flip_h = velocity.x < 0
#	elif velocity.y != 0:
#		anim_sprite.animation = "updown"

# ---------- function ----------
func on_mob_hit(_body):
	emit_signal("hit")
	coll.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	coll.disabled = false
