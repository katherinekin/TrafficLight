#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <unistd.h>  //for sleep()
#include <sys/wait.h>	// for wait(NULL)

using namespace std;

struct Car {
  string lic;
  char dir;
  int time;
};

int main()
{
  char firstDir;
  int maxCars;

  cin >> firstDir;	// starting direction
  cin >> maxCars;	// max cars to go through traffic light
  
  string lic;
  char dir;
  int time;
  
 // Read the input file, store cars as read into carVector
  vector<Car> carVector;
  while (cin >> lic && cin >> dir && cin >> time)
  {
    Car c { lic, dir, time };
    carVector.push_back(c);
  }

  string directions = "NESW";
  int index = directions.find(firstDir);

  // Sort cars by direction and maxCars, store in sortedQueue
  vector<Car> sortedVector;

  while (!carVector.empty())
  {
    int carPassed = 0;
    for (int i = 0; i < carVector.size(); i++)
    {
      if (carVector.at(i).dir == directions[index])
      {
        sortedVector.push_back(carVector.at(i));
        carPassed++;
        carVector.erase(carVector.begin() + i);
        i--;
      }

      if (carPassed == maxCars)
        break;
    }
    index = (index + 1) % 4;	// get index of new direction
  }

  // Index keeps track of which direction, retrieves correct term and queue
  string dirArray[] = {"Northbound", "Eastbound", "Southbound", "Westbound"};

  // Create a child process for every car
  pid_t pid;

  char lastDir = firstDir;
  Car currCar;

  for (int i = 0; i < sortedVector.size(); i++)
  {
    wait(NULL);
    currCar = sortedVector.at(i);

   // Prints per direction change 
    if (i == 0 || currCar.dir != lastDir)
    {
      cout << "Current direction: " << dirArray[directions.find(currCar.dir)] << endl;
      lastDir = currCar.dir;
    }
   // Only allows parent to make child processes
    if ((pid = fork()) == 0)
      break;

  }
  // Instruction for children
  if (pid == 0)
  {
      cout << "Car " << currCar.lic << " is using the intersection for " << currCar.time << " sec(s)." << endl;
      sleep(currCar.time);
  }

  // Instruction for parent
  else
  {
    for (int j = 0; j < sortedVector.size(); j++)
      wait(NULL);
    
  }
  return 0;
}
