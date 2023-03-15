import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FullBodyScreen extends StatefulWidget {
  @override
  _FullBodyScreenState createState() => _FullBodyScreenState();
}

class _FullBodyScreenState extends State<FullBodyScreen> {
  List<Map<String, dynamic>> _workouts = [
    {
      'title': 'Jumping Jacks',
      'duration': 20,
      'animation': FlareActor(
        'assets/animations/jumping_jacks.flr',
        animation: 'jumping_jacks',
        fit: BoxFit.contain,
      ),
    },
    {
      'title': 'Incline push ups',
      'duration': 10,
      'animation': FlareActor(
        'assets/animations/incline_push_ups.flr',
        animation: 'incline_push_ups',
        fit: BoxFit.contain,
      ),
    },
    {
      'title': 'Knee push ups',
      'duration': 6,
      'animation': FlareActor(
        'assets/animations/knee_push_ups.flr',
        animation: 'knee_push_ups',
        fit: BoxFit.contain,
      ),
    },
    {
      'title': 'Push Ups',
      'duration': 30,
      'animation': FlareActor(
        'assets/animations/push_ups.flr',
        animation: 'push_ups',
        fit: BoxFit.contain,
      ),
    },
    {
      'title': 'Wide Arm Push Ups',
      'duration': 30,
      'animation': FlareActor(
        'assets/animations/wide_arm_push_ups.flr',
        animation: 'wide_arm_push_ups',
        fit: BoxFit.contain,
      ),
    },
    {
      'title': 'Cobra Stretch',
      'duration': 20,
      'animation': FlareActor(
        'assets/animations/cobra_stretch.flr',
        animation: 'cobra_stretch',
        fit: BoxFit.contain,
      ),
    },
    {
      'title': 'Chest Stretch',
      'duration': 20,
      'animation': FlareActor(
        'assets/animations/chest_stretch.flr',
        animation: 'chest_stretch',
        fit: BoxFit.contain,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Body Workout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var workout in _workouts)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutDetailScreen(
                        title: workout['title'],
                        duration: workout['duration'],
                        animation: workout['animation'],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              workout['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('${workout['duration']} seconds'),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      SizedBox(
                        height: 60.0,
                        width: 60.0,
                        child: workout['animation'],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class WorkoutDetailScreen extends StatefulWidget {
  final String title;
  final int duration;
  final Widget animation;

  WorkoutDetailScreen({
    required this.title,
    required this.duration,
    required this.animation,
  });

  @override
  _WorkoutDetailScreenState createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  int _remainingTime = 0;
  bool _isRunning = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isRunning = false;
          _timer.cancel();
        }
      });
    });
    _isRunning = true;
  }

  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: widget.animation,
            ),
            SizedBox(height: 16.0),
            Text(
              '$_remainingTime seconds',
              style: TextStyle(fontSize: 48.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _startTimer,
                  child: Text('Start'),
                ),
                ElevatedButton(
                  onPressed: _isRunning ? _stopTimer : null,
                  child: Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
