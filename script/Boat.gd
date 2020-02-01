extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var thrust;
var torque;
var forwardThrust = 5.0;
var rotationThrust = .5;
var max_velocity = 10.0;
var  max_rotation = 2;
# Called when the node enters the scene tree for the first time.
func _ready():
	thrust = Vector3()
	pass # Replace with function body.

func _physics_process(delta):
	_get_movement()


					
func _get_movement():
	if Input.is_action_pressed("ui_up"):
		if (linear_velocity.length() <max_velocity):
			thrust = forwardThrust * global_transform.basis.x
			apply_central_impulse(thrust)
			
	if Input.is_action_pressed("ui_down"):
		if (linear_velocity.length() <max_velocity):		
			thrust = forwardThrust * global_transform.basis.x
			apply_central_impulse(-thrust)
			
	if Input.is_action_pressed("ui_left"):

		if (angular_velocity.length() <max_rotation):		
			thrust = rotationThrust * global_transform.basis.y
			apply_torque_impulse(thrust)
			
	if Input.is_action_pressed("ui_right"):
		if (angular_velocity.length() <max_rotation):
			thrust = rotationThrust * global_transform.basis.y
			apply_torque_impulse(-thrust)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
