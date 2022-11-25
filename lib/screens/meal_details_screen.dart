// ignore_for_file: unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meals/moduls/meals.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/meal-details';

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: meal.imageUrl.map((image) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                  initialPage: activeImageIndex,
                  height: 250,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeImageIndex = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: meal.imageUrl.map((image) {
                final imageIndex = meal.imageUrl.indexOf(image);
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: activeImageIndex == imageIndex
                        ? Colors.black54
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }).toList(),
            ),
            Text(
              "\$${meal.price}",
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Ta'rifi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(meal.discription),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: Card(
                margin: const EdgeInsets.all(10),
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    return Text(
                      meal.ingradient[index],
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: meal.ingradient.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
