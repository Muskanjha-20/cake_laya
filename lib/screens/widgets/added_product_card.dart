import 'package:flutter/material.dart';

class AddedProductCard extends StatelessWidget {
  const AddedProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.onTapMinus,
    required this.onTapPlus,
  });
  final String title;
  final String image;
  final String price;
  final String quantity;
  final VoidCallback onTapMinus;
  final VoidCallback onTapPlus;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image(
              height: 100,
              width: 100,
              image: AssetImage(image),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ " + price,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: onTapMinus,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: onTapPlus,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
