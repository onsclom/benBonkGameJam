extends Area2D

var saltAMessageCount = 0

func _input_event(viewport, event, shape_idx): # Not sure this needs to be in here. 
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	print("click")
	$AnimatedSprite_Mes.stop()

func _on_Message_tree_entered():
	$AnimatedSprite_Mes.play("unread")
	saltAMessageCount += 1

func _on_TextureButton_Mes_pressed():
	$AnimatedSprite_Mes.play("default")

func _saltAMessageCount(): 
	return saltAMessageCount
