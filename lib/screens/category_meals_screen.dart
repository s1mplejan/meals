import 'package:flutter/material.dart';

import '../widgets/MealItem.dart';
import '../moduls/meals.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String categoryName;
  final Function toggleLike;
  const CategoryMealsScreen(
      {Key? key,
      required this.toggleLike,
      required this.meals,
      required this.categoryName})
      : super(key: key);

  static const routeName = '/category-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryName),
      ),
      body: meals.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) => MealItem(
                meal: meals[index],
                toggleLike: toggleLike,
              ),
              itemCount: meals.length,
            )
          : Center(
              child: Text(
                "Hozircha ovqat mavjud emas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }
}
