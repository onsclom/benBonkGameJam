extends Control

var cur = 1

onready var chatLabel = $Label

var colors = ["ffcd75", "ef7d57", "b13e53", "73eff7", "41a6f6", "a7f070", "38b764"]
var names = ["jeff7", "bobcob", "pog8", "dand", "owo8"]

onready var frozenMessage = $FrozenChat

var frozenBuffer = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	#changes rng seed!
	randomize()
	randomize()
	GameManager.connect("send_chat_message", self,  "_send_chat_message_signal")
	frozenMessage.visible = false
	GameManager.gameStarted = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if (Input.is_action_just_pressed("test")):
#		if frozenMessage.visible == false:
#			chatLabel.bbcode_text += '\n[color=#' + colors[randi() %colors.size()] + '][url={"name"="bob"}]' + names[randi() % names.size() ] + '[/url][/color] [color=#' + "000000" +']' + "test" + str(cur) + "[/color]"
#		else:
#			frozenBuffer += '\n[color=#' + colors[randi() %colors.size()] + '][url={"name"="bob"}]' + names[randi() % names.size() ] + '[/url][/color] [color=#' + "000000" +']' + "test" + str(cur) + "[/color]"
#		cur += 1
	if Input.is_action_just_pressed("leftclick"):
		$clickSound.playing = true


func _on_Label_meta_clicked(meta):
	if ($LineEdit.text == meta):
		banSubmit()
	else:
		$LineEdit.text = meta


func _on_Label_mouse_entered():
	frozenMessage.visible = true
	pass # Replace with function body.


func _on_Label_mouse_exited():
	frozenMessage.visible = false
	chatLabel.bbcode_text += frozenBuffer
	frozenBuffer = ""


func _send_chat_message_signal(name, color, msg):
	if frozenMessage.visible == false:
		if chatLabel.bbcode_text != "":
			chatLabel.bbcode_text += "\n"
		chatLabel.bbcode_text += '[color=#' + color + '][url='+name+']' + name + '[/url][/color] [color=#' + "1a1c2c" +']' + msg + "[/color]"
	else:
		if chatLabel.bbcode_text != "" || frozenBuffer != "":
			frozenBuffer += "\n"
		frozenBuffer += '[color=#' + color + '][url='+name+']' + name + '[/url][/color] [color=#' + "1a1c2c" +']' + msg + "[/color]"
	cur += 1


func _on_LineEdit_text_entered(new_text):
	banSubmit()

func banSubmit():
	
	$banSound.playing = true
	
	var name = $LineEdit.text
	
	if name in GameManager.chatters:
		GameManager.chatters.erase(name)
	
	if name in GameManager.hackers:
		print("name in hackers")
		GameManager.hackers.remove( GameManager.hackers.rfind(name) )
	else:
		print("name not in hackers!")
		
	for x in range(GameManager.hackers.size()):
		if GameManager.hackers[x].name == name:
			GameManager.hackers.remove( x )
			
	$LineEdit.text = ""
	chatLabel.bbcode_text += '\n[color=#333c57]* ' + name + ' is now banned.' + "[/color]"


func _on_TextureButton_pressed():
	banSubmit()



