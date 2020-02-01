extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var scene = preload("res://asset/lightningCollision.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout", self, "_on_timeout")
	pass # Replace with function body.


func _on_timeout():
	var node: Spatial = scene.instance()
	get_parent().get_parent().add_child(node)
	var pos: Vector3 = get_parent().global_transform.origin
	node.translation = pos
	
	get_parent().queue_free()
