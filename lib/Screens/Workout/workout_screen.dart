import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Workout/fullbody.dart';
import 'package:flutter_auth/Screens/Workout/oneweekplan.dart';
import 'package:flutter_auth/Screens/Workout/thirtydayplan.dart';
import 'package:flutter_auth/Screens/Workout/twoweekplan.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullBodyScreen()),
                );
              },
              child: Section(image: 'assets/images/fullbody.jpeg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullBodyScreen()),
                );
              },
              child: Section(image: 'assets/images/lowerbody.jpeg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullBodyScreen()),
                );
              },
              child: Section(image: 'assets/images/abs.jpeg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullBodyScreen()),
                );
              },
              child: Section(image: 'assets/images/chest.jpeg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullBodyScreen()),
                );
              },
              child: Section(image: 'assets/images/arm.jpeg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullBodyScreen()),
                );
              },
              child: Section(image: 'assets/images/leg.jpeg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullBodyScreen()),
                );
              },
              child: Section(image: 'assets/images/shoulder.jpeg'),
            ),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String image;

  Section({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Image.asset(
        image,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
