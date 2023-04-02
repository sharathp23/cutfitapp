import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_auth/Screens/Workout/arm/onearmtriceps.dart';

class ArmCircles2Screen extends StatefulWidget {
  @override
  _ArmCircles2ScreenState createState() => _ArmCircles2ScreenState();
}

class _ArmCircles2ScreenState extends State<ArmCircles2Screen> {
  int _remainingSeconds = 30;
  Timer? _timer;
  final _assetsAudioPlayer = AssetsAudioPlayer();
  bool _isTimerCompleted = false;
  double _caloriesBurned = 0.0; // initialize to zero
  final int _weight = 70; // assume weight is 70 kg
  final double _mets = 4.0; // moderate intensity exercise (4 METs)


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

  void _navigateToOneArmTricepsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OneArmTricepsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = '${(_remainingSeconds % 60).toString().padLeft(2, '0')}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Arm Circles'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/animations/armcircles.gif', height: 300),
          SizedBox(height: 20),
          Text(
            'Arm Circles',
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
              onPressed: () {
                double caloriesBurned = calculateCaloriesBurned(20, _weight,
                    _mets); // calculate calories burned for 20 seconds
                showDialog(
                  context: context,
                  builder: (context) =>AlertDialog(
title: Text('Workout Complete'),
content: Text(
'You burned ${caloriesBurned.toStringAsFixed(2)} calories.'),
actions: [
TextButton(
onPressed: () {
Navigator.pop(context);
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => OneArmTricepsScreen (),
),
);
},
child: Text('OK'),
),
],
),
);
},
child: Text('Next'),
),
],
),
);
}
double calculateCaloriesBurned(int seconds, int weight, double intensity) {
double caloriesPerSecond = 0.001 * intensity * weight;
return caloriesPerSecond * seconds;
}
}