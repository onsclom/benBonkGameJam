extends AnimatedSprite

var animations = ["startup1", "idle1", "startup2", "idle2", "startup3"]
var cur = 0

var mainGame = preload("res://Chat.tscn")

func _ready():
	play("startup1")
	print(get_animation())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("leftclick"):
		if get_animation() == "idle1" || get_animation() == "idle2":
			cur+=1
			play(animations[cur])
		


func _on_AnimatedSprite_animation_finished():
	print(get_animation())
	if get_animation() == "startup1" || get_animation() == "startup2":
		cur+=1 
		play(animations[cur])
	elif get_animation() == "startup3":
			get_tree().change_scene_to(mainGame)
	pass # Replace with function body.
