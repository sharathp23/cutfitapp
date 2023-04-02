import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/doublelegdonkeykicks.dart';


class DonkeyKicksScreen extends StatelessWidget {
  const DonkeyKicksScreen({Key? key}) : super(key: key);

    double calculateCaloriesBurned(double durationInMinutes) {
    double weightInKg = 70; // Assuming weight is 70 kg
    double metValue = 3.8; // MET value for Mountain Climbers
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
              'assets/animations/donkeykicks.gif',
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20),
            Text(
              'DONKEY KICKS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'x12',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double durationInMinutes = 0.8; // Change this to the actual duration of the exercise
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
                              MaterialPageRoute(builder: (context) => DoubleLegDonkeyKicksScreen()),
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