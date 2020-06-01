extends Sprite
# Called when the node enters the scene tree for the first time.

func _ready():
	self.visible = false 

func _on_TextureButton_Note_pressed():
	# Display most recent saltA message
	get_node("../AnimatedSprite").visible = false
	var currentNoteTexture = load( "res://Assets/Notes/spaz-notepage" + get_parent()._saltANoteCount() as String +  ".png")
	self.set_texture(currentNoteTexture)
	self.visible = true
	
	# Do we need to add forward/back buttons? 
	
func _on_ClosePopup_Notes_pressed():
	self.visible = false 
