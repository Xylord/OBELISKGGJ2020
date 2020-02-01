extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scene = preload("res://asset/WarningMesh.tscn") # Will load when parsing the script.

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout", self, "_on_timeout")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_timeout():
	var node: Spatial = scene.instance()
	get_parent().add_child(node)
	var pos: Vector3 = get_parent().get_node("Boat").global_transform.origin
	pos += Vector3(rand_range(-40, 40), 0, rand_range(-40, 40))
	node.translation = pos
