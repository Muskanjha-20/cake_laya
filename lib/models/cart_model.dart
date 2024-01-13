class ProductModel {
  final String? cakeName;
  final int? price;
  final String? image;
  final String? weight;
  final String? flavour;
  int? quantity;

  ProductModel({
    required this.cakeName,
    required this.price,
    required this.image,
    required this.weight,
    required this.flavour,
    required this.quantity,
  });

  ProductModel.fromMap(Map<dynamic, dynamic> res)
      : cakeName = res["cakeName"],
        weight = res["weight"],
        price = res["price"],
        flavour = res["flavour"],
        image = res["image"],
        quantity = res["quantity"];

  Map<String, Object?> toMap() {
    return {
      'flavour': flavour,
      'weight': weight,
      'cakeName': cakeName,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
}
