class Item {
  final String name;
  final String unit;
  final int price;
  final int size;
  final String image;
  bool favor;
  final String category;
  int count;

  Item(
      {required this.name,
      required this.unit,
      required this.price,
      required this.image,
      required this.size,
      required this.favor,
      required this.category,
      this.count = 1});

  Map toJson() {
    return {
      'name': name,
      'unit': unit,
      'price': price,
      'image': image,
    };
  }
}

List<Item> PRODUCTS = [];
