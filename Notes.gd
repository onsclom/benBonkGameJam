extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_on_Note_tree_entered()
	$NotesButton/AnimatedSprite.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Note_tree_entered():
	#Aesthetic changes to NotesButton:
	$NotesButton/AnimatedSprite.show()
	$NotesButton/AnimatedSprite.play("unread")
	
	#UpdateNoteList
	$NotesDialog/NoteList.add_item("1/10")

func _on_NotesButton_pressed():
	$NotesDialog.popup()
	$NotesButton/AnimatedSprite.stop()
	$NotesButton/AnimatedSprite.hide()
