import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_auth/Screens/Workout/workout_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChildPoseScreen(),
      routes: {
        '/Workout': (context) => WorkoutScreen(),
      },
    );
  }
}

class ChildPoseScreen extends StatefulWidget {
  @override
  _ChildPoseScreenState createState() => _ChildPoseScreenState();
}

class _ChildPoseScreenState extends State<ChildPoseScreen> {
  int _remainingSeconds = 30;
  Timer? _timer;
  final _assetsAudioPlayer = AssetsAudioPlayer();
  bool _isTimerCompleted = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _assetsAudioPlayer.open(Audio('assets/audio/beep.mp3'));
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

void _startTimer() {
  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    setState(() {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        if (_remainingSeconds <= 5 && _remainingSeconds > 0) {
          _assetsAudioPlayer.play();
        }
        if (_remainingSeconds == 0) {
          _isTimerCompleted = true;
          _timer?.cancel();
        }
      }
    });
  });
}

  void _goToWorkoutScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutScreen()));
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = '${(_remainingSeconds % 60).toString().padLeft(2, '0')}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Pose'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!_isTimerCompleted)
            Image.asset('assets/animations/childspose.jpg', height: 300),
          SizedBox(height: 20),
          Text(
            'CHILDS POSE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '00:30',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            '00:$remainingTime',
            style: TextStyle(fontSize: 48),
          ),
          SizedBox(height: 20),
          if (_isTimerCompleted)
            ElevatedButton(
              onPressed: _goToWorkoutScreen,
              child: Text('Next'),
            ),
        ],
      ),
    );
  }
}