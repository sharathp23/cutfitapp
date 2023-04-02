import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_auth/Screens/Workout/arm/armcircles.dart';

class ArmSwingsScreen extends StatefulWidget {
  @override
  _ArmSwingsScreenState createState() => _ArmSwingsScreenState();
}

class _ArmSwingsScreenState extends State<ArmSwingsScreen> {
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
            _caloriesBurned = ((_weight * _mets * _remainingSeconds) / 60)
                    .roundToDouble() /
                100; // calculate calories burned and round off to 2 decimal places
          }
        }
      });
    });
  }

  void _navigateToArmCirclesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ArmCirclesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = '${(_remainingSeconds % 60).toString().padLeft(2, '0')}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Arm Swings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/animations/armswings.gif', height: 300),
          SizedBox(height: 20),
          Text(
            'Arm Swings',
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
builder: (context) => ArmCirclesScreen(),
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