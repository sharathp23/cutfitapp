import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Workout/oneweekplan.dart';
import 'package:flutter_auth/Screens/Workout/thirtydayplan.dart';
import 'package:flutter_auth/Screens/Workout/twoweekplan.dart';

class WorkoutScreen extends StatelessWidget {
const WorkoutScreen({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Workout Plans', style: TextStyle(color: Colors.white)),
centerTitle: true,
),
body: GridView.count(
crossAxisCount: 1,
childAspectRatio: 0.8,
padding: EdgeInsets.all(10.0),
mainAxisSpacing: 10.0,
children: [
_buildPlanImage(
image: 'assets/images/1_week_plan.png',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => OneWeekPlanScreen()),
);
},
),
_buildPlanImage(
image: 'assets/images/2_week_plan.png',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => TwoWeekPlanScreen()),
);
},
),
_buildPlanImage(
image: 'assets/images/30_day_plan.png',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => ThirtyDayPlanScreen()),
);
},
),
],
),
);
}

Widget _buildPlanImage({
required String image,
required VoidCallback onTap,
}) {
return InkWell(
onTap: onTap,
child: Container(
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage(image),
fit: BoxFit.cover,
),
),
height: 200,
margin: EdgeInsets.all(10.0),
),
);
}
}

