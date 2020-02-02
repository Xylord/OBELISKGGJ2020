extends Spatial


# Declare member variables here. Examples:
var charge: float = 0 setget _set_charge, _get_charge
var currentCharge: float = 0
var sun: MeshInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	sun = get_node("Circle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentCharge = lerp(currentCharge, charge, 0.5)
	sun.get_material().set_shader_param("chargeLevel", currentCharge);
	pass

func _set_charge(val):
	charge = val
	
func _get_charge():
	return charge
