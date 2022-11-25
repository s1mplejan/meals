class Category {
  final String id;
  final String title;
  final String imageUrl;

  const Category({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}

class Categoreis {
  List<Category> _list = [
    Category(
      id: 'c1',
      title: 'Fast food',
      imageUrl: 'assets/images/burger.jpg',
    ),
    Category(
      id: 'c2',
      title: 'Milliy taomlar',
      imageUrl: 'assets/images/osh.jpg',
    ),
    Category(
      id: 'c3',
      title: 'Italia taomlari',
      imageUrl: 'assets/images/pizza.jpg',
    ),
    Category(
      id: 'c4',
      title: 'Fransiya taomlari',
      imageUrl: 'assets/images/fransiya.jpg',
    ),
    Category(
      id: 'c5',
      title: 'Ichimliklar',
      imageUrl: 'assets/images/cola.jpg',
    ),
    Category(
      id: 'c6',
      title: 'Salatlar',
      imageUrl: 'assets/images/salat.jpg',
    ),
  ];

  List<Category> get list {
    return _list;
  }
}
