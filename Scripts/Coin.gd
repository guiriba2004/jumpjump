extends Area2D

signal bouncedone

func _ready():
	pass

func pkayer_hit(body):
	GeneralScript.ingamecoins = GeneralScript.ingamecoins + 1
	$AnimationPlayer.play("bouncecoin")
	$coinpick.play()
	set_collision_mask_bit(0, false)
	emit_signal("bouncedone")


func bouns_done(anim_name):
	queue_free()
