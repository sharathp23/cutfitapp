import 'package:flutter/material.dart';

class ExpertTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expert Tips'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top 5 Tips for a Healthy Lifestyle',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Exercise regularly: Physical activity is important for overall health and fitness. Aim for at least 30 minutes of moderate-intensity exercise most days of the week.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Eat a balanced diet: A healthy diet is key to maintaining a healthy weight and reducing the risk of chronic diseases. Make sure your diet includes a variety of fruits, vegetables, whole grains, lean protein, and healthy fats.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '3. Get enough sleep: Adequate sleep is essential for optimal health and well-being. Most adults need 7-9 hours of sleep per night.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '4. Manage stress: Chronic stress can have negative effects on both physical and mental health. Find ways to manage stress, such as meditation, exercise, or talking with a therapist.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '5. Avoid harmful habits: Avoid smoking, excessive alcohol consumption, and other harmful habits that can negatively impact your health.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
