extends Button


func _pressed():
	Events.emit_signal("set_dialog",[
		{
			"name":"Person",
			"content":"Wow text! Wow text!Wow text!Wow text!Wow text!Wow text!Wow text!Wow text!Wow text!Wow text!Wow text!"
		},
		{
			"name":"Person",
			"content":"This is even more text wow! This is even more text wow! This is even more text wow!"
		},
		{
			"name":"Person 2",
			"content":"2nd person speaking!"
		}
	])
	self.release_focus()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
