extends Control

var cur = 1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var chatLabel = $Label

var colors = ["ffcd75", "ef7d57", "b13e53", "73eff7", "41a6f6", "a7f070", "38b764"]
var names = ["jeff7", "bobcob", "pog8", "dand", "owo8"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("test")):
		chatLabel.bbcode_text += '\n[color=#' + colors[randi() %colors.size()] + '][url={"name"="bob"}]' + names[randi() % names.size() ] + '[/url][/color] [color=#' + "000000" +']' + "test" + str(cur) + "[/color]"
		cur += 1
func _on_Label_meta_clicked(meta):
	print(meta + "was clicked")
	pass # Replace with function body.
