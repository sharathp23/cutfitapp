import 'package:flutter/material.dart';

class AllergyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Allergies'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Common Allergens',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFoodCard(context, 'Peanuts', 'assets/images/peanuts.jpg'),
                  _buildFoodCard(context, 'Milk', 'assets/images/milk.jpg'),
                  _buildFoodCard(context, 'Wheat', 'assets/images/wheats.jpg'),
                  _buildFoodCard(context, 'Eggs', 'assets/images/eggs.jpg'),
                  _buildFoodCard(context, 'Fish', 'assets/images/fish.jpg'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Non-Allergens',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFoodCard(context, 'Carrots', 'assets/images/carrots.jpg'),
                  _buildFoodCard(context, 'Broccoli', 'assets/images/brocolli.jpg'),
                  _buildFoodCard(context, 'Apples', 'assets/images/apples.jpg'),
                  _buildFoodCard(context, 'Blueberries', 'assets/images/blueberries.jpg'),
                  _buildFoodCard(context, 'Rice', 'assets/images/rice.jpg'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Symptoms of Allergies',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Symptoms of allergies include sneezing, itching, hives, swelling, stomach cramps, and difficulty breathing.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Tips on How to Avoid Allergies',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Avoiding allergens is the best way to prevent allergic reactions. Read food labels carefully, and ask restaurant staff about ingredients before ordering. Keep an epinephrine auto-injector with you at all times if you have severe allergies.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Allergy-Friendly Recipes',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecipeCard(context, 'Carrot Soup', 'assets/images/carrot_soup.jpg'),
                  _buildRecipeCard(context, 'Broccoli Salad', 'assets/images/broccolo_salad.jpg'),
                  _buildRecipeCard(context, 'Apple Crisp', 'assets/images/apple_crisp.jpg'),
                  _buildRecipeCard(context, 'Blueberry Smoothie', 'assets/images/blueberry_smoothie.jpg'),
                  _buildRecipeCard(context, 'Rice Bowl', 'assets/images/rice_bowl.jpg'),
                ], 
               ), 
            ), 
           ], 
          ),
         ),
       );
      }
     Widget _buildFoodCard(BuildContext context, String title, String imagePath) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(title),
      ],
    ),
  );
}
Widget _buildRecipeCard(BuildContext context, String title, String imagePath) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(title),
      ],
    ),
  );
}
}



