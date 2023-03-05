import 'package:flutter/material.dart';

class ThirtyDayPlanScreen extends StatelessWidget {
  final List<String> exercises = [
    'Upper Body',
    'Lower Body',
    'Core',
    'Cardio',
    'Upper Body & Lower Body',
    'Cardio & Core',
    'Rest',
    'Cardio & Core',
    'Lower Body',
    'Upper Body',
    'Rest',
    'Cardio & Core',
    'Upper Body & Lower Body',
    'Rest',
    'Core',
    'Rest',
    'Upper Body, Lower Body, Core',
    'Cardio',
    'Core & Upper Body',
    'Lower Body – try an advanced move!',
    'Rest',
    'Upper Body – try an advanced move!',
    'Core & Lower Body',
    'Cardio',
    'Rest',
    'Upper Body & Lower Body',
    'Core & Cardio',
    'Rest',
    'Upper Body',
    'Lower Body'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thirty Day Plans'),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (BuildContext context, int index) {
          final exercise = exercises[index];
          return ListTile(
            title: Text('Day ${index + 1}: $exercise'),
          );
        },
      ),
    );
  }
}
