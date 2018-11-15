//This is a basic movement script that i use for my car

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Movement : MonoBehaviour
{

    public float moveSpeed;

    // Use this for initialization
    void Start()
    {
        //Setting the movement speed
        moveSpeed = 2f;
    }

    // Update is called once per frame
    void Update()
    {
        //Move on the x axis                                                     0 is the y axis          Move on the y axis
        transform.Translate(moveSpeed * Input.GetAxis("Horizontal") * Time.deltaTime, 0f, moveSpeed * Input.GetAxis("Vertical") * Time.deltaTime);


    }
}
