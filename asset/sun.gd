extends Spatial


# Declare member variables here. Examples:
var charge: float = 0 setget _set_charge, _get_charge
var currentCharge: float = 0
var sun: MeshInstance
var env: WorldEnvironment

# Called when the node enters the scene tree for the first time.
func _ready():
	sun = get_node("Circle")
	env = get_parent().get_node("WorldEnvironment")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentCharge = lerp(currentCharge, charge, 0.5)
	sun.get_surface_material(0).set_shader_param("chargeLevel", currentCharge * 10.0);
#	sun.get_mat.set_shader_param("chargeLevel", currentCharge * 10.0);
	
	print(currentCharge)
	print(sun.get_surface_material(0))
	env.environment.background_energy = charge
	pass

func _add_charge(value):
	charge+= value
	
func _set_charge(val):
	charge = val
	
func _get_charge():
	return charge
