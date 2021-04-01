import 'package:e_commerce/util/color_converter_extension.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String productId, name, image, description, price, size;
  Color color;

  ProductModel({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.image,
    this.size,
    this.color,
  });

  ProductModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return;
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];
    size = map['size'];
    color = HexColor.fromHex(map['color']);
  }

  toJson() => {
        'productId': productId,
        'name': name,
        'image': image,
        'description': description,
        'price': price,
        'size': size,
        'color': color,
      };
}
