class Product {
  int id;
  double price;
  String title;
  String description;
  String image;
  String category;
  Rating rating;
  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.image,
      required this.rating});
}

class Rating {
  double rate;
  int count;
  Rating({required this.count, required this.rate});
}
