import 'package:cake_laya/providers/cart_provider.dart';
import 'package:cake_laya/screens/widgets/added_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cart"),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          print(value.cartItems);
          return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: value.cartItems.length,
              itemBuilder: (context, index) {
                return AddedProductCard(
                  title: value.cartItems[index].cakeName!,
                  image: value.cartItems[index].image!,
                  price: value.cartItems[index].price!.toString(),
                  // quantity: value.cartItems.length,
                  quantity: value.cartItems[index].quantity!.toString(),

                  onTapMinus: () {
                    // if (value.cartItems[index].quantity! >= 1) {
                    //   value.decreaseQuantity(
                    //       index, value.cartItems[index].quantity!);
                    // } else {
                    //   value.removeCartItem(index);
                    // }
                    value.decreaseQuantity(
                        index, value.cartItems[index].quantity!);
                  },
                  onTapPlus: () {
                    value.increaseQuantity(
                        index, value.cartItems[index].quantity!);
                  },
                );
              });
        },
      ),
    );
  }
}
