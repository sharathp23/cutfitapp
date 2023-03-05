import 'package:flutter/material.dart';

class CalorieScreen extends StatefulWidget {
  @override
  _CalorieScreenState createState() => _CalorieScreenState();
}

class _CalorieScreenState extends State<CalorieScreen> {
  int _weight = 0;
  int _height = 0;
  int _age = 0;
  bool _isMale = true;
  double _bmr = 0.0;

  void _calculateBmr() {
    double weight = _weight.toDouble();
    double height = _height.toDouble();
    double age = _age.toDouble();

    if (_isMale) {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _weight = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(height: 18),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _height = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(height: 18),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age (years)',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _age = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: Text('Male'),
                          value: true,
                          groupValue: _isMale,
                          onChanged: (bool? value) {
                            setState(() {
                              _isMale = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: Text('Female'),
                          value: false,
                          groupValue: _isMale,
                          onChanged: (bool? value) {
                            setState(() {
                              _isMale = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: Text('Calculate'),
                    onPressed: () {
                      _calculateBmr();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Your BMR'),
                          content:
                              Text('${_bmr.toStringAsFixed(2)} calories/day'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
