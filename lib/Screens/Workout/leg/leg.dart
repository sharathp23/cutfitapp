import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/Workout/leg/corestrengthening.dart';
import 'package:flutter_auth/Screens/Workout/leg/donkeykicks2.dart';
import 'package:flutter_auth/Screens/Workout/leg/frontbacklunges.dart';
import 'package:flutter_auth/Screens/Workout/leg/leglift3.dart';
import 'package:flutter_auth/Screens/Workout/leg/sidehop.dart';
import 'package:flutter_auth/Screens/Workout/leg/skiabs.dart';
import 'package:flutter_auth/Screens/Workout/leg/squats3.dart';

class LegScreen extends StatefulWidget {
  @override
  _LegScreenState createState() => _LegScreenState();
}

class _LegScreenState extends State<LegScreen> {
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
        title: Text('Leg Workout'),
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
                  MaterialPageRoute(builder: (context) => SidehopScreen()),
                );
              },
              child: _buildExerciseTile(
                  'SIDE HOP', 'assets/animations/sidehop.gif', '20:00'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(3.7);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Squats3Screen()),
                );
              },
              child: _buildExerciseTile(
                  'SQUATS', 'assets/animations/squats.gif', 'x12'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(4.2);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LegLift3Screen()),
                );
              },
              child: _buildExerciseTile(
                  'LEG LIFT', 'assets/animations/leglift.gif', 'x12'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.4);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FrontAndBackLunges2Screen()),
                );
              },
              child: _buildExerciseTile('FRONT AND BACK LUNGES',
                  'assets/animations/frontandbacklunges.gif', 'x14'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(4.4);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonkeyKicks2Screen()),
                );
              },
              child: _buildExerciseTile(
                  'DONKEY KICKS', 'assets/animations/donkeykicks.gif', 'x16'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoreScreen()),
                );
              },
              child: _buildExerciseTile('CORE STRENGTHENING',
                  'assets/animations/corestrengthening.gif', '00:20'),
            ),
            _buildHorizontalLine(),
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SkiabsScreen()),
                );
              },
              child: _buildExerciseTile(
                  'SKI ABS', 'assets/animations/skiabs.gif', '00:20'),
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

