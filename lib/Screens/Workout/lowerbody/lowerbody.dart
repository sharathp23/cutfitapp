import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/WeightedDonkeyKick.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/donkeykicks.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/doublelegdonkeykicks.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/frontbacklunges.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/jumpingjacks2.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/squats.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/squats2.dart';
import 'package:flutter_auth/Screens/Workout/lowerbody/waistslimmersquats.dart';

class LowerBodyScreen extends StatefulWidget {
  @override
  _LowerBodyScreenState createState() => _LowerBodyScreenState();
}

class _LowerBodyScreenState extends State<LowerBodyScreen> {
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
        title: Text('Lower Body Workout'),
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
                            builder: (context) => JumpingJack2Screen()),
                      );
                    },
                    child: _buildExerciseTile('JUMPING JACKS',
                        'assets/animations/jumpingjacks.gif', '20:00'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(3.7);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SquatsScreen()),
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
                        MaterialPageRoute(
                            builder: (context) => WaistSlimmerSquatsScreen()),
                      );
                    },
                    child: _buildExerciseTile('WAIST SLIMMER SQUATS',
                        'assets/animations/waistslimmerdaysquats.gif', 'x12'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FrontAndBackLungesScreen()),
                      );
                    },
                    child: _buildExerciseTile('FRONT AND BACK LUNGES',
                        'assets/animations/frontandbacklunges.gif', 'x10'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeightedDonkeyKickScreen()),
                      );
                    },
                    child: _buildExerciseTile('WEIGHTED DONKEY KICKS',
                        'assets/animations/weighteddonkeykicks.gif', 'x12'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Squats2Screen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'SQUATS', 'assets/animations/squats.gif', 'x12'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(3.7);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DonkeyKicksScreen()),
                      );
                    },
                    child: _buildExerciseTile('DONKEY KICKS',
                        'assets/animations/donkeykicks.gif', 'x12'),
                  ),
                  _buildHorizontalLine(),
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(3.8);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoubleLegDonkeyKicksScreen()),
                      );
                    },
                    child: _buildExerciseTile('DOUBLE LEG DONKEY KICKS',
                        'assets/animations/doublelegdonkeykicks.gif', 'x6'),
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
