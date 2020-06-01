extends Sprite
# Called when the node enters the scene tree for the first time.

func _ready():
	self.visible = false 

func _on_TextureButton_Mes_pressed():
	# Display most recent saltA message
	update()
	# Do we need to add forward/back buttons? 
	
func update():
	var currentMsgTexture = load("res://Assets/saltAChats/spaz-saltachats" + get_parent()._saltAMessageCount() as String +  ".png")
	self.set_texture(currentMsgTexture)
	get_node("../Arrow").visible = false
	self.visible = true
	
func _on_ClosePopup_Mes_pressed():
	self.visible = false 


func _on_TextureButton_pressed():
	update()
	pass # Replace with function body.
