import 'package:flutter/material.dart';

import 'package:meals/moduls/category.dart';
import '../widgets/category_item.dart';
import '../moduls/meals.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> catigories;
  final List<Meal> meals;
  final Function toggleLike;

  CategoriesScreen(this.catigories, this.meals, this.toggleLike);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Ovqatlar menyusi'),
      // ),
      body: catigories.length > 0
          ? GridView(
              padding: EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: catigories.map((e) {
                final categoryMeals = meals
                    .where((element) => element.categoryId == e.id)
                    .toList();
                return CategoryItem(
                  category: e,
                  meals: categoryMeals,
                  toggleLike: toggleLike,
                );
              }).toList(),
            )
          : const Center(
              child: Text('Ovqat kategoriyalari mavjud emas.'),
            ),
    );
  }
}
