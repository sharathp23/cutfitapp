import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Screens/Workout/chest/kneepushups2.dart';

class Triceps2Screen extends StatelessWidget {
  const Triceps2Screen({Key? key}) : super(key: key);

  static const double MET = 3.8;
  static const double WEIGHT_KG = 70.0;
  static const int DURATION_SECONDS = 50;

  // Method to calculate calories burned
  double calculateCaloriesBurned() {
    double caloriesPerMinute = MET * 3.5 * WEIGHT_KG / 200.0;
    double caloriesBurned = caloriesPerMinute * (DURATION_SECONDS / 60.0);
    return caloriesBurned;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/animations/singlelegtricepdips.gif',
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              'SINGLE LEG TRICEPS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'x8',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show pop-up window with calories burned
                double caloriesBurned = calculateCaloriesBurned();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Exercise Complete!'),
                      content: Text('You burned ${caloriesBurned.toStringAsFixed(2)} calories.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Navigate to push-up screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => KneePushUp2Screen()),
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
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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