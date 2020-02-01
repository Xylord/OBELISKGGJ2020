using Godot;
using System;

public class WinArea : Godot.Area
{
    //Make sure That this stays on Layer 5 and activate layer/mask [5] for collisions
    public void OnEnter(Node other){
        GD.Print("HelloWorld");
    }
}
