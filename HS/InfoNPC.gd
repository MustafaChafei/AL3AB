extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')
	
func _process(delta):
	pass

func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
		
func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			var dialog = Dialogic.start('infopoint')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			add_child(dialog)
			dialog.connect('timeline_end', self, 'unpause')
			get_tree().paused = true
				
func unpause(data):
	get_tree().paused = false
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
