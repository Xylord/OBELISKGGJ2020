extends Node

export(int) var value = 1
export(int) var chargeValue = 1
func _ready():
	if get_owner() != null :
		get_owner().plank_total += value
	connect("body_entered", self, "_on_Boat_body_entered")	

func _on_Boat_body_entered(body):
	get_owner().plank_total +=1
	get_owner().plank_collected +=1
	get_parent().get_node("sun")._add_charge(chargeValue)
	queue_free()

