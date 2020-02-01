extends Area

func _ready():
	connect("body_entered", self, "_on_Boat_body_entered")
	
func _on_Boat_body_entered(body):
	owner.get_node("Boat").damage(10)
	print("Area Entered")
	#emit_signal("_final_area_entered")
	

