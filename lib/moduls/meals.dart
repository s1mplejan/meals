class Meal {
  final String id;
  final String title;
  final List<String> imageUrl;
  final String discription;
  final List<String> ingradient;
  final int preparingTime;
  final double price;
  final String categoryId;
  bool isLike;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.discription,
    required this.ingradient,
    required this.preparingTime,
    required this.price,
    required this.categoryId,
    this.isLike = false,
  });
}

class Meals {
  List<Meal> _list = [
    Meal(
        id: 'm1',
        title: 'Lavash',
        imageUrl: ['assets/images/lavash.jpg', 'assets/images/burger.jpg'],
        discription: 'Ajoyib lavash :)',
        preparingTime: 10,
        price: 20,
        categoryId: 'c1',
        ingradient: ['Lavash', 'Go\'sht', 'Salat']),
    Meal(
        id: 'm2',
        title: 'Burger',
        imageUrl: ['assets/images/burger.jpg', 'assets/images/lavash.jpg'],
        discription: 'Mazzali burger :)',
        preparingTime: 15,
        price: 25,
        categoryId: 'c1',
        ingradient: ['Maxsus non', 'Maxsus go\'sht', 'Salat bargi']),
    Meal(
        id: 'm3',
        title: 'Fanta',
        imageUrl: ['assets/images/fanta.jpg'],
        discription: 'Salqin ichimlik',
        preparingTime: 1,
        price: 5,
        categoryId: 'c5',
        ingradient: ['Suv', 'Maxsus qo\'shimchalar']),
    Meal(
        id: 'm4',
        title: 'Coca Cola',
        imageUrl: ['assets/images/cola.jpg'],
        discription: 'Salqin ichimlik',
        preparingTime: 1,
        price: 4,
        categoryId: 'c5',
        ingradient: ['Suv', 'Maxsus qo\'shimchalar']),
    Meal(
        id: 'm5',
        title: 'Osh',
        imageUrl: ['assets/images/osh.jpg'],
        discription: 'Yesang osh, ko\'tarma bosh )',
        preparingTime: 25,
        price: 50,
        categoryId: 'c2',
        ingradient: ['Guruch', 'Yog\'', 'Sabzi', 'Go\'sht']),
    Meal(
        id: 'm6',
        title: 'Somsa',
        imageUrl: ['assets/images/somsa.jpg'],
        discription: 'Tomchi somsa',
        preparingTime: 10,
        price: 15,
        categoryId: 'c2',
        ingradient: ['Xamir', 'Piyoz', 'Go\'sht']),
    Meal(
        id: 'm7',
        title: 'Steak',
        imageUrl: ['assets/images/steak.jpg'],
        discription: 'Mazali go\'sht',
        preparingTime: 30,
        price: 65,
        categoryId: 'c2',
        ingradient: ['Go\'sht']),
    Meal(
        id: 'm8',
        title: 'O\'zbekcha salat',
        imageUrl: ['assets/images/uzbeksalat.jpg'],
        discription: 'achu-chuchu',
        preparingTime: 2,
        price: 1,
        categoryId: 'c6',
        ingradient: ['Pamidor', 'Bodring', 'Piyoz', 'Ko\'katlar']),
  ];

  List<Meal> _favorites = [];

  List<Meal> get favorites {
    return _favorites;
  }

  void toggleLike(String mealId) {
    final mealIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    if (mealIndex < 0) {
      _favorites.add(list.firstWhere((meal) => meal.id == mealId));
    } else {
      _favorites.removeWhere((meal) => meal.id == mealId);
    }
  }

  List<Meal> get list {
    return _list;
  }
}
