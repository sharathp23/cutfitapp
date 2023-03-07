import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Allergy/allergy_screen.dart';
import 'package:flutter_auth/Screens/ExpertTips/expert_tips.dart';
import 'package:flutter_auth/Screens/Homepage/bloodpressure.dart';
import 'package:flutter_auth/Screens/Homepage/bmicalculator.dart';
import 'package:flutter_auth/Screens/Homepage/caloriescount.dart';
import 'package:flutter_auth/Screens/Homepage/notification.dart';
import 'package:flutter_auth/Screens/Meals/meals_screen.dart';
import 'package:flutter_auth/Screens/Meditation/meditation_screen.dart';
import 'package:flutter_auth/Screens/Trainers/trainers_screen.dart';
import 'package:flutter_auth/Screens/Workout/workout_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  String _greetUser() {
    final now = DateTime.now();
    final currentTime = TimeOfDay.fromDateTime(now);

    if (currentTime.hour >= 0 && currentTime.hour < 12) {
      return "Good Morning";
    } else if (currentTime.hour >= 12 && currentTime.hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUT-FIT'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(243, 241, 240, 216),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _greetUser(),
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: [
                _buildBackgroundImage(
                  image: 'assets/images/workout.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorkoutScreen()),
                    );
                  },
                ),
                _buildBackgroundImage(
                  image: 'assets/images/meals.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MealsScreen()),
                    );
                  },
                ),
                _buildBackgroundImage(
                  image: 'assets/images/meditation.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MeditationScreen()),
                    );
                  },
                ),
                _buildBackgroundImage(
                  image: 'assets/images/allergy.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllergyScreen()),
                    );
                  },
                ),
                _buildBackgroundImage(
                  image: 'assets/images/trainers.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrainingScreen()),
                    );
                  },
                ),
                _buildBackgroundImage(
                  image: 'assets/images/expert_tips.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpertTipsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      Text('Home'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalorieScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.food_bank),
                      Text('Calories Count'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMICalculatorScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.calculate),
                      Text('BMI Calculator'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BloodPressureScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.favorite),
                      Text('Blood Pressure'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WaterReminderScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.notifications),
                      Text('Notifications'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage({
    required String image,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
