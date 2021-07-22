extends KinematicBody2D

var nameP : String
var deathP : int = 0
var coins = 0
var ingamecoins = 0
const Save_Path = "user://save_config_file.ini"
var testgame = false
export var godmode = false

func _ready():
	pass
	
func reset_1():
	Input.action_release("left")
	Input.action_release("right")
	Input.action_release("jump")
	get_tree().change_scene("res://Scenes/Test.tscn")

func addcoins(num):
	var config = ConfigFile.new()
	config.load(Save_Path)
	var addcoin = coins + int(num)
	
	config.set_value("MySaveText1", "Coins", addcoin)
	config.save(Save_Path)
	coins = config.get_value("MySaveText1", "Coins")
	
