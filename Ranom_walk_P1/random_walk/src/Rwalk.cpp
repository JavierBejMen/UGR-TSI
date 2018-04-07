// Random walk by Javier Bejar Mendez

#include "Rwalk.h"
#include "geometry_msgs/Twist.h"
#include <stdlib.h>
#include <iostream>

Rwalk::Rwalk()
{
    keepMoving = true;
    rotating = false;

    // Advertise a new publisher for the robot's velocity command topic
    commandPub = node.advertise<geometry_msgs::Twist>("/cmd_vel_mux/input/teleop", 10);

    // Subscribe to the simulated robot's laser scan topic
    laserSub = node.subscribe("scan", 1, &Rwalk::scanCallback, this);
}

// Send a velocity command
void Rwalk::moveForward() {
    geometry_msgs::Twist msg; // The default constructor will set all commands to 0
    msg.linear.x = FORWARD_SPEED;
    commandPub.publish(msg);
}

void Rwalk::rotate(int dir)
{
	
	
	geometry_msgs::Twist msg;
	msg.angular.z = ANGULAR_SPEED * dir;
	commandPub.publish(msg);
}

// Process the incoming laser scan message
void Rwalk::scanCallback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
	bool isObstacleInFront = false;

    // Find the closest range between the defined minimum and maximum angles
    int minIndex = ceil((MIN_SCAN_ANGLE - scan->angle_min) / scan->angle_increment);
    int maxIndex = floor((MAX_SCAN_ANGLE - scan->angle_min) / scan->angle_increment);
	
	float currAngle = scan->angle_min;
	float minCloseAngle;
	double mindist = MIN_DIST_FROM_OBSTACLE;
    
    //Recorre todas las mediciones para guardar el angulo de la medicion mas cercana
    for (int currIndex = minIndex + 1; currIndex <= maxIndex; currIndex++)
    {
		currAngle += scan->angle_increment; //Angulo de la medicion actual
		if (scan->ranges[currIndex] < mindist)
		{
			if(!isObstacleInFront) //Solo manda stop la primera vez
			{
				isObstacleInFront = true;
			}
			mindist = scan->ranges[currIndex]; //distancia al bjeto mas cercano
			minCloseAngle = currAngle; //Angulo del objeto mas cercano
		}
	}
    
    //Si encuentra obstaculo y no esta rotando
    if(isObstacleInFront && !rotating)
    {
		ROS_INFO("Stop!");
		keepMoving = false; //Se para
		ROS_INFO("minCloseAngle: %f", minCloseAngle);
		dirRotate = (minCloseAngle < 0 ? 1 : -1); //Direccion opuesta al objeto mas cercano
	}
}

void Rwalk::startMoving()
{
    ros::Rate rate(10);
    ROS_INFO("Start moving");
	double begin;
	int tRot;
    // Keep spinning loop until user presses Ctrl+C or the robot got too close to an obstacle
    while (ros::ok()) {
		while(keepMoving)
		{
			moveForward();
			ros::spinOnce(); // Need to call this function often to allow ROS to process incoming messages
			rate.sleep();
		}
		tRot = (rand() % 8); //Tiempo aleatorio de rotacion [0, 7]
		begin = ros::Time::now().toSec() + tRot;
		if(dirRotate > 0)
			ROS_INFO("Turning left for %d secs", tRot);
		else ROS_INFO("Turning right for %d secs", tRot);
		while(begin - ros::Time::now().toSec() > 0)
		{
			rotate(dirRotate);
			ros::spinOnce(); // Need to call this function often to allow ROS to process incoming messages
			rate.sleep();
		}
		rotating = false; //Para de rotar
		keepMoving = true; 
	}
}


