extends Label

var drawTextSpeed: int = 0

var chatterLimit: int = 56
onready var timer = $Timer

var textCount = 0
var textArray = ["welcome to cyber sea.", "use w,a,s,d to go forward,left,backward and right","You can use your mouse pitch to control the pitch of your ship","Use shift to toggle acceleration","Reach the sun. Reconstruct the sky. Repair the world.","Escape the Storm. Avoid the sea pillars. Ride the waves"]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(textArray[textCount])
	timer.start()
	pass # Replace with function body.

func _showChatter():
	if drawTextSpeed<chatterLimit:
		drawTextSpeed+=1
		self.visible_characters = drawTextSpeed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		_showChatter()
		
func _on_Timer_timeout():
	textCount+=1
	set_text(textArray[textCount])
	queue_free()
	
		

