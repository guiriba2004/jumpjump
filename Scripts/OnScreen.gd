extends CanvasLayer

func _ready():
	$coinstxt.text =  str(GeneralScript.ingamecoins)

func _on_Coin_bouncedone():
	$coinstxt.text =  str(GeneralScript.ingamecoins)
