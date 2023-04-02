import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Workout/abs/jumpingjacks3.dart';
import 'package:flutter_auth/Screens/Workout/abs/leglift.dart';
import 'package:flutter_auth/Screens/Workout/abs/leglift2.dart';
import 'package:flutter_auth/Screens/Workout/abs/mountainclimber2.dart';
import 'package:flutter_auth/Screens/Workout/abs/mountainclimber3.dart';
import 'package:flutter_auth/Screens/Workout/abs/plankjacks.dart';
import 'package:flutter_auth/Screens/Workout/abs/plankjacks2.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AbsScreen extends StatefulWidget {
  @override
  _AbsScreenState createState() => _AbsScreenState();
}

class _AbsScreenState extends State<AbsScreen> {
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
        title: Text('Abs Workout'),
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
                  MaterialPageRoute(builder: (context) => JumpingJack3Screen()),
                );
              },
              child: _buildExerciseTile('JUMPING JACKS',
                  'assets/animations/jumpingjacks.gif', '20:00'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                 _incrementCaloriesBurned(14.7);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MountainClimber2Screen()),
                );
              },
              child: _buildExerciseTile('MOUNTAIN CLIMBER',
                  'assets/animations/mountainclimber.gif', 'x16'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                 _incrementCaloriesBurned(6.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LegLiftScreen()),
                );
              },
              child: _buildExerciseTile(
                  'LEG LIFTS', 'assets/animations/leglift.gif', 'x16'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                 _incrementCaloriesBurned(6.98);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlankJacksScreen()),
                );
              },
              child: _buildExerciseTile(
                  'PLANK JACKS', 'assets/animations/plankjacks.gif', 'x20'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                 _incrementCaloriesBurned(11.8);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MountainClimber3Screen()),
                );
              },
              child: _buildExerciseTile('MOUNTAIN CLIMBER',
                  'assets/animations/mountainclimber.gif', 'x12'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                 _incrementCaloriesBurned(5.82);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LegLift2Screen()),
                );
              },
              child: _buildExerciseTile('LEG LIFTS',
                  'assets/animations/leglift.gif', 'x14'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                 _incrementCaloriesBurned(6.98);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlankJacks2Screen()),
                );
              },
              child: _buildExerciseTile('PLANK JACKS',
                  'assets/animations/plankjacks.gif', 'x20'),
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