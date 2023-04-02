import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Screens/Workout/fullbody/kneepushups.dart';

class MountainClimberScreen extends StatelessWidget {
  const MountainClimberScreen({Key? key}) : super(key: key);

  // Calculate the number of calories burned
  double calculateCaloriesBurned(double durationInMinutes) {
    double weightInKg = 70; // Assuming weight is 70 kg
    double metValue = 8; // MET value for Mountain Climbers
    double caloriesPerMinute = metValue * weightInKg * 3.5 / 200;
    return caloriesPerMinute * durationInMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/animations/mountainclimber.gif',
              height: 400,
              width: 300,
            ),
            SizedBox(height: 20),
            Text(
              'MOUNTAIN CLIMBER',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'x6',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double durationInMinutes = 0.6; // Change this to the actual duration of the exercise
                double caloriesBurned = calculateCaloriesBurned(durationInMinutes);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Workout Complete'),
                      content: Text('You burned ${caloriesBurned.toStringAsFixed(1)} calories.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => KneePushUpScreen()),
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('DONE'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
