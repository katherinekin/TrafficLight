# TrafficLight

This exercise simulates a traffic light sequence at an intersection, given the direction for which the first light is green, the number of cars allowed to pass through before a light change, and each car as they arrive. The car is specified by their license plate, the direction they are headed, and how long they use the intersection for (some people drive faster than others), and arrive in the order they appear. This information is included in an input file that is read by the program. Finally, the traffic light changes in a clockwise sequence.

The program should then output what the current direction is for the traffic light, and which car is let through and for how long they use the intersection. 

Input file format:
- Starting direction
- How many cars to let through before a light change
- License1 Direction1 Time1
- License2 Direction2 Time2  
...

Output format:
- Current direction: {Northbound|Eastbound|Southbound|Westbound}
- Car {License} is using the intersection for {Time} sec(s).  
...

Run the test.sh file to compile the program and go through five unit tests.
