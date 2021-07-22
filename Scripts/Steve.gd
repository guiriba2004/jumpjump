extends GeneralScript

export var cdbutton : NodePath

var velocity = Vector2(0,0) #MOVEMENT
var gravity = 35 #FALL
const speed = 210 #ACTUAL SPEED
const jumpforce = -1050#HEIGHT OF JUMP
export var yourdeaths : NodePath

var canrocket = false #make this true
var rocketing = false


func _physics_process(delta): #LOOPING FUNCTION 
	if(GeneralScript.godmode == true):
		canrocket = true
	
	if Input.is_action_pressed("right"): 
		velocity.x = speed
		$Sprite.play("walk")
		$Sprite.flip_h = false #FLIP RIGHT
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite.play("walk")
		$Sprite.flip_h = true #FLIP LEFT
	else:
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("air")
	
	velocity.y = velocity.y + gravity #CODE FOR FALLING
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpforce
		$jump.play()
		
		
	#ROCKET SKILL
	if !godmode:
		if Input.is_action_pressed("skill") and canrocket and not rocketing:
			$Rocket.start()
			rocketing = true
		else:
			pass

	
	
	if Input.is_action_pressed("skill") and canrocket:
		velocity.y = jumpforce / 3.4
		
	if not canrocket:
		get_node(cdbutton).visible = true
	else:
		get_node(cdbutton).visible = false
		
	
	
	
	velocity = move_and_slide(velocity, Vector2.UP) #CODE FOR MOVING / Vecto2.UP WHICH IS FLOOR
	
	velocity.x = lerp(velocity.x , 0, 0.1) #CODE VOR SUDDEN STOP ( ..., ..., WEIGHT)

#STEVE DEATH	
	if position.y >= 1000:
		GeneralScript.reset_1()
		GeneralScript.deathP = GeneralScript.deathP + 1
		GeneralScript.ingamecoins = 0
#		position.x = 409.169
#		position.y = 26.901
#
		var config = ConfigFile.new()
		config.load(GeneralScript.Save_Path)
		if !testgame:
			config.set_value("MySaveText1", "Deaths", GeneralScript.deathP)
		get_node(yourdeaths).text = str(GeneralScript.deathP)
		config.save(GeneralScript.Save_Path)



func Left_Pressed():
	Input.action_press("left")


func Left_Released():
	Input.action_release("left")


func Right_Pressed():
	Input.action_press("right")


func Right_Released():
	Input.action_release("right")
	
func Jump_Pressed():
	Input.action_press("jump")


func Jump_Released():
	Input.action_release("jump")


func _on_Skill_pressed():
	Input.action_press("skill")


func _on_Skill_released():
	Input.action_release("skill")
	

func _on_Rocket_timeout():
	print("OUT OF ROCKET")
	canrocket = false
	$RocketCD.start()


func _on_RocketCD_timeout():
	rocketing = false
	canrocket = true

