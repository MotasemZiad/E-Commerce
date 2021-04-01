class CartProductModel {
  String productId, name, image, price;
  int quantity;

  CartProductModel({
    this.productId,
    this.name,
    this.price,
    this.image,
    this.quantity,
  });

  CartProductModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return;
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJson() => {
        'productId': productId,
        'name': name,
        'image': image,
        'price': price,
        'quantity': quantity,
      };
}
