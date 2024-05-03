extends Node2D

# AdMob
@onready var ad_mob = $AdMob

func _ready():
	ad_mob.load_banner()

# Show full screen ads
func show_banner_ads():
	ad_mob.load_banner()
	ad_mob.show_banner()
