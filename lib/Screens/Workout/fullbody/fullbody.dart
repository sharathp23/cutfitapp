import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/Workout/fullbody/assymetricalpushups.dart';
import 'package:flutter_auth/Screens/Workout/fullbody/declinepushups.dart';
import 'package:flutter_auth/Screens/Workout/fullbody/jumpingjacks.dart';
import 'package:flutter_auth/Screens/Workout/fullbody/kneepushups.dart';
import 'package:flutter_auth/Screens/Workout/fullbody/mountainclimber.dart';
import 'package:flutter_auth/Screens/Workout/fullbody/pushups.dart';
import 'package:flutter_auth/Screens/Workout/fullbody/widearm.dart';

class FullBodyScreen extends StatefulWidget {
  @override
  _FullBodyScreenState createState() => _FullBodyScreenState();
}

class _FullBodyScreenState extends State<FullBodyScreen> {
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
        title: Text('Full Body Workout'),
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
                        MaterialPageRoute(builder: (context) => JumpingJackScreen()),
                      );
                    },
                    child: _buildExerciseTile('JUMPING JACKS',
                        'assets/animations/jumpingjacks.gif', '20:00'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.9);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MountainClimberScreen()),
                      );
                    },
                    child: _buildExerciseTile('MOUNTAIN CLIMBER',
                        'assets/animations/mountainclimber.gif', 'x6'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.65);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KneePushUpScreen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'KNEE PUSH UPS', 'assets/animations/kneepushups.gif', 'x6'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.43);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PushUpScreen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'PUSH UPS', 'assets/animations/pushup.gif', 'x8'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.65);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WideArmPushUpScreen()),
                      );
                    },
                    child: _buildExerciseTile('WIDE ARM PUSH UPS',
                        'assets/animations/widearmpushups.gif', 'x6'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(6.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeclinePushUpScreen()),
                      );
                    },
                    child: _buildExerciseTile('DECLINE PUSH UPS', 'assets/animations/declinepushups.gif', 'x10'),
                    ),
          _buildHorizontalLine(),
          GestureDetector(
            onTap: () {
              _incrementCaloriesBurned(6.98);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AssymetricalPushUpScreen()),
              );
            },
            child: _buildExerciseTile('ASYMMETRICAL PUSH UPS',
                'assets/animations/assymetricalpushup.gif', 'x6'),
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
height: 1.0,
margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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