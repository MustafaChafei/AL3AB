extends StaticBody2D

export(String, FILE) var next_scene_path = ""
var active = false
onready var ray = $BlockingRayCast2D

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')
	
func _physics_process(delta):
	$QuestionMark.visible = active
	ray.force_raycast_update() 
	

func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
		print("Body enterd")
		
func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false

func _input(event):
	var combat = get_node("root/SceneManager/CurrentScene/Combat")
	if ray.is_colliding():
		print("is colliding") 
		if event.is_action_pressed("ui_accept"):
			get_node(NodePath("/root/SceneManager")).transition_to_scene(next_scene_path)
			

