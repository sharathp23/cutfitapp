import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/Workout/arm/armswings.dart';
import 'package:flutter_auth/Screens/Workout/arm/armcircles.dart';
import 'package:flutter_auth/Screens/Workout/arm/armcircles2.dart';
import 'package:flutter_auth/Screens/Workout/arm/inchworm.dart';
import 'package:flutter_auth/Screens/Workout/arm/jumpingjacks5.dart';
import 'package:flutter_auth/Screens/Workout/arm/onearmtriceps.dart';
import 'package:flutter_auth/Screens/Workout/arm/punches.dart';
import 'package:flutter_auth/Screens/Workout/arm/pushup3.dart';
import 'package:flutter_auth/Screens/Workout/arm/spidermanplank.dart';
import 'package:flutter_auth/Screens/Workout/arm/triceps3.dart';

class ArmScreen extends StatefulWidget {
  @override
  _ArmScreenState createState() => _ArmScreenState();
}

class _ArmScreenState extends State<ArmScreen> {
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
        title: Text('Arm Workout'),
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
                  MaterialPageRoute(builder: (context) => ArmSwingsScreen()),
                );
              },
              child: _buildExerciseTile('ARM SWINGS',
                  'assets/animations/armswings.gif', '30:00'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArmCirclesScreen()),
                );
              },
              child: _buildExerciseTile('ARM CIRCLES',
                  'assets/animations/armcircles.gif', '00:30'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(3.88);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Triceps3Screen()),
                );
              },
              child: _buildExerciseTile(
                  'SINGLE LEG TRICEPS', 'assets/animations/singlelegtricepdips.gif', 'x10'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArmCircles2Screen()),
                );
              },
              child: _buildExerciseTile(
                  'ARM CIRCLES', 'assets/animations/armcircles.gif', '00:30'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(3.88);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OneArmTricepsScreen()),
                );
              },
              child: _buildExerciseTile('ONE ARM TRICEPS PUSH UPS',
                  'assets/animations/onearmtriceppushups.gif', 'x6'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JumpingJack5Screen()),
                );
              },
              child: _buildExerciseTile('JUMPING JACKS',
                  'assets/animations/jumpingjacks.gif', '00:20'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(4.65);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SpidermanPlankScreen()),
                );
              },
              child: _buildExerciseTile('SPIDERMAN PLANK',
                  'assets/animations/spidermanplank.gif', 'x10'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PunchesScreen()),
                );
              },
              child: _buildExerciseTile('PUNCHES',
                  'assets/animations/punches.gif', '00:20'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.82);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PushUp3Screen()),
                );
              },
              child: _buildExerciseTile('PUSH UP',
                  'assets/animations/pushup.gif', 'x10'),
            ),
             _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.43);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InchwormScreen()),
                );
              },
              child: _buildExerciseTile('INCHWORMS',
                  'assets/animations/inchworm.gif', 'x8'),
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