using Godot;
using System;

//Attach the Boat rigidbody component
public class Boat : RigidBody
{
    
    public Camera camera;
    public Transform transform;
    private Vector3 thrust;

    private float forwardThrust = 5f;
    private float rotationThrust = .8f;

    private const float max_velocity = 10f;
    private const float max_rotation = 2f;

    public override void _Ready()
    {
        camera = GetNode<Camera>("Boat_Camera");
        transform= camera.GetCameraTransform();
        thrust = new Vector3();
    }

    public override void _Process(float delta)
    {

    }
    public override void _PhysicsProcess(float delta)
    {
        GD.Print("Current Velocity" + LinearVelocity.Length());
        
        GD.Print("Current rotation" + AngularVelocity.Length());
        _GetMouvement();
        

    }

    public void _GetMouvement(){
        if(Input.IsActionPressed("ui_up")){
            //move up
            GD.Print("Moving up");
            if(LinearVelocity.Length()<max_velocity)
            {    
                thrust = forwardThrust * GlobalTransform.basis.x;
                ApplyCentralImpulse(thrust);
            }
        }
        if(Input.IsActionPressed("ui_down")){
            //move down
            GD.Print("Moving down");

            if(LinearVelocity.Length()<max_velocity){
                thrust = forwardThrust *GlobalTransform.basis.x;
                ApplyCentralImpulse(-thrust);     
            }
  
        }
        if(Input.IsActionPressed("ui_right")){
            //move right
            
            GD.Print("Moving right");
            if(AngularVelocity.Length()<max_rotation){
                thrust = rotationThrust *GlobalTransform.basis.y;
                ApplyTorqueImpulse(-thrust);       
            }
        }               
        if(Input.IsActionPressed("ui_left")){
            //move left
            GD.Print("Moving left");
            if(AngularVelocity.Length()<max_rotation){
                thrust = rotationThrust * GlobalTransform.basis.y;
                ApplyTorqueImpulse(thrust);
            }
        }
    }

}
