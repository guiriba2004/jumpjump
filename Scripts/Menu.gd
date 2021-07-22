extends Control

var Mycoins = GeneralScript.coins
var Mydeaths = GeneralScript.deathP
onready var Myname = GeneralScript.nameP

func _ready():
	$cointxt/Coinstxt.text = str(Mycoins)
	$deathtxt/Deathstxt.text = str(Mydeaths)
	$Nametxt.text = ("Hello, " + Myname)


func _on_Button_pressed():
		var scene = load("res://Scenes/Test.tscn")
		get_tree().change_scene_to(scene)
		GeneralScript.ingamecoins = 0
		print("GOD MODE IS ", GeneralScript.godmode)
