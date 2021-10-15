extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var thresholds = {
	"x":{
		"right": ProjectSettings.get_setting("display/window/size/width") * 0.75,
		"left": ProjectSettings.get_setting("display/window/size/width") * 0.25,
	},
	"y":{
		"down":ProjectSettings.get_setting("display/window/size/height") * 0.75,
		"up": ProjectSettings.get_setting("display/window/size/height") * 0.25,
	}
}
var moveBy = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(_delta):
	self.position = self.position + moveBy
	pass


func _input(event):
	if Input.is_action_just_released("zoom_in"):
		self.zoom = self.zoom - Vector2(0.25,0.25)
		
	if Input.is_action_just_released("zoom_out"):
		self.zoom = self.zoom + Vector2(0.25,0.25)
		
	if event is InputEventMouseMotion:
		# Move left
		if event.position.x < thresholds.x.left:
			moveBy.x = ((thresholds.x.left - event.position.x)*0.075)* -1
			
		# Move right
		elif event.position.x > thresholds.x.right:
			moveBy.x = (event.position.x - thresholds.x.right)*0.075
		
		else: 
			moveBy.x = 0
			
		# Move down
		if event.position.y > thresholds.y.down:
			moveBy.y = ((event.position.y - thresholds.y.down)*0.075)
			
		# Move up
		elif event.position.y < thresholds.y.up:
			moveBy.y = ((thresholds.y.up - event.position.y)*0.075) * -1
			
		else: 
			moveBy.y = 0
		
			
