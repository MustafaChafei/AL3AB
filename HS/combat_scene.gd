extends Control
var count = 0 

func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and count == 0:
			$background.visible = true
			$background/player_battle/AnimationPlayer.current_animation = "dance"
			count +=1
			
		elif event.button_index == BUTTON_LEFT and event.pressed and count == 1:
			for i in range(0,10):
				yield(get_tree().create_timer(0.5), "timeout")
				$background/player_battle2.offset.x += -6
			count+=1
					
		elif event.button_index == BUTTON_LEFT and event.pressed and count == 2:
			$background/player_battle/AnimationPlayer.current_animation = "idle"
		
		elif event.button_index == BUTTON_LEFT and event.pressed and count == 2:
			var dialog = Dialogic.start('combat')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			add_child(dialog)
			dialog.connect('timeline_end', self, 'unpause')
			get_tree().paused = true
				
func unpause(data):
	get_tree().paused = false
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
