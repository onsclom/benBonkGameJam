extends Sprite
# Called when the node enters the scene tree for the first time.

func _ready():
	self.visible = false 

func _on_TextureButton_Mes_pressed():
	# Display most recent saltA message
	GameManager.curZ += 1
	get_parent().z_index = GameManager.curZ
	update()
	# Do we need to add forward/back buttons? 
	
func update():
	if get_parent().unread:
		get_parent().saltAMessageCount += 1
		if get_parent().saltAMessageCount < get_parent().maxMessageAmount:
			print("THIS TRIGGERED YAY")
			get_node("../MessagePopup/AnimatedSprite").visible = true
		else:
			get_node("../MessagePopup/AnimatedSprite").visible = false
			
			if get_parent().saltAMessageCount == 7:
				get_node("../../../Notes/Area2D_Note").saltANoteCount +=1
			if get_parent().saltAMessageCount == 8:
				GameManager.lastNoteRead = true
			get_node("../../../Notes/Area2D_Note/NotesPopup").update()
	get_parent().unread = false
	print(get_parent()._saltAMessageCount())
	var currentMsgTexture = load("res://Assets/saltAChats/spaz-saltachats" + get_parent()._saltAMessageCount() as String +  ".png")
	self.set_texture(currentMsgTexture)
	get_node("../Arrow").visible = false
	self.visible = true
	
func _on_ClosePopup_Mes_pressed():
	self.visible = false 


func _on_TextureButton_pressed():
	update()
	pass # Replace with function body.
