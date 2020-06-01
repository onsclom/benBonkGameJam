extends Area2D

var saltAMessageCount = 0
var maxMessageAmount = 0

var unread = false

var firstTime = true


func _ready():
	GameManager.connect("send_pm_message", self, "_on_send_pm_message")
	$AnimatedSprite_Mes.play("default")
	saltAMessageCount += 1
	
func _on_send_pm_message(num):
	if (num > maxMessageAmount):
		$AnimatedSprite_Mes.play("unread")
		unread = true
		$incomingMail.playing = true
		maxMessageAmount = num
		
		if firstTime:
			$Arrow.visible = true

func _on_TextureButton_Mes_pressed():
	unread = false
	$AnimatedSprite_Mes.play("defaultHover")

func _saltAMessageCount(): 
	return saltAMessageCount


func _on_TextureButton_pressed():
	
	saltAMessageCount += 1
	if saltAMessageCount == 2:
		GameManager.helpRead = true
	if saltAMessageCount >= maxMessageAmount:
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
