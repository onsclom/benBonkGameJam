extends Area2D

var saltANoteCount = 0

func _input_event(viewport, event, shape_idx): # Not sure this needs to be in here. 
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	print("click")
	$AnimatedSprite_Note.stop()

func _on_Note_tree_entered():
	$AnimatedSprite_Note.play("unread")
	saltANoteCount += 1

func _on_TextureButton_pressed():
	$AnimatedSprite_Note.stop()
	
func _saltANoteCount(): 
	return saltANoteCount
