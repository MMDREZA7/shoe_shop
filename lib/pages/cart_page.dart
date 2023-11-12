import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/models/cart.dart';

import '../components/cart_item.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Text(
              'My Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // get individual shoe
                  Shoe indevidualShoe = value.getUserCart()[index];

                  // return the Cart item
                  return CartItem(shoe: indevidualShoe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
