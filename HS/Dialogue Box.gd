extends NinePatchRect

var printing = false
var timer = 0
var textToPrint = ""

var currentChar = 0

const SPEED = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	_fixed_process(true)

func _fixed_process(delta):
	if printing:
		timer +=delta
		if timer > SPEED:
			timer = 0
			get_node("RichTextLabel").set_bbcode(get_node("RichTextLabel").get_bbcode() + textToPrint[currentChar])
			currentChar +=1
			
		if currentChar >= textToPrint.length():
			currentChar = 0
			textToPrint = ""
			printing= false
			timer = 0
			
func _print_dialogue(text):
	printing = true
	textToPrint = text
