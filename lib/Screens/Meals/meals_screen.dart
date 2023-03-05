import 'package:flutter/material.dart';

class Meal {
  final String title;
  final String description;
  final String image;

  Meal({required this.title, required this.description, required this.image});
}

class MealsScreen extends StatelessWidget {

  final List<Meal> meals = [
    Meal(
      title: 'Breakfast',
      description: 'Scrambled eggs with tomatoes and spinach, whole wheat toast, and fresh fruit',
      image: 'assets/images/breakfast.jpg',
    ),
    Meal(
      title: 'Snack',
      description: 'Almond butter and banana smoothie, Whole grain crackers with hummus',
      image: 'assets/images/snacks.jpg',
    ),
    Meal(
      title: 'Lunch',
      description: 'Grilled chicken breast with quinoa and roasted vegetables',
      image: 'assets/images/lunch.jpg',
    ),
    Meal(
      title: 'Pre-Workout Meal',
      description: 'Greek yogurt with mixed berries and honey, A whole-wheat tortilla with almond butter',
      image: 'assets/images/pre_workoutmeals.jpg',
    ),
    Meal(
      title: 'Post-Workout Meal',
      description: 'Salmon fillet with sweet potato and green beans, Cottage cheese with sliced peaches',
      image: 'assets/images/post_workoutmeals.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Meals'),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(meals[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meals[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        meals[index].description,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
