import 'package:flutter/material.dart';

// ignore: unused_import
import '../moduls/meals.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toggleLike;
  const MealItem({
    Key? key,
    required this.meal,
    required this.toggleLike,
  }) : super(key: key);

  void _gotoMealDetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: GestureDetector(
        onTap: () => _gotoMealDetails(context),
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        meal.imageUrl[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        width: 200,
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 5,
                          bottom: 5,
                          right: 20,
                        ),
                        color: Colors.black.withOpacity(0.6),
                        child: Text(
                          meal.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => toggleLike(meal.id),
                        icon: Icon(
                          meal.isLike ? Icons.favorite : Icons.favorite_outline,
                          color: Colors.black54,
                        ),
                      ),
                      Text("${meal.preparingTime} minute"),
                      Text("\$${meal.price}"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
