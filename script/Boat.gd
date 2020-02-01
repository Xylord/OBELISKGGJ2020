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

#health 
export(float) var max_health = 100
onready var health = max_health setget _set_health
onready var invulnerability_timer = $InvulnerabilityTimer
signal health_updated(health)
signal killed()

# Called when the node enters the scene tree for the first time.
func _ready():
	thrust = Vector3()
	pass # Replace with function body.

		
func _physics_process(delta):
	if Input.is_action_just_pressed("press_k"):
		print("Ouch")
		damage(10)
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


func damage(amount):
	#Create IFrame so that player does not repeatedly take damage
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
		_set_health(health-amount)
	
func kill():
	print("You Are Dead!")
	pass
	
func _set_health(value):
	var prev_health= health
	health = clamp(value, 0 , max_health)
	if health != prev_health:
		emit_signal("health_updated",health)
		if health == 0:
			kill()
			emit_signal("killed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
