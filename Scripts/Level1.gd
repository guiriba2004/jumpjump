extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var registershow : NodePath


# Called when the node enters the scene tree for the first time.
func _ready():
	var config = ConfigFile.new() #Open
	config.load(GeneralScript.Save_Path) #Load	
	
	
	# RESET THE DEATHS
	
	if config.get_value("MySaveText", "Reset") == null:
		config.set_value("MySaveText", "Reset", false)
		config.save(GeneralScript.Save_Path)
		
	# OPEN WHEN YOU WANT TO RESET THE DEATHS
#	config.set_value("MySaveText", "Reset", false)
#	config.save(GeneralScript.Save_Path)
	
	# CLOSE WHEN YOU WANT TO RESET THE DEATHS
	if config.get_value("MySaveText", "Reset") == false:
		config.set_value("MySaveText1", "Deaths", 0)
		GeneralScript.deathP = 0
		config.set_value("MySaveText", "Reset", true)
		config.save(GeneralScript.Save_Path)
	elif config.get_value("MySaveText", "Reset") == true:
		pass
	
	
	$OnScreen/Pname.text = (GeneralScript.nameP)
	$OnScreen/DeathsC.text = str(GeneralScript.deathP)

func flag_hit(body):
		$Items/flagpole/Area2D.set_collision_layer_bit(1, false)
		$Items/flagpole/Area2D.set_collision_mask_bit(0, false)
		$Items/flagpole/AnimationPlayer.play("anim")
		$Items/flagpole/Area2D/flagsound.play()

func _on_Button_pressed():
	get_node(registershow).visible = true


func nutton_done_stamp(body):
#	GeneralScript.reset_1
	$Items/Sprite2/button1/Area2D.set_collision_layer_bit(1, false)
	$Items/Sprite2/button1/Area2D.set_collision_mask_bit(0, false)
	$Items/Sprite2/downb.play("downb")
	var currentcoins = $OnScreen/coinstxt.text
	if !GeneralScript.testgame:
		GeneralScript.addcoins(currentcoins)
	var scene = load("res://Scenes/Menu.tscn")
	get_tree().change_scene_to(scene)
