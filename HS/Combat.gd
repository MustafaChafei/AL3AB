extends Node2D

onready var background = $CanvasLayer/combat_scene/background
onready var anim = $CanvasLayer/combat_scene/background/player_battle/AnimationPlayer

func _ready():
	background.visible = false
	anim.current_animation = "dance"
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("Left button was clicked at ", event.position)

