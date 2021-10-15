extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var nameNode: Label = get_node("Container/Name")
onready var contentNode: RichTextLabel = get_node("Container/Background/Spacing/Content")
onready var tween: Tween = get_node("Tween")


var dialogQueue = []
var isOpen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("set_dialog",self,"setDialog")
	pass

func setDialog(contents):
	dialogQueue = contents
	nextDialog()

func nextDialog():
	if dialogQueue.size() == 0:
		if isOpen:
			isOpen = false
			downAnim()
			yield(tween,"tween_completed")
			contentNode.text = ""
			nameNode.text = ""
		return
		
	var currentDialog = dialogQueue.pop_front()
	var mustReset = true if nameNode.text != currentDialog.name else false
	
	contentNode.text = currentDialog.content
	nameNode.text = currentDialog.name
	
	if mustReset:
		upAnim()
		isOpen = true
		yield(tween,"tween_completed")
		
		
#Handle iteration on click/input
func _input(e):
	if e.is_action_released('ui_accept'):
		nextDialog()

# Animations
func upAnim():
	tween.interpolate_property(
		get_node("Container"),
		"rect_position",
		Vector2(32,600),
		Vector2(32,474),
		0.8,
		Tween.EASE_IN_OUT
	)
	tween.start()
	
func downAnim():
	tween.interpolate_property(
		get_node("Container"),
		"rect_position",
		Vector2(32,474),
		Vector2(32,600),
		0.8,
		Tween.EASE_IN_OUT
	)
	tween.start()
