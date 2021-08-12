class Item {
  final String name;
  final String picture;
  final String details;
  final double price;
  final int parcels;
  final double fee;
  bool isFavorite;

  Item({
    required this.name,
    required this.picture,
    required this.details,
    required this.price,
    required this.parcels,
    required this.fee,
    this.isFavorite = false,
  });

}
