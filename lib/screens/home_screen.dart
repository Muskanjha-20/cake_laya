import 'package:cake_laya/models/cart_model.dart';
import 'package:cake_laya/providers/cart_provider.dart';
import 'package:cake_laya/screens/cart_screen.dart';
import 'package:cake_laya/screens/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> products = [
    ProductModel(
      cakeName: 'Chocolate cake',
      price: 279,
      image: 'assets/cake1.png',
      weight: '0.5 kg',
      flavour: 'Chocolate',
      quantity: 0,
    ),
    ProductModel(
      cakeName: 'Strawberry cake',
      price: 276,
      image: 'assets/cake2.png',
      weight: '0.6 kg',
      flavour: 'Strawberry',
      quantity: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Cake",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return ProductCardWidget(
                          cakeName: products[index].cakeName!,
                          price: products[index].price.toString(),
                          weight: products[index].weight!,
                          flavour: products[index].flavour!,
                          cakeImage: products[index].image!,
                          quantity: value.cartItems.length,
                          onTapMinus: () {
                            value.removeCartItem(index);
                          },
                          onTapPlus: () {
                            value.addToCart(
                              products[index].cakeName!,
                              products[index].image!,
                              products[index].weight!,
                              products[index].flavour!,
                              products[index].price!,
                              products[index].quantity!,
                            );
                          });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MaterialButton(
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          },
          child: const Text(
            "Go to Cart",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
