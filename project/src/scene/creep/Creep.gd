extends RigidBody2D

@onready var anim_sprite = $AnimSprite

func _ready():
	add_to_group('creep')
	anim_sprite.play()

func destroy_mob():
	queue_free()
