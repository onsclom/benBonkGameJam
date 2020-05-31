extends Area2D

func _input_event(viewport, event, shape_idx): # Not sure this needs to be in here. 
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	print("click")
	$animateSprite.stop()

func _on_Message_tree_entered():
	$AnimatedSprite.play("unread")

func _on_TextureButton_pressed():
	$AnimatedSprite.stop()
