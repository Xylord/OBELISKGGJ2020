extends InterpolatedCamera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var boat: Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	boat = get_parent().get_node("Boat")
	set_target(boat.get_node("CameraTarget"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(boat.global_transform.origin, Vector3.UP)
	pass
