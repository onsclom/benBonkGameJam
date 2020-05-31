extends Sprite
# Called when the node enters the scene tree for the first time.

func _ready():
	self.visible = false 

func _on_TextureButton_Mes_pressed():
	# Display most recent saltA message
	var currentMsgTexture = load("res://Assets/saltAChats/spaz-saltachats" + get_parent()._saltAMessageCount() as String +  ".png")
	self.set_texture(currentMsgTexture)
	self.visible = true
	
	# Do we need to add forward/back buttons? 
	
func _on_ClosePopup_Mes_pressed():
	self.visible = false 
