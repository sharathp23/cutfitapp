import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';

class PedometerScreen extends StatefulWidget {
  @override
  _PedometerScreenState createState() => _PedometerScreenState();
}

class _PedometerScreenState extends State<PedometerScreen> {
  int _stepCount = 0;
  StreamSubscription<StepCount>? _pedometerSubscription;

  @override
  void initState() {
    super.initState();

    // Start listening to pedometer updates
    _pedometerSubscription = Pedometer.stepCountStream.listen(_onStepCount);
  }

  @override
  void dispose() {
    // Stop listening to pedometer updates
    _pedometerSubscription?.cancel();
    super.dispose();
  }

  void _onStepCount(StepCount event) {
    setState(() {
      _stepCount = event.steps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedometer'),
      ),
      body: Center(
        child: Text(
          '$_stepCount',
          style: TextStyle(fontSize: 64),
        ),
      ),
    );
  }
}
