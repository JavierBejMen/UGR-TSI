/*
 * run_Rwalk.cpp
 *
 *  
 *      Author: Javier
 */

#include "Rwalk.h"

int main(int argc, char **argv) {
    // Initiate new ROS node named "Rwalk"
    ros::init(argc, argv, "random_walk");

    // Create new Rwalk object
    Rwalk Rwalk;

    // Start the movement
    Rwalk.startMoving();

    return 0;
};
