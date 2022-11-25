import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './moduls/category.dart';
import './moduls/meals.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _catigoryModel = Categoreis();

  final _mealModel = Meals();

  void toggleLike(String mealId) {
    setState(() {
      _mealModel.toggleLike(mealId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.akayaTelivigala().fontFamily,
      ),
      // home: CategoriesScreen(_catigoryModel.list, _mealModel.list),
      routes: {
        '/': (context) => TabsScreen(
              categories: _catigoryModel.list,
              meals: _mealModel.list,
              toggleLike: toggleLike,
            ),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
      },
    );
  }
}
