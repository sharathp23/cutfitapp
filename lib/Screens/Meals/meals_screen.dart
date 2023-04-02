import 'package:flutter/material.dart';

class MealsScreen extends StatefulWidget {
  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Meals'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Pre-Workout'),
            Tab(text: 'Post-Workout'),
            Tab(text: 'Breakfast'),
            Tab(text: 'Lunch'),
            Tab(text: 'Dinner'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMealList('https://via.placeholder.com/150x150.png?text=Pre-Workout+Meal+1', 'Pre-Workout Meal 1'),
          _buildMealList('https://via.placeholder.com/150x150.png?text=Post-Workout+Meal+1', 'Post-Workout Meal 1'),
          _buildMealList('https://via.placeholder.com/150x150.png?text=Breakfast+Meal+1', 'Breakfast Meal 1'),
          _buildMealList('https://via.placeholder.com/150x150.png?text=Lunch+Meal+1', 'Lunch Meal 1'),
          _buildMealList('https://via.placeholder.com/150x150.png?text=Dinner+Meal+1', 'Dinner Meal 1'),
        ],
      ),
    );
  }

  Widget _buildMealList(String imageUrl, String title) {
    return ListView(
      children: [
        ListTile(
          leading: Image.network(imageUrl),
          title: Text(title),
          subtitle: Text('Meal Description'),
          trailing: Icon(Icons.favorite_border),
        ),
        ListTile(
          leading: Image.network(imageUrl),
          title: Text(title),
          subtitle: Text('Meal Description'),
          trailing: Icon(Icons.favorite_border),
        ),
        ListTile(
          leading: Image.network(imageUrl),
          title: Text(title),
          subtitle: Text('Meal Description'),
          trailing: Icon(Icons.favorite_border),
        ),
      ],
    );
  }
}
