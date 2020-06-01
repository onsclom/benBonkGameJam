extends AnimatedSprite

var animations = ["startup1", "idle1"]
var cur = 0

func _ready():
	play("startup1")
	print("test!")
	print(get_animation())
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if get_animation() == "startup1" || get_animation() == "startup2":
		cur+=1 
		play(animations[cur])
		$sound1.playing = false
		$sound2.playing = false
		$sound3.playing = false
