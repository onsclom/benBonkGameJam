extends Node

#dictionary where:
#	key: name
#	value: player object
signal send_chat_message
signal send_pm_message

# hold the good chatters
var chatters = {}
var hackers = []

# hackers

var names = "wren orly cleo elke juno sian noah liam owen john luke jack ryan emma ella levi aria lily zoey evan nora leah adam jace jose ezra mila maya ruby".split(" ")
var colors = ["ffcd75", "ef7d57", "b13e53", "73eff7", "41a6f6", "a7f070", "38b764"]
var randomFunMessages = ["pog", "nice gameplay!", "lulw", "kappa kappa", "loving the content", "haha", "lol", "NICE", "nailed it", "first tryyy", "KEKW", "...", "oof"]

#Game states:
#	as game progresses these states change
enum {WAITFORGAME, PRE,PREHALF,PRE1,START,PHASE1,PRE2,PHASE2,END}

var gameStarted = false

var curState = PRE
var timeSinceLastMessage = 0

var chatSpeed = .3
var nextChatSpeed = .3

var timeSinceLastSpam = 0

var ending = preload("res://Ending.tscn")

var preTimer = 0

var helpRead = false

func _ready():
	print(names)
	#test generate
	generate_chatters(20)
	print(chatters)

func generate_chatters(amount):
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
		
		chatters[newName] = Player.new(newColor, newName)
	pass

func _process(delta):
	#debugging sending messages
#	if Input.is_action_just_pressed("ui_up"):
#		var randKey = chatters.keys()[randi() % chatters.keys().size()]
#		print(randKey)
#		emit_signal("send_chat_message", randKey, chatters[randKey].color, randomFunMessages[randi() % randomFunMessages.size()])
#	pass
	
	match curState:
		WAITFORGAME:
			if gameStarted:
				curState += 1
		PRE: #creates the spammer
			updateChat(delta)
			preTimer += delta
			if preTimer >= 2:
				preTimer = 0
				curState += 1
		PREHALF:
			updateChat(delta)
			#send alert!
			emit_signal("send_pm_message", 1)
			#can only go to next state once second page is read!
			if helpRead == true:
				curState += 1
		PRE1:
			updateChat(delta)
			#activate first PMs from hackerman HERE
			var randNum = str(floor(rand_range(1,99)))
			var newName = ""
			var newColor = colors[randi() % colors.size()]
			
			if randi()%2 == 0:
				#make num first
				newName = randNum + names[randi() % names.size()]
			else:
				#make num after
				newName = names[randi() % names.size()] + randNum
			hackers.append(Player.new(newColor, newName))
			

			curState += 1
		START:
			updateChat(delta)
			
			if hackers!=[]:	
				hackerManSpam(delta)
			else:
				#they banned the spammer weee!
				curState +=1
		PHASE1: 
			print("nice")
			#send nice job messages and move onto pre2
			curState+=1
		PRE2:
			get_node("/root").get_tree().change_scene_to(ending)
			curState+=1
			pass
		PHASE2:
			pass
		END:
			#PLAY spooky outro animation
			pass
			
func hackerManSpam(delta):
	timeSinceLastSpam+=delta
	if timeSinceLastSpam > .6:
		emit_signal("send_chat_message", hackers[0].name, hackers[0].color, "DONT TRUST HIM")
		timeSinceLastSpam -= .6
		
				
func updateChat(time):
	timeSinceLastMessage += time
	
	if timeSinceLastMessage > nextChatSpeed:
		if chatters.size() != 0:
			var randKey = chatters.keys()[randi() % chatters.keys().size()]
			emit_signal("send_chat_message", randKey, chatters[randKey].color, randomFunMessages[randi() % randomFunMessages.size()])
			timeSinceLastMessage -= nextChatSpeed
			nextChatSpeed = rand_range(.5,1.5)*chatSpeed
		

#inner class player
class Player:
	var color
	var name
	var chatHistory
	
	func _init(colorCode, givenName):
		color = colorCode
		name = givenName
		print("making player")
