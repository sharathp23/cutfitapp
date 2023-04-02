import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/Workout/shoulder/armcircle3.dart';
import 'package:flutter_auth/Screens/Workout/shoulder/armswings2.dart';
import 'package:flutter_auth/Screens/Workout/shoulder/doublelegdonkeykicks.dart';
import 'package:flutter_auth/Screens/Workout/shoulder/jumpingjacks6.dart';
import 'package:flutter_auth/Screens/Workout/shoulder/kneepushups3.dart';
import 'package:flutter_auth/Screens/Workout/shoulder/kneepushups4.dart';

class ShoulderScreen extends StatefulWidget {
  @override
  _ShoulderScreenState createState() => _ShoulderScreenState();
}

class _ShoulderScreenState extends State<ShoulderScreen> {
  final _scrollController = ScrollController();
  late SharedPreferences prefs;
  double totalCaloriesBurned = 0.0;

  @override
  void initState() {
    super.initState();
    _loadTotalCaloriesBurned();
  }

  Future<void> _loadTotalCaloriesBurned() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      totalCaloriesBurned = prefs.getDouble('totalCaloriesBurned') ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoulder Workout'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          Text(
            'TOTAL CALORIES BURNED: ${totalCaloriesBurned.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          Flexible(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JumpingJack6Screen()),
                      );
                    },
                    child: _buildExerciseTile('JUMPING JACKS',
                        'assets/animations/jumpingjacks.gif', '20:00'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArmSwings2Screen()),
                      );
                    },
                    child: _buildExerciseTile('ARM SWINGS',
                        'assets/animations/armswings.gif', '00:30'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArmCircles3Screen()),
                      );
                    },
                    child: _buildExerciseTile('ARM CIRCLES',
                        'assets/animations/armcircles.gif', '00:30'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(6.98);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KneePushUp3Screen()),
                      );
                    },
                    child: _buildExerciseTile('KNEE PUSH UP',
                        'assets/animations/kneepushups.gif', 'x14'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoublelegDonkeyKicksScreen()),
                      );
                    },
                    child: _buildExerciseTile('DOUBLE LEG DONKEY KICKS',
                        'assets/animations/doublelegdonkeykicks.gif', '00:20'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(7.76);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KneePushUp4Screen()),
                      );
                    },
                    child: _buildExerciseTile('KNEE PUSH UPS',
                        'assets/animations/kneepushups.gif', 'x12'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseTile(String title, String gifPath, String count) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Image.asset(gifPath, height: 170),
          SizedBox(height: 10),
          Text(
            count,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalLine() {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(vertical: 16.0),
      color: Colors.grey[300],
    );
  }
  void _incrementCaloriesBurned(double calories) async {
  setState(() {
    totalCaloriesBurned += calories;
  });
  await prefs.setDouble('totalCaloriesBurned', totalCaloriesBurned);
}
}
