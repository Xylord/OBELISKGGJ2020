extends Area

var counter = 10

func _ready():
	connect("body_entered", self, "_on_Boat_body_entered")
	

func _process(delta):
	counter -= delta
	if counter < 0:
		queue_free()

func _on_Boat_body_entered(body):
	owner.get_node("Boat").damage(10)
	print("Area Entered")
	

