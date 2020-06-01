extends Area2D

var saltAMessageCount = 0
var maxMessageAmount = 2

var unread = true

func on_click():
	print("click")
	$AnimatedSprite_Mes.stop()

func _ready():
	$AnimatedSprite_Mes.play("unread")
	saltAMessageCount += 1

func _on_TextureButton_Mes_pressed():
	unread = false
	$AnimatedSprite_Mes.play("defaultHover")

func _saltAMessageCount(): 
	return saltAMessageCount


func _on_TextureButton_pressed():
	saltAMessageCount += 1
	print(saltAMessageCount)
	print(maxMessageAmount)
	if saltAMessageCount == maxMessageAmount:
		$MessagePopup/AnimatedSprite.visible = false
	pass # Replace with function body.


func _on_TextureButton_Mes_mouse_entered():
	if !unread:
		$AnimatedSprite_Mes.play("defaultHover")
	else:
		$AnimatedSprite_Mes.play("unreadHover")
	pass # Replace with function body.


func _on_TextureButton_Mes_mouse_exited():
	if !unread:
		$AnimatedSprite_Mes.play("default")
	else:
		$AnimatedSprite_Mes.play("unread")
