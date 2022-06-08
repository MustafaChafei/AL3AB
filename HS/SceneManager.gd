extends Node2D

var next_scene = null

onready var background = $root/SceneManager/CurrentScene/Combat/CanvasLayer/combat_scene/background
#onready var bg = $CurrentScene/Combat/CanvasLayer/combat_scene/background


func _ready():
	pass 

func transition_to_scene(new_scene: String):
	next_scene = new_scene
	$ScreenTransition/AnimationPlayer.play("FadeToBlack")

func finished_fading():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.get_child(1).queue_free()
	print(next_scene)
	#print(bg)
	var try = $CurrentScene.add_child(load(next_scene).instance())
	$ScreenTransition/AnimationPlayer.play("FadeToNormal")
	if(next_scene == "res://Combat.tscn"):
		var bg = get_node(NodePath("/root/SceneManager/CurrentScene/Combat/CanvasLayer/combat_scene/background"))
		print(bg)
		print(bg.is_visible())
		bg.visible = true
