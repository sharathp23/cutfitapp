import 'package:flutter/material.dart';

class TwoWeekPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2-Week Workout Plan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Week One\n\n',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Day 1\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Complete five rounds.\n\n'
              'Push-ups (10 reps)\n'
              'Bodyweight squats (20 reps)\n'
              'Forward lunges (5 reps each leg)\n'
              'Plank hold (30 seconds)\n'
              'Rest for 30 seconds and start again.\n',
            ),
            Text(
              'Day 2\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Warm Up: 8 to 10 minutes of an easy jog and dynamic movements: high-knees, butt-kicks, bounding and reverse run.\n'
              'Run at least 30 minutes. Use a walk/jog method if needed. Jog until you need a break, then walk and repeat for 30 minutes.\n'
              'Try to increase your mileage over time. Don\'t push too far, too fast.\n'
              'Cool Down: Do an easy jog for 10 minutes and then stretch.\n',
            ),
            Text(
              'Day 3\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Complete five rounds.\n\n'
              'Bodyweight squats (20 reps)\n'
              'Leg raises (20 reps)\n'
              'Lateral lunges (10 reps each leg)\n'
              'Plank hold (30 seconds)\n'
              'Rest for 30 seconds and start again.\n',
            ),
            Text(
              'Day 4\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Complete four rounds.\n\n'
              'Squats (20 reps)\n'
              'Jump squats (10 reps)\n'
              'Forward lunges (10 reps each leg)\n'
              'Jump lunges (5 reps each leg)\n'
              'Rest 2 minutes and then complete two rounds of the next circuit.\n\n'
              'Push-ups (60 seconds)\n'
              'Sit-ups (60 seconds)\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Week Two\n\n',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Day 1\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Complete one round.\n\n'
              'Jump squats (50 reps)\n'
              'Sit-ups (50 reps)\n'
              'Push-ups (50 reps)\n'
              'Jump lunges (20 reps each leg)\n'
              'Rest for 2 minutes and then complete two rounds of the next circuit.\n\n'
              'Russian twists (30 seconds)\n'
              'Mountain climbers (30 seconds)\n'
              'Rest for 30 seconds and start again.\n\n',
            ),
            Text(
              'Day 2\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Warm Up: 8 to 10 minutes of an easy jog and dynamic movements: high-knees, butt-kicks, bounding and reverse run.\n'
              'Do a 400 - meter run 4 to 8 times at maximum effort.\n'
              'Rest for the amount of time it takes you to complete a 400-meter run.\n'
              'Cool Down: Do an easy jog for 10 minutes and then stretch.\n\n',
            ),
            Text(
              'Day 3\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Complete this circuit as many times as possible in 15 minutes.\n'
              'Box jumps (5 reps)\n'
              'Burpees (10 reps)\n'
              'Sit-ups (15 reps)\n'
              'Bodyweight squats (20 reps)\n\n'
              'Rest for 30 seconds and start again.)\n\n',
            ),
            Text(
              'Day 4\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Complete six rounds.\n\n'
              'Squats (20 reps)\n'
              'Jump squats (10 reps)\n'
              'Forward lunges (10 reps each leg)\n'
              'Jump lunges (5 reps each leg)\n'
              'Rest 2 minutes and then complete two rounds of the next circuit.\n\n'
              'Push-ups (60 seconds)\n'
              'Sit-ups (60 seconds)',
            ),
          ],
        ),
      ),
    );
  }
}
