import 'package:flutter/material.dart';
import 'package:shoes_shop/components/shoe_tile.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // add shoe to cart
    void addShoeToCart(Shoe shoe) {
      Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

      // alert the user, shoe successfully added to cart
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text(
              'Seccessfully added!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Check your cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    }

    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'everyone flies... some fly longer than others',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),

          // hot picks
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Picks🔥',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // list of shoes for sale
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                // get a shoe from shop list
                Shoe shoe = value.getShoesList()[index];

                // return the shoe
                return ShoeTile(
                  shoe: shoe,
                  onTap: () {
                    addShoeToCart(shoe);
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 25,
              right: 25,
              left: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
