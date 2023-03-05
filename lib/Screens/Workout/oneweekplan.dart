import 'package:flutter/material.dart';


class OneWeekPlanScreen extends StatelessWidget {
  const OneWeekPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One Week Plan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Day 1\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('30-minute walking workout\n'),
            Text(
              'Day 2\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Toning: Pilates for beginners\n'),
            Text(
              'Day 3\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Cardio dance workout\n'),
            Text(
              'Day 4\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Toning: full body beginner workout\n'),
            Text(
              'Day 5\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('30-Minute Latin spice walk\n'),
            Text(
              'Day 6\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Toning: full body beginner workout\n'),
            Text(
              'Day 7\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Reset: Full Body Yoga Stretch\n'),
          ],
        ),
      ),
    );
  }
}
