import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Workout/oneweekplan.dart';
import 'package:flutter_auth/Screens/Workout/thirtydayplan.dart';
import 'package:flutter_auth/Screens/Workout/twoweekplan.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plans', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1.0,
        padding: EdgeInsets.all(10.0),
        mainAxisSpacing: 10.0,
        children: [
          _buildPlanImage(
            image: 'assets/images/1_week_plan.png',
            title: '1-WEEK PLAN',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OneWeekPlanScreen()),
              );
            },
          ),
          _buildPlanImage(
            image: 'assets/images/2_week_plan.png',
            title: '2-WEEK PLAN',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TwoWeekPlanScreen()),
              );
            },
          ),
          _buildPlanImage(
            image: 'assets/images/30_day_plan.png',
            title: '30 DAY PLAN',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirtyDayPlanScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlanImage({
    required String image,
    required String title,
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
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

