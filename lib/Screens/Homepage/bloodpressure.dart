import 'package:flutter/material.dart';

class BloodPressureScreen extends StatefulWidget {
  @override
  _BloodPressureScreenState createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _bmiController = TextEditingController();
  String _result = '';

  @override
  void dispose() {
    _ageController.dispose();
    _genderController.dispose();
    _bmiController.dispose();
    super.dispose();
  }

  void _calculateBloodPressure() {
    final age = int.parse(_ageController.text);
    final gender = _genderController.text.toLowerCase();
    final bmi = double.tryParse(_bmiController.text) ?? 0.0;
    double systolic, diastolic;

    // Calculate systolic and diastolic based on age, gender, and BMI
    if (gender == 'male') {
      systolic = 109 + (0.5 * age) + (0.1 * bmi);
      diastolic = 63 + (0.1 * age) + (0.15 * bmi);
    } else {
      systolic = 107 + (0.5 * age) + (0.1 * bmi);
      diastolic = 63 + (0.1 * age) + (0.1 * bmi);
    }

    // Format the result as a string
    final result = 'Systolic: ${systolic.toStringAsFixed(0)} mmHg\\nn'
        'Diastolic: ${diastolic.toStringAsFixed(0)} mmHg';

    setState(() {
      _result = result;
    });

    if (bmi == 0.0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Please enter your BMI'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/bmi-calculator').then((value) {
                  // Update the BMI controller with the new value
                  _bmiController.text = value.toString();
                  // Recalculate the blood pressure
                  _calculateBloodPressure();
                });
              },
              child: Text('Calculate BMI'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/bmi-calculator').then((value) {
                  // Update the BMI controller with the new value
                  _bmiController.text = value.toString();
                });
              },
              child: Text('Check your BMI?'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Pressure'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Age',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    labelText: 'Gender (male or female)',
                  ),
                  validator: (value) {
                    if (value == null ||
                        (value.toLowerCase() != 'male' &&
                            value.toLowerCase() != 'female')) {
                      return 'Please enter your gender (male or female)';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  controller: _bmiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'BMI',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your BMI';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calculateBloodPressure();
                  }
                },
                child: Text('Calculate'),
              ),
              SizedBox(height: 18),
              Text(_result),
            ],
          ),
        ),
      ),
    );
  }
}
