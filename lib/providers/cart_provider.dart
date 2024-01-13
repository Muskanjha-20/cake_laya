import 'package:cake_laya/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> cartItems = [];

  addToCart(
    String name,
    String image,
    String weight,
    String flavour,
    int price,
    int quantity,
  ) {
    bool existingProduct = false;
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].cakeName == name) {
        cartItems[i].quantity = quantity + 1;
        existingProduct = true;
        break;
      }
    }
    if (existingProduct == false) {
      cartItems.add(
        ProductModel(
          cakeName: name,
          price: price,
          image: image,
          weight: weight,
          flavour: flavour,
          quantity: quantity,
        ),
      );
    }

    notifyListeners();
  }

  removeCartItem(int index) {
    cartItems.removeAt(
      index,
    );
    notifyListeners();
  }

  increaseQuantity(int index, int quantity) {
    cartItems[index].quantity = quantity + 1;

    notifyListeners();
  }

  decreaseQuantity(int index, int quantity) {
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].quantity! > 1) {
        cartItems[index].quantity = quantity - 1;
      } else {
        removeCartItem(index);
      }
    }
    // cartItems[index].quantity = quantity - 1;

    notifyListeners();
  }
}
