extends Control

var openBottomNotificationButton = false # whether or not there should be a visible bottom label 
var conversationLabel #label that goes at bottom of page 
var NewMessageButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# 1. Check for any newly recieved messages.
	# 2. Display the number of newly received messages. 

func _init(): 
	pass
	
#func _checkForMessages(): Do I need something like this? Or does _on_Message_tree_entered() handle it? 
	
func _process(delta):
	 pass
	
func _on_Message_tree_entered():
	#Aesthetic changes to NewMessageButton
	
	$NewMessageButton/NewMessageSprite.play("unread")
	
	#Update MessageList
	
	#$DirectMessageBox/MessageDialog/ItemList.add_item("saltAMessage1")
	
	#ensure that proper image pops on click 
	
	

func _on_NewMessageButton_pressed():
	pass # Replace with function body.
