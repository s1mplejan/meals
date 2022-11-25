import 'package:flutter/material.dart';
import 'package:meals/moduls/meals.dart';

// ignore: unused_import
import 'catigories_screen.dart';
// ignore: unused_import
import 'favorites_screen.dart';
import '../moduls/category.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final List<Meal> meals;
  final Function toggleLike;

  TabsScreen(
      {Key? key,
      required this.categories,
      required this.meals,
      required this.toggleLike})
      : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _tapIntex = 0;
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {
        'page': CategoriesScreen(
          widget.categories,
          widget.meals,
          widget.toggleLike,
        ),
        'title': 'Ovqatlar menyusi'
      },
      {'page': FavoriteScreens(), 'title': 'Sevimli ovqatlar'},
    ];
  }

  void _changeTap(int index) {
    setState(() {
      _tapIntex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_tapIntex]['title']),
      ),
      body: _pages[_tapIntex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), label: 'Barchasi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Sevimlilar'),
        ],
        onTap: _changeTap,
        currentIndex: _tapIntex,
      ),
    );

    //   return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text("Ovqatlar menyusi"),
    //         bottom: const TabBar(tabs: [
    //           Tab(
    //             icon: Icon(Icons.more_horiz),
    //             text: "Barchasi",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.favorite),
    //             text: "Sevimli",
    //           ),
    //         ]),
    //       ),
    //       body: TabBarView(children: [
    //         CategoriesScreen(
    //           categories,
    //           meals,
    //         ),
    //         FavoriteScreens(),
    //       ]),
    //     ),
    //   );
  }
}
