extends Area2D

var saltANoteCount = 0

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
