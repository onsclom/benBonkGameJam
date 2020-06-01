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
var randomFunMessages = ["pog", "nice gameplay!", "lulw", "kappa kappa", "loving the content", "haha", "lol", "NICE", "nailed it", "first tryyy", "KEKW", "...", "oof", "sweet trick", ":)", "nice job", "i love games", "git gud scrub", "nice song", "who else here?", "bring it on", "song name?", "stream's laggy", "good play", "!!!", "plz", "what u mean?", "LOLOL", "letsgooo", "tasty burger", "mmm", "wut?", "huh", "good vibes", "heheh", "trolled dude", "not gud", "tfw"]

#Game states:
#	as game progresses these states change
enum {WAITFORGAME,PRE,PREHALF,PRE1,START,TIMEBEFORE,PHASE1,PHASE2,PHASE3,PHASE4,PHASE5,PHASE6,PHASE7,PHASE8,PHASE9,PHASE10,PHASE11,PHASE12,PHASE13,PHASE14,PHASE15,PHASE16,END1,END2}

var gameStarted = false

var curState = WAITFORGAME
var timeSinceLastMessage = 0

var chatSpeed = .5
var nextChatSpeed = .5

var timeSinceLastSpam = 0

var ending = preload("res://Ending.tscn")

var preTimer = 0

var helpRead = false

func _ready():
	print(names)
	#test generate
	generate_chatters(50)
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
			if preTimer >= 4:
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
			chatSpeed *= 2 # slowing down chat
		START:
			updateChat(delta)
			
			if hackers!=[]:	
				hackerManSpam(delta)
			else:
				#they banned the spammer weee!
				curState +=1
				chatSpeed /= 2 # speed back up chat
		TIMEBEFORE:
			#some time before getting mail!
			updateChat(delta)
			preTimer += delta
			if preTimer >= 2:
				preTimer = 0
				curState += 1
		PHASE1: 
			print("nice")
			#gives two more pages
			emit_signal("send_pm_message", 4)
			#inside pm deal with activating notes
			curState+=1
		PHASE2:
#			var randNum = str(floor(rand_range(1,99)))
#			var newName = ""
#			var newColor = colors[randi() % colors.size()]
#
#			if randi()%2 == 0:
#				#make num first
#				newName = randNum + names[randi() % names.size()]
#			else:
#				#make num after
#				newName = names[randi() % names.size()] + randNum
#			hackers.append(Player.new(newColor, newName))
#			#make someone who spawns spams the same message 3 times
#			curState+=1 
			
			#### SHORTCUT TO END!!! 
			updateChat(delta)
			preTimer += delta
			if preTimer >= 15:
				preTimer = 0
				curState = END1
				
		PHASE3:
			updateChat(delta)
			#only move on if they ban the hacker
			if hackers!=[]:	
				pass
				#specialManSpam(delta)
			else:
				#they banned the spammer weee!
				curState +=1
		PHASE4:
			#make someone who sends bit.ly links in chat
#			curState+=1
			pass

		PHASE5:
			#only move on if they ban the hacker
			if hackers!=[]:	
				pass
				#bitlySpam(delta)
			else:
				#they banned the spammer weee!
				curState +=1
		PHASE6:
			emit_signal("send_pm_message", 6)
			#inside pm update the pages
			curState += 1
		PHASE7:
			#make someone with number messages 
			curState+=1
		PHASE8:
			#only move on if they ban the hacker
			if hackers!=[]:	
				pass
				#numberMessages(delta)
			else:
				#they banned the spammer weee!
				curState +=1
		PHASE9:
			#make another with number messages 
			curState+=1
		PHASE10:
			#only move on if they ban the hacker
			if hackers!=[]:	
				pass
				#numberMessages(delta)
			else:
				#they banned the spammer weee!
				curState +=1
		PHASE11:
			emit_signal("send_pm_message", 7)
			#update notes in pms
			curState += 1
		PHASE12:
			#make a last baddy? 
			curState+=1
		PHASE13:
			#only move on if they ban the hacker
			if hackers!=[]:	
				pass
				#lastBaddy?(delta)
			else:
				#they banned the spammer weee!
				curState +=1
		PHASE14:
			#send final message
			emit_signal("send_pm_message", 8)
			curState += 1
		PHASE15:	
			#dont cur+=1 until note is read
			pass
		PHASE16:
			#SMILEY :) IN CHAT BABY
			#VIEWERS DECREASE EVERY FRAME AND GO DEEP INTO -'s
			preTimer += delta
			if preTimer >= 5: # decide how long to stay here
				preTimer = 0
				curState += 1
		END1:
			get_node("/root").get_tree().change_scene_to(ending)
			curState+=1
			pass
		END2:
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
