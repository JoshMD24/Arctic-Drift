//To make this script work you must assign to to your main camera then select the object you want it to follow

using UnityEngine;

public class CameraFollowPlayer : MonoBehaviour
{

    public Transform player;
    public Vector3 offset;
    // Update is called once per frame
    void Update()
    {
        //By defualt camera will be right in the players location
        //Use offset to decided how far the camera will be when its following the player
        transform.position = player.position + offset;
    }
}
