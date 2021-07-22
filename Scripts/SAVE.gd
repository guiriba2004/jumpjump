extends Button

var created = false

export var inputsave : NodePath
export var yoursave : NodePath

func _ready():
	loadthis()

func _on_SAVE_pressed():
	var whatsave = get_node(inputsave).text
	var getsave = get_node(yoursave).text
	if (whatsave != null and whatsave != ""):
		var config = ConfigFile.new()
		
		created = true
		
		print("THIS " + str(whatsave))
		config.set_value("MySaveText", "Text1", whatsave)
		config.set_value("MySaveText", "Created", created)
		config.set_value("MySaveText1", "Deaths", GeneralScript.deathP)
		config.set_value("MySaveText1", "Coins", GeneralScript.coins)
		config.save(GeneralScript.Save_Path)

		get_node(yoursave).text = (config.get_value("MySaveText", "Text1"))
		
		loadthis()
	
func loadthis():
	var config = ConfigFile.new()
	config.load(GeneralScript.Save_Path)
	
	if config.get_value("MySaveText", "Created", created) == true:
		
#		var scene = load("res://Scenes/Test.tscn")
#		get_tree().change_scene_to(scene)
#

		if (config.get_value("MySaveText1", "Coins")) == null:
			config.set_value("MySaveText1", "Coins", GeneralScript.coins)
			config.save(GeneralScript.Save_Path)
			
		GeneralScript.nameP = (config.get_value("MySaveText", "Text1"))
		GeneralScript.deathP = (config.get_value("MySaveText1", "Deaths"))
		GeneralScript.coins = (config.get_value("MySaveText1", "Coins"))
		print("Your name " + GeneralScript.nameP)
		print("Your deaths " + str(GeneralScript.deathP))
		print("Your Coins " + str(GeneralScript.coins))
		
		var scene = load("res://Scenes/Menu.tscn")
		get_tree().change_scene_to(scene)
		
		#var getsave = get_node(yoursave).text
		#get_node(yoursave).text = (config.get_value("MySaveText", "Text1"))
		#print(config.get_value("MySaveText", "Text1"))
		
	else: 
		pass
