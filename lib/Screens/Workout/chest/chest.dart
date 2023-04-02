import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/Workout/chest/jumpingjacks4.dart';
import 'package:flutter_auth/Screens/Workout/chest/kneepushups2.dart';
import 'package:flutter_auth/Screens/Workout/chest/pushups2.dart';
import 'package:flutter_auth/Screens/Workout/chest/triceps.dart';
import 'package:flutter_auth/Screens/Workout/chest/triceps2.dart';
import 'package:flutter_auth/Screens/Workout/chest/widearm2.dart';
import 'package:flutter_auth/Screens/Workout/chest/widearm3.dart';

class ChestScreen extends StatefulWidget {
  @override
  _ChestScreenState createState() => _ChestScreenState();
}

class _ChestScreenState extends State<ChestScreen> {
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
        title: Text('Chest Workout'),
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
                  MaterialPageRoute(builder: (context) => JumpingJack4Screen()),
                );
              },
              child: _buildExerciseTile('JUMPING JACKS',
                  'assets/animations/jumpingjacks.gif', '20:00'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.43);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PushUp2Screen()),
                );
              },
              child: _buildExerciseTile('PUSH UPS',
                  'assets/animations/pushup.gif', 'x8'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(4.65);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WideArmPushUp2Screen()),
                );
              },
              child: _buildExerciseTile(
                  'WIDE ARM PUSH UP', 'assets/animations/widearmpushups.gif', 'x8'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(3.88);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TricepsScreen()),
                );
              },
              child: _buildExerciseTile(
                  'SINGLE LEG TRICEPS', 'assets/animations/singlelegtricepdips.gif', 'x10'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(4.65);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WideArmPushUp3Screen()),
                );
              },
              child: _buildExerciseTile('WIDE ARM PUSH UP',
                  'assets/animations/widearmpushups.gif', 'x6'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(3.88);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Triceps2Screen()),
                );
              },
              child: _buildExerciseTile('SINGLE LEG TRICEPS',
                  'assets/animations/singlelegtricepdips.gif', 'x8'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(4.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KneePushUp2Screen()),
                );
              },
              child: _buildExerciseTile('KNEE PUSH UP',
                  'assets/animations/kneepushups.gif', 'x8'),
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