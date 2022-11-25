import 'package:flutter/material.dart';

import '../moduls/category.dart';
// ignore: unused_import
import '../screens/category_meals_screen.dart';
// ignore: unused_import
import '../moduls/meals.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final List<Meal> meals;
  final Function toggleLike;
  const CategoryItem({
    Key? key,
    required this.category,
    required this.meals,
    required this.toggleLike,
  }) : super(key: key);

  void _gotoCategoryMealsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => CategoryMealsScreen(
                categoryName: category.title,
                meals: meals,
                toggleLike: toggleLike,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _gotoCategoryMealsScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
