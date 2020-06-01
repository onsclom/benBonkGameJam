extends Popup

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProfileDialog.resizable = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Username_meta_clicked(meta):
	$ProfileDialog.window_title = get_parent().get_node("Username").text
	$ProfileDialog.popup()
		
