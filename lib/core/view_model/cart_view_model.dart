import 'package:e_commerce/core/services/db/cart_database_helper.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProducts();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (var i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (var i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += double.parse(_cartProductModel[index].price);
    await dbHelper.updateProduct(cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (!(_cartProductModel[index].quantity <= 1)) {
      _cartProductModel[index].quantity--;
      _totalPrice -= double.parse(_cartProductModel[index].price);
      await dbHelper.updateProduct(cartProductModel[index]);
    }
    update();
  }
}
