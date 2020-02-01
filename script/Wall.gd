extends KinematicBody


#signal _ship_collision(damage)



func _on_Boat_body_entered(body):
	print("collide wall")
	$Boat.damage(10)

