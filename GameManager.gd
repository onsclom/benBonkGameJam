extends Node

#dictionary where:
#	key: name
#	value: player object
signal send_chat_message
signal send_pm_message
var players = {}

var names = "wren orly cleo elke juno sian noah liam owen john luke jack ryan emma ella levi aria lily zoey evan nora leah adam jace jose ezra mila maya ruby".split(" ")
var colors = ["ffcd75", "ef7d57", "b13e53", "73eff7", "41a6f6", "a7f070", "38b764"]
var randomFunMessages = ["pog", "nice gameplay!", "lulw", "kappa kappa", "loving the content", "haha", "lol", "NICE", "nailed it", "first tryyy", "KEKW", "...", "oof"]

func _ready():
	print(names)
	#test generate
	generate_players(20)
	print(players)

func generate_players(amount):
	for x in range(amount):
		var randNum = str(floor(rand_range(1,99)))
		var newName = ""
		var newColor = colors[randi() % colors.size()]
		
		if randi()%2 == 0:
			#make num first
			newName = randNum + names[randi() % names.size()]
		else:
			#make num after
			newName = names[randi() % names.size()] + randNum
		
		players[newName] = Player.new(newColor, newName)
	pass

func _process(delta):
	#debugging sending messages
	if Input.is_action_just_pressed("ui_up"):
		var randKey = players.keys()[randi() % players.keys().size()]
		print(randKey)
		emit_signal("send_chat_message", randKey, players[randKey].color, randomFunMessages[randi() % randomFunMessages.size()])
	pass

#inner class player
class Player:
	var color
	var name
	var chatHistory
	
	func _init(colorCode, givenName):
		color = colorCode
		name = givenName
		print("making player")
